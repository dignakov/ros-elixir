defmodule Elixir.ActionlibTutorials.AveragingActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.ActionlibTutorials.AveragingGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.ActionlibTutorials.AveragingGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "1561825b734ebd6039851c501e3fb570"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    actionlib_msgs/GoalID goal_id
      time stamp
      string id
    actionlib_tutorials/AveragingGoal goal
      int32 samples
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"actionlib_tutorials/AveragingGoal"
    ]
end