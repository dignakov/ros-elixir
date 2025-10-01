defmodule Elixir.GeometryMsgs.Pose do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          position: Elixir.GeometryMsgs.Point.t(),
          orientation: Elixir.GeometryMsgs.Quaternion.t()
        }

  defstruct position: %Elixir.GeometryMsgs.Point{}, orientation: %Elixir.GeometryMsgs.Quaternion{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "e45d45a5a1ce597b249e23fb30fc871f"

  @impl ROS.Message.Behaviour
  def definition do
    """
    geometry_msgs/Point position
      float64 x
      float64 y
      float64 z
    geometry_msgs/Quaternion orientation
      float64 x
      float64 y
      float64 z
      float64 w
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [position: :"geometry_msgs/Point", orientation: :"geometry_msgs/Quaternion"]
end