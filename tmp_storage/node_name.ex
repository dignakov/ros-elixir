# lib/ros/node_name.ex

defprotocol NodeName do
  @moduledoc """
  A protocol to generate a unique atom name for a ROS entity (Node,
  Publisher, Subscriber, etc.) so it can be registered as a GenServer.
  """
  def of(structure)
end
