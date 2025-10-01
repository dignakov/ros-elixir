defmodule Elixir.ActionlibTutorials.FibonacciActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.ActionlibTutorials.FibonacciGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.ActionlibTutorials.FibonacciGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "006871c7fa1d0e3d5fe2226bf17b2a94"

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
    actionlib_tutorials/FibonacciGoal goal
      int32 order
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"actionlib_tutorials/FibonacciGoal"
    ]
end