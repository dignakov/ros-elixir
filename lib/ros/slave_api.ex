defmodule ROS.SlaveApi do
  use GenServer
  use Private
  require Logger

  @moduledoc false

  @default_state %{
    remote_publishers: %{},   # topic => [uris]
    connected: %{}            # topic => MapSet(uris) we've already asked to connect
  }

  defstruct [:children, :node_name, :uri]

  # -- Public ---------------------------------------------------------------

  @spec start_link(struct()) :: GenServer.on_start()
  def start_link(server),
    do: GenServer.start_link(__MODULE__, server, name: NodeName.of(server))

  @impl GenServer
  def init(server), do: {:ok, consume(server)}

  @spec call(atom(), String.t(), [any()]) :: [any()]
  def call(name, method, args), do: GenServer.call(name, {method, args})

  @doc "Gets the master URI pointed to by the env var ROS_MASTER_URI"
  @spec master_uri() :: String.t() | nil
  def master_uri, do: System.get_env("ROS_MASTER_URI", "http://localhost:11311")

  # -- Helpers --------------------------------------------------------------

  defp norm_uri(uri) when is_binary(uri), do: String.trim_trailing(uri, "/")
  defp norm_uri(uri), do: uri

  defp self_uri?(pub_uri, {ip, cowboy_port}) do
    case URI.parse(pub_uri) do
      %URI{host: host, port: port} when is_binary(host) and is_integer(port) ->
        port == cowboy_port and (host == ip or host == "127.0.0.1")
      _ ->
        false
    end
  end

  # -- Callbacks ------------------------------------------------------------

  @impl GenServer
  def handle_call({"getMasterUri", [_]}, _from, state) do
    {:reply, [1, "ROS Master Uri", master_uri()], state}
  end

  # Zero publishers
  @impl GenServer
  def handle_call({"publisherUpdate", ["/master", topic, []]}, _from, state) do
    state =
      state
      |> put_in([:remote_publishers, topic], [])
      |> put_in([:connected, topic], MapSet.new())

    {:reply, [1, "ok", 0], state}
  end

  # Some publishers
  @impl GenServer
  def handle_call({"publisherUpdate", ["/master", topic, publisher_list]}, _from,
                  %{local_subs: all_subs, slave_api: %{uri: self_uri}} = state) do
    uris =
      publisher_list
      |> Enum.map(&norm_uri/1)
      |> Enum.uniq()
      |> Enum.reject(&self_uri?(&1, self_uri))

    Logger.debug(fn -> "[SlaveApi] publisherUpdate topic=#{inspect(topic)} uris=#{inspect(uris)}" end)

    state =
      put_in(state[:remote_publishers], Map.put(state.remote_publishers || %{}, topic, uris))

    case Map.fetch(all_subs || %{}, topic) do
      :error ->
        {:reply, [1, "no local sub", 1], state}

      {:ok, sub} ->
        already = Map.get(state.connected || %{}, topic, MapSet.new())
        to_connect = Enum.reject(uris, &MapSet.member?(already, &1))

        Logger.debug(fn ->
          ~s([SlaveApi] topic=#{inspect(topic)} already=#{inspect(MapSet.to_list(already))} to_connect=#{inspect(to_connect)})
        end)

        Enum.each(to_connect, fn pub_uri ->
          Logger.debug(fn -> "[SlaveApi] requesting topic=#{topic} from pub_uri=#{pub_uri}" end)
          ROS.Subscriber.request(sub, sub.node_name, topic, pub_uri, [["TCPROS"]])
        end)

        new_connected = MapSet.union(already, MapSet.new(to_connect))
        state = put_in(state[:connected], Map.put(state.connected || %{}, topic, new_connected))

        {:reply, [1, "ok", 0], state}
    end
  end

  # Remote subscriber asks us (we're a publisher) how to connect
  @impl GenServer
  def handle_call({"requestTopic", [_caller_id, topic, [["TCPROS"]]]}, _from,
                  %{local_pubs: pubs, slave_api: %{uri: {ip, _}}} = state) do
    candidates = [topic, String.trim_leading(topic, "/"), "/" <> String.trim_leading(topic, "/")]
    pub = Enum.find_value(candidates, fn k -> Map.get(pubs || %{}, k) end)

    case pub do
      %ROS.Publisher{} = p ->
        port = ROS.Publisher.connect(p, "TCPROS")
        {:reply, [1, "ready on http://#{ip}:#{port}", ["TCPROS", ip, port]], state}

      _ ->
        Logger.warning(fn -> "no local publisher for #{inspect(topic)} in slave api" end)
        {:reply, [-1, "no local publisher for #{topic}", []], state}
    end
  end

  # Fallback
  @impl GenServer
  def handle_call({fun, _}, _from, state) do
    Logger.warning(fn -> "no implementation for #{fun} in slave api" end)
    {:reply, [-1, "method not found", fun], state}
  end

  # -- Private --------------------------------------------------------------

  private do
    @spec consume(%ROS.SlaveApi{}) :: map()
    defp consume(%ROS.SlaveApi{children: children} = slave_api) do
      children
      |> Enum.reduce(%{}, &add_to_map/2)
      |> Map.merge(@default_state)
      |> Map.put(:slave_api, slave_api)
    end

    defp add_to_map({ROS.Publisher, pub}, acc) do
      Map.update(acc, :local_pubs, %{pub.topic => pub}, fn m -> Map.put(m, pub.topic, pub) end)
    end

    defp add_to_map({ROS.Subscriber, sub}, acc) do
      Map.update(acc, :local_subs, %{sub.topic => sub}, fn m -> Map.put(m, sub.topic, sub) end)
    end

    defp add_to_map(_, acc), do: acc
  end
end
