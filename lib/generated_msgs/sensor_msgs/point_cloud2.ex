defmodule Elixir.SensorMsgs.PointCloud2 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          height: non_neg_integer(),
          width: non_neg_integer(),
          fields: list(Elixir.SensorMsgs.PointField.t()),
          is_bigendian: atom(),
          point_step: non_neg_integer(),
          row_step: non_neg_integer(),
          data: list(non_neg_integer()),
          is_dense: atom()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            height: 0,
            width: 0,
            fields: [],
            is_bigendian: false,
            point_step: 0,
            row_step: 0,
            data: [],
            is_dense: false

  @impl ROS.Message.Behaviour
  def md5sum, do: "1158d486dd51d683ce2f1be655c3c181"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
  def types,
    do: [
      header: :"std_msgs/Header",
      height: :uint32,
      width: :uint32,
      fields: :"sensor_msgs/PointField[]",
      is_bigendian: :bool,
      point_step: :uint32,
      row_step: :uint32,
      data: :"uint8[]",
      is_dense: :bool
    ]
end