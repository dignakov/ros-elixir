defmodule Elixir.GeometryMsgs.Polygon do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{points: list(Elixir.GeometryMsgs.Point32.t())}

  defstruct points: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "cd60a26494a087f577976f0329fa120e"

  @impl ROS.Message.Behaviour
  def definition do
    """
    geometry_msgs/Point32[] points
      float32 x
      float32 y
      float32 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [points: :"geometry_msgs/Point32[]"]
end