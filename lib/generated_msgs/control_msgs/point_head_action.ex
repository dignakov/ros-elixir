defmodule Elixir.ControlMsgs.PointHeadAction do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          action_goal: Elixir.ControlMsgs.PointHeadActionGoal.t(),
          action_result: Elixir.ControlMsgs.PointHeadActionResult.t(),
          action_feedback: Elixir.ControlMsgs.PointHeadActionFeedback.t()
        }

  defstruct action_goal: %Elixir.ControlMsgs.PointHeadActionGoal{},
            action_result: %Elixir.ControlMsgs.PointHeadActionResult{},
            action_feedback: %Elixir.ControlMsgs.PointHeadActionFeedback{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "7252920f1243de1b741f14f214125371"

  @impl ROS.Message.Behaviour
  def definition do
    """
    control_msgs/PointHeadActionGoal action_goal
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      actionlib_msgs/GoalID goal_id
        time stamp
        string id
      control_msgs/PointHeadGoal goal
        geometry_msgs/PointStamped target
          std_msgs/Header header
            uint32 seq
            time stamp
            string frame_id
          geometry_msgs/Point point
            float64 x
            float64 y
            float64 z
        geometry_msgs/Vector3 pointing_axis
          float64 x
          float64 y
          float64 z
        string pointing_frame
        duration min_duration
        float64 max_velocity
    control_msgs/PointHeadActionResult action_result
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
      control_msgs/PointHeadResult result
    control_msgs/PointHeadActionFeedback action_feedback
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
      control_msgs/PointHeadFeedback feedback
        float64 pointing_angle_error
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      action_goal: :"control_msgs/PointHeadActionGoal",
      action_result: :"control_msgs/PointHeadActionResult",
      action_feedback: :"control_msgs/PointHeadActionFeedback"
    ]
end