defmodule Elixir.ControlMsgs.SingleJointPositionActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.ControlMsgs.SingleJointPositionGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.ControlMsgs.SingleJointPositionGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "4b0d3d091471663e17749c1d0db90f61"

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
    control_msgs/SingleJointPositionGoal goal
      float64 position
      duration min_duration
      float64 max_velocity
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"control_msgs/SingleJointPositionGoal"
    ]
end