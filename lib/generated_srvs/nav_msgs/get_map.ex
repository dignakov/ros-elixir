defmodule Elixir.NavMsgs.GetMap do
  @moduledoc false

  defmodule Elixir.NavMsgs.GetMap.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.NavMsgs.GetMap.Response do
    @moduledoc false
    @type t :: %__MODULE__{map: Elixir.NavMsgs.OccupancyGrid.t()}

    defstruct map: %Elixir.NavMsgs.OccupancyGrid{}

    def types, do: [map: :"nav_msgs/OccupancyGrid"]
  end

  def md5sum, do: "6cdd0a18e0aff5b0a3ca2326a89b54ff"

  def definition do
    """
    ---
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
    """
  end
end