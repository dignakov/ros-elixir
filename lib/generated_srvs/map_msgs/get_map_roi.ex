defmodule Elixir.MapMsgs.GetMapROI do
  @moduledoc false

  defmodule Elixir.MapMsgs.GetMapROI.Request do
    @moduledoc false
    @type t :: %__MODULE__{x: float(), y: float(), l_x: float(), l_y: float()}

    defstruct x: 0.0, y: 0.0, l_x: 0.0, l_y: 0.0

    def types, do: [x: :float64, y: :float64, l_x: :float64, l_y: :float64]
  end

  defmodule Elixir.MapMsgs.GetMapROI.Response do
    @moduledoc false
    @type t :: %__MODULE__{sub_map: Elixir.NavMsgs.OccupancyGrid.t()}

    defstruct sub_map: %Elixir.NavMsgs.OccupancyGrid{}

    def types, do: [sub_map: :"nav_msgs/OccupancyGrid"]
  end

  def md5sum, do: "81aa75ecf00f4571a9be0d9dc6dea512"

  def definition do
    """
    float64 x
    float64 y
    float64 l_x
    float64 l_y
    ---
    nav_msgs/OccupancyGrid sub_map
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      nav_msgs/MapMetaData info
        time map_load_time
        float32 resolution
        uint32 width
        uint32 height
        geometry_msgs/Pose origin
          geometry_msgs/Point position
            float64 x
            float64 y
            float64 z
          geometry_msgs/Quaternion orientation
            float64 x
            float64 y
            float64 z
            float64 w
      int8[] data
    """
  end
end