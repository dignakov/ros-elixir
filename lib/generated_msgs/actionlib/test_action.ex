defmodule Elixir.Actionlib.TestAction do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          action_goal: Elixir.Actionlib.TestActionGoal.t(),
          action_result: Elixir.Actionlib.TestActionResult.t(),
          action_feedback: Elixir.Actionlib.TestActionFeedback.t()
        }

  defstruct action_goal: %Elixir.Actionlib.TestActionGoal{},
            action_result: %Elixir.Actionlib.TestActionResult{},
            action_feedback: %Elixir.Actionlib.TestActionFeedback{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "991e87a72802262dfbe5d1b3cf6efc9a"

  @impl ROS.Message.Behaviour
  def definition do
    """
    actionlib/TestActionGoal action_goal
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      actionlib_msgs/GoalID goal_id
        time stamp
        string id
      actionlib/TestGoal goal
        int32 goal
    actionlib/TestActionResult action_result
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
      actionlib/TestResult result
        int32 result
    actionlib/TestActionFeedback action_feedback
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
      actionlib/TestFeedback feedback
        int32 feedback
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      action_goal: :"actionlib/TestActionGoal",
      action_result: :"actionlib/TestActionResult",
      action_feedback: :"actionlib/TestActionFeedback"
    ]
end