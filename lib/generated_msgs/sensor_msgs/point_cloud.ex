defmodule Elixir.SensorMsgs.PointCloud do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          points: list(Elixir.GeometryMsgs.Point32.t()),
          channels: list(Elixir.SensorMsgs.ChannelFloat32.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, points: [], channels: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "d8e9c3f5afbdd8a130fd1d2763945fca"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Point32[] points
      float32 x
      float32 y
      float32 z
    sensor_msgs/ChannelFloat32[] channels
      string name
      float32[] values
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      points: :"geometry_msgs/Point32[]",
      channels: :"sensor_msgs/ChannelFloat32[]"
    ]
end