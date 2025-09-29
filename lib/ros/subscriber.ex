defmodule ROS.Subscriber do
  use GenServer
  require Logger
  import ROS.Helpers, only: [partial: 3]

  alias ROS.MasterApi, as: Api
  alias ROS.Message.ConnectionHeader, as: ConnHead
  alias ROS.TCP

  @moduledoc false

  ## Client API

  @enforce_keys [:topic, :type]
  defstruct @enforce_keys ++ [:node_name, :uri, :listeners, :callback]

  @doc """
  Ask this subscriber to connect to a publisher (triggered by SlaveApi).
  """
  @spec request(%ROS.Subscriber{}, atom(), String.t(), String.t(), [[String.t()]]) :: :ok
  def request(sub, node_name, topic, publisher_uri, transport) do
    sub
    |> NodeName.of()
    |> GenServer.cast({:request, [node_name, topic, transport, publisher_uri]})
  end

  @doc false
  def start_link(sub) do
    GenServer.start_link(__MODULE__, sub, name: NodeName.of(sub))
  end

  ## Server API

  @impl GenServer
  def init(sub = %__MODULE__{}) do
    # Tell master there's a new subscriber
    Api.register_subscriber(sub)

    # Try to find existing publishers for this topic
    look_for_publishers(sub)

    # Multi-connection state:
    #  - :sockets => %{socket => {host, port}}
    #  - :buffers => %{socket => <<pending binary>>}
    #  - :waiting_hdr => MapSet of sockets that still expect the connection header
    {:ok, %{sub: sub, sockets: %{}, buffers: %{}, waiting_hdr: MapSet.new()}}
  end

  # ----- Subscription connection orchestration -----

  @impl GenServer
  def handle_cast({:request, [node_name, topic, transport, publisher_uri]}, state) do
    request_topic(node_name, topic, transport, publisher_uri)
    {:noreply, state}
  end

  # If we’re already connected to this host:port, ignore duplicate connect attempts
  @impl GenServer
  def handle_cast({:connect, ip, port, "TCPROS"}, %{sockets: sockets} = state)
      when is_map(sockets) do
    already? =
      sockets
      |> Map.values()
      |> Enum.any?(fn {h, p} -> h == ip and p == port end)

    if already? do
      Logger.debug(fn ->
        "[Subscriber #{state.sub.node_name} #{state.sub.topic}] already connected; ignoring duplicate connect"
      end)

      {:noreply, state}
    else
      do_connect_tcpros(ip, port, state)
    end
  end

  # Fallback when :sockets map hasn't been initialized (defensive)
  @impl GenServer
  def handle_cast({:connect, ip, port, "TCPROS"}, state) do
    state = Map.merge(%{sockets: %{}, buffers: %{}, waiting_hdr: MapSet.new()}, state)
    do_connect_tcpros(ip, port, state)
  end

  # Unsupported protocol — just log and ignore
  @impl GenServer
  def handle_cast({:connect, ip, port, proto}, state) do
    Logger.debug(fn ->
      "[Subscriber #{state.sub.node_name} #{state.sub.topic}] unsupported protocol #{inspect(proto)} from #{ip}:#{port}; ignoring"
    end)

    {:noreply, state}
  end

  # ----- TCP handling -----

  @impl GenServer
  def handle_info({:tcp, socket, packet}, %{buffers: buffers} = state) do
    buf0 = Map.get(buffers, socket, <<>>)
    buf = buf0 <> packet

    # Extract as many length-prefixed frames as we can
    {frames, rest} = take_frames(buf, [])

    state = put_in(state.buffers, Map.put(buffers, socket, rest))

    Enum.reduce(frames, state, fn frame, acc ->
      # First full frame after connect is the connection header for that socket
      if MapSet.member?(acc.waiting_hdr, socket) do
        _ = ConnHead.parse(frame) # could validate MD5/type if desired
        waiting = MapSet.delete(acc.waiting_hdr, socket)
        %{acc | waiting_hdr: waiting}
      else
        dispatch_message(frame, acc, socket)
      end
    end)
    |> noreply()
  end

  @impl GenServer
  def handle_info({:tcp_closed, socket}, state) do
    Logger.debug(fn -> "[Subscriber #{state.sub.node_name} #{state.sub.topic}] TCP connection closed" end)

    :ok = safe_close(socket)

    sockets = Map.delete(state.sockets, socket)
    buffers = Map.delete(state.buffers, socket)
    waiting = MapSet.delete(state.waiting_hdr, socket)

    {:noreply, %{state | sockets: sockets, buffers: buffers, waiting_hdr: waiting}}
  end

  # ----- Helpers -------------------------------------------------------------

  defp noreply(state), do: {:noreply, state}

  defp safe_close(socket) do
    try do
      :gen_tcp.close(socket)
    catch
      _, _ -> :ok
    end
  end

  # Connect using TCPROS, send connection header, prep per-socket state.
  defp do_connect_tcpros(ip, port, %{sub: sub} = state) do
    # :gen_tcp can resolve hostnames when given a charlist
    host_charlist =
      case ip do
        s when is_binary(s) -> String.to_charlist(s)
        other -> other
      end

    {:ok, socket} = :gen_tcp.connect(host_charlist, port, [:binary, packet: 0])
    :ok = :gen_tcp.controlling_process(socket, self())

    # Send the ROS connection header
    :ok =
      sub
      |> ConnHead.from()
      |> ConnHead.serialize()
      |> TCP.send(socket)

    sockets = Map.put(state.sockets, socket, {ip, port})
    buffers = Map.put(state.buffers, socket, <<>>)
    waiting = MapSet.put(state.waiting_hdr, socket)

    Logger.debug(fn -> "[Subscriber #{sub.node_name} #{sub.topic}] connected to #{ip}:#{port} via TCPROS" end)

    {:noreply, %{state | sockets: sockets, buffers: buffers, waiting_hdr: waiting}}
  end

  # After we have a complete frame and the header has been seen, decode and dispatch
  defp dispatch_message(frame, %{sub: %{type: type, listeners: listeners, callback: cb}} = state, _socket) do
    message = ROS.Message.deserialize(frame, type)

    # Send to listeners first (if any)
    if is_list(listeners) do
      Enum.each(listeners, &GenServer.cast(&1, {:subscription, NodeName.of(state.sub), message}))
    end

    # Then direct callback (if any)
    if is_function(cb, 1), do: cb.(message)

    state
  end

  # Parse as many ROS length-prefixed frames as possible from a buffer
  # Each frame is: <u32 little-endian length><bytes...>
  defp take_frames(<<>>, acc), do: {Enum.reverse(acc), <<>>}

  defp take_frames(<<len::little-unsigned-32, rest::binary>>, acc) when byte_size(rest) >= len do
    <<frame::binary-size(len), tail::binary>> = rest
    take_frames(tail, [frame | acc])
  end

  defp take_frames(buffer, acc), do: {Enum.reverse(acc), buffer}

  # Ask a publisher's XML-RPC for transport details; on success, connect once.
  defp request_topic(node_name, topic, transport, publisher_uri) do
    Logger.debug(fn -> "[Subscriber #{node_name} #{topic}] requestTopic -> #{publisher_uri}" end)

    caller_id = Atom.to_string(node_name)

    case Api.request_topic(caller_id, topic, transport, publisher_uri) do
      {:ok, [1, _msg, ["TCPROS", ip, port]]} ->
        Logger.debug(fn -> "[Subscriber #{node_name} #{topic}] requestTopic OK -> TCPROS #{ip}:#{port} (connecting)" end)
        GenServer.cast(self(), {:connect, ip, port, "TCPROS"})

      {:ok, [code, msg, _]} when code != 1 ->
        Logger.debug(fn -> "[Subscriber #{node_name} #{topic}] requestTopic remote said #{inspect(msg)}; will retry" end)
        retry_request(node_name, topic, transport, publisher_uri)

      {:error, reason} ->
        Logger.debug(fn -> "[Subscriber #{node_name} #{topic}] requestTopic error #{inspect(reason)}; will retry" end)
        retry_request(node_name, topic, transport, publisher_uri)

      other ->
        Logger.debug(fn -> "[Subscriber #{node_name} #{topic}] requestTopic unexpected: #{inspect(other)} (will retry)" end)
        retry_request(node_name, topic, transport, publisher_uri)
    end
  end

  defp retry_request(node_name, topic, transport, publisher_uri) do
    Process.send_after(self(), {:request, [node_name, topic, transport, publisher_uri]}, 1_000)
  end

  # On boot, connect to any publishers that already exist for this topic
  defp look_for_publishers(sub) do
    case Api.get_system_state(NodeName.of(sub)) do
      {:ok, [1, _desc, [pubs, _subs, _services]]} ->
        pubs
        |> Enum.filter(fn [t, _pubs] -> t == sub.topic end)
        |> Enum.flat_map(fn [_topic, topic_pubs] -> topic_pubs end)
        |> Enum.each(&connect_to_pub_name(sub, &1))

      other ->
        Logger.debug(fn -> "[Subscriber #{sub.node_name} #{sub.topic}] getSystemState -> #{inspect(other)}" end)
        :ok
    end
  end

  defp connect_to_pub_name(sub, pub_name) do
    case Api.lookup_node(NodeName.of(sub), pub_name) do
      {:ok, [1, _msg, pub_uri]} ->
        request(sub, sub.node_name, sub.topic, pub_uri, [["TCPROS"]])
        :ok

      other ->
        Logger.debug(fn -> "[Subscriber #{sub.node_name} #{sub.topic}] lookup_node(#{pub_name}) -> #{inspect(other)}" end)
        :ok
    end
  end
end
