defmodule Elixir.ActionlibTutorials.FibonacciAction do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          action_goal: Elixir.ActionlibTutorials.FibonacciActionGoal.t(),
          action_result: Elixir.ActionlibTutorials.FibonacciActionResult.t(),
          action_feedback: Elixir.ActionlibTutorials.FibonacciActionFeedback.t()
        }

  defstruct action_goal: %Elixir.ActionlibTutorials.FibonacciActionGoal{},
            action_result: %Elixir.ActionlibTutorials.FibonacciActionResult{},
            action_feedback: %Elixir.ActionlibTutorials.FibonacciActionFeedback{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "f59df5767bf7634684781c92598b2406"

  @impl ROS.Message.Behaviour
  def definition do
    """
    actionlib_tutorials/FibonacciActionGoal action_goal
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      actionlib_msgs/GoalID goal_id
        time stamp
        string id
      actionlib_tutorials/FibonacciGoal goal
        int32 order
    actionlib_tutorials/FibonacciActionResult action_result
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
      actionlib_tutorials/FibonacciResult result
        int32[] sequence
    actionlib_tutorials/FibonacciActionFeedback action_feedback
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
      actionlib_tutorials/FibonacciFeedback feedback
        int32[] sequence
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      action_goal: :"actionlib_tutorials/FibonacciActionGoal",
      action_result: :"actionlib_tutorials/FibonacciActionResult",
      action_feedback: :"actionlib_tutorials/FibonacciActionFeedback"
    ]
end