defmodule ROS.Subscriber do
  use GenServer
  use Private
  require Logger
  import ROS.Helpers, only: [partial: 3]

  alias ROS.MasterApi, as: Api
  alias ROS.Message.ConnectionHeader, as: ConnHead
  alias ROS.TCP

  @moduledoc false

  ## Client API

  @spec request(%ROS.Subscriber{}, atom(), String.t(), String.t(), [[String.t()]]) :: :ok
  def request(sub, node_name, topic, publisher_uri, transport) do
    sub
    |> NodeName.of()
    |> GenServer.cast({:request, [node_name, topic, transport, publisher_uri]})
  end

  @enforce_keys [:topic, :type]
  defstruct @enforce_keys ++ [:node_name, :uri, :listeners, :callback]

  ## Server API

  def start_link(sub) do
    GenServer.start_link(__MODULE__, sub, name: NodeName.of(sub))
  end

  @impl GenServer
  def init(sub = %__MODULE__{}) do
    # Tell master we subscribe to this topic.
    Api.register_subscriber(sub)

    # See if a publisher already exists for this topic.
    look_for_publishers(sub)

    {:ok, %{sub: sub}}
  end

  @impl GenServer
  # Ignore duplicate requests when already connected.
  def handle_info({:request, _pub}, %{socket: _} = state) do
    Logger.debug("[Subscriber #{state.sub.node_name} #{state.sub.topic}] already connected; ignoring request")
    {:noreply, state}
  end

  def handle_info({:request, pub}, state) do
    apply(&do_request/4, pub)
    {:noreply, state}
  end

  # First full packet after connect is the connection header
  def handle_info({:tcp, _socket, packet}, %{init: true} = state) do
    partial(packet, state, fn full_message ->
      _header = ROS.Message.ConnectionHeader.parse(full_message)
      # TODO: validate md5sum/type here if needed
      Map.delete(state, :init)
    end)
  end

  # Forward incoming messages to listeners list
  def handle_info({:tcp, _socket, packet}, %{sub: %{listeners: listeners, type: type} = sub} = state)
      when is_list(listeners) do
    partial(packet, state, fn full_message ->
      incoming = ROS.Message.deserialize(full_message, type)
      Enum.each(listeners, &GenServer.cast(&1, {:subscription, NodeName.of(sub), incoming}))
      state
    end)
  end

  # Or call a single callback if provided
  def handle_info({:tcp, _socket, packet}, %{sub: %{callback: callback, type: type}} = state)
      when is_function(callback, 1) do
    partial(packet, state, fn full_message ->
      full_message
      |> ROS.Message.deserialize(type)
      |> callback.()
      state
    end)
  end

  def handle_info({:tcp_closed, socket}, state) do
    Logger.debug("[Subscriber #{state.sub.node_name} #{state.sub.topic}] TCP closed")
    :gen_tcp.close(socket)
    {:noreply, Map.delete(state, :socket)}
  end

  @impl GenServer
  def handle_cast({:request, pub}, state) do
    apply(&do_request/4, pub)
    {:noreply, state}
  end

  # If we’re already connected, ignore duplicate connect attempts
  def handle_cast({:connect, _ip, _port, _proto}, %{socket: _} = state) do
    Logger.debug("[Subscriber #{state.sub.node_name} #{state.sub.topic}] already connected; ignoring duplicate connect")
    {:noreply, state}
  end

  def handle_cast({:connect, ip, port, "TCPROS"}, %{sub: sub} = state) do
    # Open TCP to publisher
    {:ok, socket} =
      ip
      |> String.to_charlist()
      |> :gen_tcp.connect(port, [:binary, packet: 0])

    :ok = :gen_tcp.controlling_process(socket, self())
    :ok = :inet.setopts(socket, active: true)

    # Send connection header
    :ok =
      sub
      |> ConnHead.from()
      |> ConnHead.serialize()
      |> TCP.send(socket)

    new_state =
      state
      |> Map.put(:socket, socket)
      |> Map.put(:init, true)

    Logger.debug("[Subscriber #{sub.node_name} #{sub.topic}] connected to #{ip}:#{port} via TCPROS")
    {:noreply, new_state}
  end

  # -------------------- Private --------------------

  private do
    # Ask a specific publisher (by XML-RPC URI) for TCPROS transport details.
    @spec do_request(atom(), String.t(), [[String.t()]], String.t()) :: :ok
    defp do_request(node_name, topic, transport, publisher_uri) do
      node_s = Atom.to_string(node_name)
      Logger.debug("[Subscriber #{node_s} #{topic}] requestTopic -> #{publisher_uri}")

      case Api.request_topic(node_s, topic, transport, publisher_uri) do
        {:ok, [1, _msg, [proto, ip, port]]} ->
          Logger.debug("[Subscriber #{node_s} #{topic}] requestTopic OK -> #{proto} #{ip}:#{port} (connecting)")
          GenServer.cast(self(), {:connect, ip, port, proto})
          :ok

        {:ok, [-1, reason, []]} ->
          Logger.debug("[Subscriber #{node_s} #{topic}] requestTopic NEGATIVE -> #{inspect(reason)}; will retry in 1000ms")
          Process.send_after(self(), {:request, [node_name, topic, transport, publisher_uri]}, 1_000)
          :ok

        {:error, err} ->
          Logger.debug("[Subscriber #{node_s} #{topic}] requestTopic ERROR -> #{inspect(err)}; will retry in 1500ms")
          Process.send_after(self(), {:request, [node_name, topic, transport, publisher_uri]}, 1_500)
          :ok

        other ->
          Logger.debug("[Subscriber #{node_s} #{topic}] requestTopic UNEXPECTED -> #{inspect(other)}; will retry in 1500ms")
          Process.send_after(self(), {:request, [node_name, topic, transport, publisher_uri]}, 1_500)
          :ok
      end
    end

    # On startup, check if any publishers already exist for this topic and subscribe.
    defp look_for_publishers(sub) do
      case Api.get_system_state(NodeName.of(sub)) do
        [1, _msg, [pubs, _subs, _services]] ->
          pubs
          |> Enum.filter(fn [topic, _] -> topic == sub.topic end)
          |> Enum.flat_map(fn [_topic, pub_nodes] -> pub_nodes end)
          |> subscribe_to(sub)

        other ->
          Logger.debug("[Subscriber #{sub.node_name} #{sub.topic}] getSystemState -> #{inspect(other)}")
          :ok
      end
    end

    defp subscribe_to([], _sub), do: :ok

    defp subscribe_to([pub_name | _], sub) do
      case Api.lookup_node(NodeName.of(sub), pub_name) do
        [1, _msg, pub_uri] ->
          request(sub, sub.node_name, sub.topic, pub_uri, [["TCPROS"]])
          :ok

        other ->
          Logger.debug("[Subscriber #{sub.node_name} #{sub.topic}] lookup_node(#{pub_name}) -> #{inspect(other)}")
          :ok
      end
    end
  end
end
