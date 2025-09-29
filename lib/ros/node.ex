defprotocol NodeName do
  @moduledoc false
  # gives atom names to things, so they can be called as GenServers
  def of(structure)
end

defmodule ROS.Node do
  use Supervisor
  use Private
  require Logger

  @moduledoc false

  defstruct [:name, :children]

  @behaviour :cowboy_handler

  @xml_header %{"Content-Type" => "text/xml"}

  @doc false
  @spec start_link(%ROS.Node{}) :: {:ok, pid()}
  def start_link(ros_node) do
    bootstrap()

    server = %ROS.SlaveApi{node_name: ros_node.name}

    dispatch =
      :cowboy_router.compile([
        {:_, [{:_, __MODULE__, [NodeName.of(server)]}]}
      ])

    Supervisor.start_link(__MODULE__, {ros_node, server, dispatch},
      name: ros_node.name
    )
  end

  @impl Supervisor
  def init({ros_node, server, dispatch}) do
    uri =
      server
      |> NodeName.of()
      |> start_server(dispatch)

    # 1) Update each child tuple with node_name/uri (tuples are what SlaveApi expects)
    children_tuples =
      ros_node.children
      |> Enum.map(&inform_tuple(&1, ros_node.name, uri))
      # ensure they stay as {Module, struct}
      |> Enum.map(fn {mod, struct} -> {mod, struct} end)

    # 2) Turn those tuples into proper child_specs with unique ids (for Supervisor)
    child_specs = Enum.map(children_tuples, &to_child_spec/1)

    # 3) Supervise the Slave API; pass it the ORIGINAL tuples, not specs
    slave_spec =
      Supervisor.child_spec(
        {ROS.SlaveApi,
         %ROS.SlaveApi{node_name: ros_node.name, children: children_tuples, uri: uri}},
        id: {:slave_api, ros_node.name},
        type: :worker
      )

    Supervisor.init([slave_spec | child_specs], strategy: :one_for_one)
  end

  @impl :cowboy_handler
  def init(req, [api_server_name] = state) do
    # forward the message to the api server
    {:ok, handle(req, api_server_name), state}
  end

  @impl :cowboy_handler
  def terminate(_reason, _request, _state), do: :ok

  private do
    # startup things

    defp bootstrap do
      ROS.MasterApi.get_uri()
    end

    @spec start_server(atom(), any()) :: {String.t(), pos_integer()}
    defp start_server(name, dispatch) do
      :cowboy.start_clear(name, [], %{env: %{dispatch: dispatch}})
      {local_ip(), :ranch.get_port(name)}
    end

    @spec local_ip() :: String.t()
    defp local_ip do
      {:ok, ips} = :inet.getif()

      ips
      |> Enum.map(fn {ip, _broadaddr, _mast} -> ip end)
      |> Enum.reject(fn ip -> ip == {127, 0, 0, 1} end)
      |> List.first()
      |> Tuple.to_list()
      |> Enum.join(".")
    end

    # --- child plumbing -----------------------------------------------------

    # Update the tuple with node_name/uri (keeps shape {Module, struct})
    @spec inform_tuple({module(), struct()}, atom(), {String.t(), pos_integer()}) ::
            {module(), struct()}
    defp inform_tuple({mod, child}, name, uri) do
      {mod, %{child | node_name: name, uri: uri}}
    end

    # Build a child_spec with a unique id for Supervisor
    @spec to_child_spec({module(), struct()}) :: Supervisor.child_spec()
    defp to_child_spec({mod, child} = tuple) do
      Supervisor.child_spec(
        {mod, child},
        id: child_id(tuple),
        type: :worker
      )
    end

    # Stable unique ids per child type (so multiple publishers/subscribers can coexist)
    defp child_id({ROS.Publisher, %ROS.Publisher{name: name}}), do: {:publisher, name}
    defp child_id({ROS.Subscriber, %ROS.Subscriber{topic: topic}}), do: {:subscriber, topic}
    defp child_id({ROS.Service, %ROS.Service{service: svc}}), do: {:service, svc}
    defp child_id({mod, _}), do: {:child, mod}

    # --- cowboy XML-RPC handler --------------------------------------------

    @spec handle(any(), atom()) :: any()
    defp handle(req, api_server_name) do
      with true <- :cowboy_req.has_body(req),
           {:ok, body, _req} <- :cowboy_req.read_body(req),
           {:ok, %XMLRPC.MethodCall{} = parsed} <- XMLRPC.decode(body) do
        :cowboy_req.reply(200, @xml_header, reply(parsed, api_server_name), req)
      else
        a ->
          Logger.error(a)
          req
      end
    end

    @spec reply(%XMLRPC.MethodCall{}, atom()) :: binary()
    defp reply(
           %XMLRPC.MethodCall{method_name: fun, params: args} = msg,
           api_server_name
         ) do
      Logger.debug(fn -> "Received #{inspect(msg)}." end)
      return = ROS.SlaveApi.call(api_server_name, fun, args)
      XMLRPC.encode!(%XMLRPC.MethodResponse{param: return})
    end
  end
end
