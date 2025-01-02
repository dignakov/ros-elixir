defmodule ROS.SlaveApi do
  use GenServer
  use Private
  require Logger

  @moduledoc false
  # this module just keeps track of the publishers and subscribers of a node.
  # each node has 1 slave_api child.

  @default_state %{remote_publishers: %{}}

  defstruct [:children, :node_name, :uri]

  @spec start_link(Keyword.t()) :: :ok
  def start_link(server) do
    IO.puts("\n=== Starting SlaveApi ===")
    IO.inspect(server, label: "Initial server structure")
    GenServer.start_link(__MODULE__, server, name: NodeName.of(server))
  end

  @impl GenServer
  def init(server) do
    IO.puts("\n=== SlaveApi Init ===")
    state = consume(server)
    IO.puts("\nFinal state after init:")
    IO.inspect(state, pretty: true, label: "state")
    {:ok, state}
  end

  @spec call(atom(), String.t(), [any()]) :: [any()]
  def call(name, method, args), do: GenServer.call(name, {method, args})

  @doc "Gets the master URI pointed to by the env var ROS MASTER URI"
  @spec master_uri() :: String.t()
  def master_uri, do: System.get_env("ROS_MASTER_URI")

  @impl GenServer
  def handle_call({"getMasterUri", [_caller_id]}, _from, state) do
    {:reply, [1, "ROS Master Uri", master_uri()], state}
  end

  def handle_call({"publisherUpdate", ["/master", topic, []]}, _from, state) do
    IO.puts("\n=== Empty Publisher Update ===")
    IO.inspect(topic, label: "Topic")
    IO.inspect(state, label: "State before update")

    state = put_in(state[:remote_publishers], %{topic => []})
    IO.inspect(state, label: "State after update")

    {:reply, [1, "thanks for the update.", 0], state}
  end

  def handle_call(
        {"publisherUpdate", ["/master", topic, publisher_list]},
        _from,
        %{local_subs: all_subs} = state
      ) do
    IO.puts("\n=== Publisher Update ===")
    IO.inspect(topic, label: "Topic")
    IO.inspect(publisher_list, label: "Publisher list")
    IO.inspect(state, label: "Current state")

    state = put_in(state[:remote_publishers], %{topic => publisher_list})

    case Map.fetch(all_subs, topic) do
      :error ->
        IO.puts("No subscriber found for topic #{topic}")
        {:reply, [1, "go fish. i don't have that sub.", 1], state}

      {:ok, sub} ->
        IO.puts("Found subscriber for topic #{topic}")
        IO.inspect(sub, label: "Subscriber")
        pub = List.first(publisher_list)
        ROS.Subscriber.request(sub, sub.node_name, topic, pub, [["TCPROS"]])
        {:reply, [1, "publisher list for #{topic} updated.", 0], state}
    end
  end

  def handle_call(
        {"requestTopic", [_caller_id, topic, [["TCPROS"]]]},
        _from,
        %{local_pubs: pubs, slave_api: %{uri: {ip, _port}}} = state
      ) do
    IO.puts("\n=== Request Topic ===")
    IO.inspect(topic, label: "Requested topic")
    IO.inspect(pubs, label: "Available publishers")

    # get the first pub that has this topic and call its connect function
    found_pub = pubs
    |> Enum.find_value(fn {pub_topic, pub} ->
      IO.puts("\nChecking publisher:")
      IO.inspect(pub_topic, label: "Publisher topic")
      IO.inspect(pub, label: "Publisher")
      result = pub_topic == topic && pub
      IO.puts("Match result: #{!!result}")
      result
    end)

    IO.puts("\nFound publisher:")
    IO.inspect(found_pub, label: "Publisher to connect")

    port = found_pub && ROS.Publisher.connect(found_pub, "TCPROS")
    IO.puts("Assigned port: #{port}")

    {:reply, [1, "ready on http://#{ip}:#{port}", ["TCPROS", ip, port]], state}
  end

  def handle_call({fun, _params}, _from, state) do
    Logger.warning("no implementation for #{fun} in slave api")
    {:reply, [-1, "method not found", fun], state}
  end

  private do
    @spec consume(Keyword.t()) :: %{}
    defp consume(%ROS.SlaveApi{children: children} = slave_api) do
      IO.puts("\n=== Consuming Children ===")
      IO.inspect(children, pretty: true, label: "Initial children")

      result = children
      |> Enum.reduce(%{}, fn child, acc ->
        IO.puts("\nProcessing child:")
        IO.inspect(child, label: "Current child")
        IO.inspect(acc, label: "Accumulator before")
        result = add_to_map(child, acc)
        IO.inspect(result, label: "Accumulator after")
        result
      end)
      |> Map.merge(@default_state)
      |> Map.put(:slave_api, slave_api)

      IO.puts("\nFinal consumed state:")
      IO.inspect(result, pretty: true, label: "final")
      result
    end

    # defp add_to_map({ROS.Publisher, pub}, acc) do
    #   IO.puts("\nAdding publisher:")
    #   IO.inspect(pub, label: "Publisher")
    #   IO.inspect(pub.topic, label: "Topic")
    #   result = put_in(acc[:local_pubs], %{pub.topic => pub})
    #   IO.inspect(result, label: "Result")
    #   result
    # end

    # defp add_to_map({ROS.Subscriber, sub}, acc) do
    #   IO.puts("\nAdding subscriber:")
    #   IO.inspect(sub, label: "Subscriber")
    #   IO.inspect(sub.topic, label: "Topic")
    #   result = put_in(acc[:local_subs], %{sub.topic => sub})
    #   IO.inspect(result, label: "Result")
    #   result
    # end

    # defp add_to_map(other, acc) do
    #   IO.puts("\nSkipping other type:")
    #   IO.inspect(other)
    #   acc
    # end
    defp add_to_map({ROS.Publisher, pub}, acc) do
      IO.puts("\nAdding publisher:")
      IO.inspect(pub, label: "Publisher")
      IO.inspect(pub.topic, label: "Topic")

      # Get existing publishers or initialize empty map
      existing_pubs = Map.get(acc, :local_pubs, %{})
      IO.puts("Existing publishers:")
      IO.inspect(existing_pubs, label: "existing_pubs")

      # Merge new publisher into existing map
      result = Map.put(acc, :local_pubs, Map.put(existing_pubs, pub.topic, pub))

      IO.puts("Result after merge:")
      IO.inspect(result, label: "Result")
      result
    end

    defp add_to_map({ROS.Subscriber, sub}, acc) do
      IO.puts("\nAdding subscriber:")
      IO.inspect(sub, label: "Subscriber")
      IO.inspect(sub.topic, label: "Topic")

      # Get existing subscribers or initialize empty map
      existing_subs = Map.get(acc, :local_subs, %{})
      IO.puts("Existing subscribers:")
      IO.inspect(existing_subs, label: "existing_subs")

      # Merge new subscriber into existing map
      result = Map.put(acc, :local_subs, Map.put(existing_subs, sub.topic, sub))

      IO.puts("Result after merge:")
      IO.inspect(result, label: "Result")
      result
    end

    defp add_to_map(other, acc) do
      IO.puts("\nSkipping other type:")
      IO.inspect(other)
      acc
    end
  end
end

defimpl NodeName, for: ROS.SlaveApi do
  def of(%ROS.SlaveApi{node_name: node_name}) do
    String.to_atom("#{node_name}_xml_rpc_server")
  end
end
