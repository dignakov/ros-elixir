defmodule Elixir.MapMsgs.PointCloud2Update do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          type: non_neg_integer(),
          points: Elixir.SensorMsgs.PointCloud2.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, type: 0, points: %Elixir.SensorMsgs.PointCloud2{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "6c58e4f249ae9cd2b24fb1ee0f99195e"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint32 ADD=0
    uint32 DELETE=1
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    uint32 type
    sensor_msgs/PointCloud2 points
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      uint32 height
      uint32 width
      sensor_msgs/PointField[] fields
        uint8 INT8=1
        uint8 UINT8=2
        uint8 INT16=3
        uint8 UINT16=4
        uint8 INT32=5
        uint8 UINT32=6
        uint8 FLOAT32=7
        uint8 FLOAT64=8
        string name
        uint32 offset
        uint8 datatype
        uint32 count
      bool is_bigendian
      uint32 point_step
      uint32 row_step
      uint8[] data
      bool is_dense
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", type: :uint32, points: :"sensor_msgs/PointCloud2"]

  def add, do: 0

  def delete, do: 1
end