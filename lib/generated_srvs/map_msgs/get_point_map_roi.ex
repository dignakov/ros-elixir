defmodule Elixir.MapMsgs.GetPointMapROI do
  @moduledoc false

  defmodule Elixir.MapMsgs.GetPointMapROI.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            x: float(),
            y: float(),
            z: float(),
            r: float(),
            l_x: float(),
            l_y: float(),
            l_z: float()
          }

    defstruct x: 0.0, y: 0.0, z: 0.0, r: 0.0, l_x: 0.0, l_y: 0.0, l_z: 0.0

    def types,
      do: [
        x: :float64,
        y: :float64,
        z: :float64,
        r: :float64,
        l_x: :float64,
        l_y: :float64,
        l_z: :float64
      ]
  end

  defmodule Elixir.MapMsgs.GetPointMapROI.Response do
    @moduledoc false
    @type t :: %__MODULE__{sub_map: Elixir.SensorMsgs.PointCloud2.t()}

    defstruct sub_map: %Elixir.SensorMsgs.PointCloud2{}

    def types, do: [sub_map: :"sensor_msgs/PointCloud2"]
  end

  def md5sum, do: "d955594b5ccde9615cbe5aed9442f733"

  def definition do
    """
    float64 x
    float64 y
    float64 z
    float64 r
    float64 l_x
    float64 l_y
    float64 l_z
    ---
    sensor_msgs/PointCloud2 sub_map
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