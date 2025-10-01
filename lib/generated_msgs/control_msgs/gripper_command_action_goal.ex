defmodule Elixir.ControlMsgs.GripperCommandActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.ControlMsgs.GripperCommandGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.ControlMsgs.GripperCommandGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "aa581f648a35ed681db2ec0bf7a82bea"

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
    control_msgs/GripperCommandGoal goal
      control_msgs/GripperCommand command
        float64 position
        float64 max_effort
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"control_msgs/GripperCommandGoal"
    ]
end