defmodule Elixir.Actionlib.TwoIntsAction do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          action_goal: Elixir.Actionlib.TwoIntsActionGoal.t(),
          action_result: Elixir.Actionlib.TwoIntsActionResult.t(),
          action_feedback: Elixir.Actionlib.TwoIntsActionFeedback.t()
        }

  defstruct action_goal: %Elixir.Actionlib.TwoIntsActionGoal{},
            action_result: %Elixir.Actionlib.TwoIntsActionResult{},
            action_feedback: %Elixir.Actionlib.TwoIntsActionFeedback{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "6d1aa538c4bd6183a2dfb7fcac41ee50"

  @impl ROS.Message.Behaviour
  def definition do
    """
    actionlib/TwoIntsActionGoal action_goal
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      actionlib_msgs/GoalID goal_id
        time stamp
        string id
      actionlib/TwoIntsGoal goal
        int64 a
        int64 b
    actionlib/TwoIntsActionResult action_result
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
      actionlib/TwoIntsResult result
        int64 sum
    actionlib/TwoIntsActionFeedback action_feedback
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
      actionlib/TwoIntsFeedback feedback
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      action_goal: :"actionlib/TwoIntsActionGoal",
      action_result: :"actionlib/TwoIntsActionResult",
      action_feedback: :"actionlib/TwoIntsActionFeedback"
    ]
end