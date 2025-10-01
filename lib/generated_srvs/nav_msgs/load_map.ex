defmodule Elixir.NavMsgs.LoadMap do
  @moduledoc false

  defmodule Elixir.NavMsgs.LoadMap.Request do
    @moduledoc false
    @type t :: %__MODULE__{map_url: binary()}

    defstruct map_url: ""

    def types, do: [map_url: :string]
  end

  defmodule Elixir.NavMsgs.LoadMap.Response do
    @moduledoc false
    @type t :: %__MODULE__{map: Elixir.NavMsgs.OccupancyGrid.t(), result: non_neg_integer()}

    defstruct map: %Elixir.NavMsgs.OccupancyGrid{}, result: 0

    def types, do: [map: :"nav_msgs/OccupancyGrid", result: :uint8]

    def result_success, do: 0

    def result_map_does_not_exist, do: 1

    def result_invalid_map_data, do: 2

    def result_invalid_map_metadata, do: 3

    def result_undefined_failure, do: 255
  end

  def md5sum, do: "22e647fdfbe3b23c8c9f419908afaebd"

  def definition do
    """
    string map_url
    ---
    uint8 RESULT_SUCCESS=0
    uint8 RESULT_MAP_DOES_NOT_EXIST=1
    uint8 RESULT_INVALID_MAP_DATA=2
    uint8 RESULT_INVALID_MAP_METADATA=3
    uint8 RESULT_UNDEFINED_FAILURE=255
    nav_msgs/OccupancyGrid map
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
    uint8 result
    """
  end
end