defmodule Elixir.MapMsgs.ProjectedMap do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{map: Elixir.NavMsgs.OccupancyGrid.t(), min_z: float(), max_z: float()}

  defstruct map: %Elixir.NavMsgs.OccupancyGrid{}, min_z: 0.0, max_z: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "7bbe8f96e45089681dc1ea7d023cbfca"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
    float64 min_z
    float64 max_z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [map: :"nav_msgs/OccupancyGrid", min_z: :float64, max_z: :float64]
end