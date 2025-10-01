defmodule Elixir.MapMsgs.GetPointMap do
  @moduledoc false

  defmodule Elixir.MapMsgs.GetPointMap.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.MapMsgs.GetPointMap.Response do
    @moduledoc false
    @type t :: %__MODULE__{map: Elixir.SensorMsgs.PointCloud2.t()}

    defstruct map: %Elixir.SensorMsgs.PointCloud2{}

    def types, do: [map: :"sensor_msgs/PointCloud2"]
  end

  def md5sum, do: "b84fbb39505086eb6a62d933c75cb7b4"

  def definition do
    """
    ---
    sensor_msgs/PointCloud2 map
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
end