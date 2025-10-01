defmodule Elixir.NavMsgs.SetMap do
  @moduledoc false

  defmodule Elixir.NavMsgs.SetMap.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            map: Elixir.NavMsgs.OccupancyGrid.t(),
            initial_pose: Elixir.GeometryMsgs.PoseWithCovarianceStamped.t()
          }

    defstruct map: %Elixir.NavMsgs.OccupancyGrid{},
              initial_pose: %Elixir.GeometryMsgs.PoseWithCovarianceStamped{}

    def types,
      do: [
        map: :"nav_msgs/OccupancyGrid",
        initial_pose: :"geometry_msgs/PoseWithCovarianceStamped"
      ]
  end

  defmodule Elixir.NavMsgs.SetMap.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom()}

    defstruct success: false

    def types, do: [success: :bool]
  end

  def md5sum, do: "c36922319011e63ed7784112ad4fdd32"

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
    geometry_msgs/PoseWithCovarianceStamped initial_pose
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      geometry_msgs/PoseWithCovariance pose
        geometry_msgs/Pose pose
          geometry_msgs/Point position
            float64 x
            float64 y
            float64 z
          geometry_msgs/Quaternion orientation
            float64 x
            float64 y
            float64 z
            float64 w
        float64[36] covariance
    ---
    bool success
    """
  end
end