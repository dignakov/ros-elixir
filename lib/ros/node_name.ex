defprotocol NodeName do
  @moduledoc false
  def of(struct)
end

defimpl NodeName, for: ROS.Service do
  def of(%ROS.Service{service: svc}), do: String.to_atom(svc)
end

defimpl NodeName, for: ROS.SlaveApi do
  # name of the Cowboy XML-RPC server GenServer for this node
  def of(%ROS.SlaveApi{node_name: node_name}),
    do: String.to_atom("#{node_name}_xml_rpc_server")
end

defimpl NodeName, for: ROS.Subscriber do
  # make each subscriber unique: "<node_name>_<topic>"
  def of(%ROS.Subscriber{node_name: node_name, topic: topic}),
    do: String.to_atom("#{node_name}_#{topic}")
end

defimpl NodeName, for: ROS.Publisher do
  # publishers already carry an atom name
  def of(%ROS.Publisher{name: name}), do: name
end
