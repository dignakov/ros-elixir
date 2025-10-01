defmodule Elixir.NavMsgs.GetMapActionResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status: Elixir.ActionlibMsgs.GoalStatus.t(),
          result: Elixir.NavMsgs.GetMapResult.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            status: %Elixir.ActionlibMsgs.GoalStatus{},
            result: %Elixir.NavMsgs.GetMapResult{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "ac66e5b9a79bb4bbd33dab245236c892"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    actionlib_msgs/GoalStatus status
      uint8 PENDING=0
      uint8 ACTIVE=1
      uint8 PREEMPTED=2
      uint8 SUCCEEDED=3
      uint8 ABORTED=4
      uint8 REJECTED=5
      uint8 PREEMPTING=6
      uint8 RECALLING=7
      uint8 RECALLED=8
      uint8 LOST=9
      actionlib_msgs/GoalID goal_id
        time stamp
        string id
      uint8 status
      string text
    nav_msgs/GetMapResult result
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

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      status: :"actionlib_msgs/GoalStatus",
      result: :"nav_msgs/GetMapResult"
    ]
end