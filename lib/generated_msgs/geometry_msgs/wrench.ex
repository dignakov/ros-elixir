defmodule Elixir.GeometryMsgs.Wrench do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          force: Elixir.GeometryMsgs.Vector3.t(),
          torque: Elixir.GeometryMsgs.Vector3.t()
        }

  defstruct force: %Elixir.GeometryMsgs.Vector3{}, torque: %Elixir.GeometryMsgs.Vector3{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "4f539cf138b23283b520fd271b567936"

  @impl ROS.Message.Behaviour
  def definition do
    """
    geometry_msgs/Vector3 force
      float64 x
      float64 y
      float64 z
    geometry_msgs/Vector3 torque
      float64 x
      float64 y
      float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [force: :"geometry_msgs/Vector3", torque: :"geometry_msgs/Vector3"]
end