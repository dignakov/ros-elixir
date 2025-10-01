defmodule Elixir.ActionlibTutorials.AveragingAction do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          action_goal: Elixir.ActionlibTutorials.AveragingActionGoal.t(),
          action_result: Elixir.ActionlibTutorials.AveragingActionResult.t(),
          action_feedback: Elixir.ActionlibTutorials.AveragingActionFeedback.t()
        }

  defstruct action_goal: %Elixir.ActionlibTutorials.AveragingActionGoal{},
            action_result: %Elixir.ActionlibTutorials.AveragingActionResult{},
            action_feedback: %Elixir.ActionlibTutorials.AveragingActionFeedback{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "628678f2b4fa6a5951746a4a2d39e716"

  @impl ROS.Message.Behaviour
  def definition do
    """
    actionlib_tutorials/AveragingActionGoal action_goal
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      actionlib_msgs/GoalID goal_id
        time stamp
        string id
      actionlib_tutorials/AveragingGoal goal
        int32 samples
    actionlib_tutorials/AveragingActionResult action_result
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
      actionlib_tutorials/AveragingResult result
        float32 mean
        float32 std_dev
    actionlib_tutorials/AveragingActionFeedback action_feedback
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
      actionlib_tutorials/AveragingFeedback feedback
        int32 sample
        float32 data
        float32 mean
        float32 std_dev
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      action_goal: :"actionlib_tutorials/AveragingActionGoal",
      action_result: :"actionlib_tutorials/AveragingActionResult",
      action_feedback: :"actionlib_tutorials/AveragingActionFeedback"
    ]
end