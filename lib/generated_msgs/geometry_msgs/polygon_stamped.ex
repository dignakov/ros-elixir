defmodule Elixir.GeometryMsgs.PolygonStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          polygon: Elixir.GeometryMsgs.Polygon.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, polygon: %Elixir.GeometryMsgs.Polygon{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "c6be8f7dc3bee7fe9e8d296070f53340"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Polygon polygon
      geometry_msgs/Point32[] points
        float32 x
        float32 y
        float32 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", polygon: :"geometry_msgs/Polygon"]
end