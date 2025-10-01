defmodule Elixir.ControlMsgs.FollowJointTrajectoryActionResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status: Elixir.ActionlibMsgs.GoalStatus.t(),
          result: Elixir.ControlMsgs.FollowJointTrajectoryResult.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            status: %Elixir.ActionlibMsgs.GoalStatus{},
            result: %Elixir.ControlMsgs.FollowJointTrajectoryResult{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "c4fb3b000dc9da4fd99699380efcc5d9"

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
    control_msgs/FollowJointTrajectoryResult result
      int32 SUCCESSFUL=0
      int32 INVALID_GOAL=-1
      int32 INVALID_JOINTS=-2
      int32 OLD_HEADER_TIMESTAMP=-3
      int32 PATH_TOLERANCE_VIOLATED=-4
      int32 GOAL_TOLERANCE_VIOLATED=-5
      int32 error_code
      string error_string
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      status: :"actionlib_msgs/GoalStatus",
      result: :"control_msgs/FollowJointTrajectoryResult"
    ]
end