defmodule Elixir.GeometryMsgs.Twist do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          linear: Elixir.GeometryMsgs.Vector3.t(),
          angular: Elixir.GeometryMsgs.Vector3.t()
        }

  defstruct linear: %Elixir.GeometryMsgs.Vector3{}, angular: %Elixir.GeometryMsgs.Vector3{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "9f195f881246fdfa2798d1d3eebca84a"

  @impl ROS.Message.Behaviour
  def definition do
    """
    geometry_msgs/Vector3 linear
      float64 x
      float64 y
      float64 z
    geometry_msgs/Vector3 angular
      float64 x
      float64 y
      float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [linear: :"geometry_msgs/Vector3", angular: :"geometry_msgs/Vector3"]
end