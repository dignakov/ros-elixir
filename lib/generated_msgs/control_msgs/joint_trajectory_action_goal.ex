defmodule Elixir.ControlMsgs.JointTrajectoryActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.ControlMsgs.JointTrajectoryGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.ControlMsgs.JointTrajectoryGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "a99e83ef6185f9fdd7693efe99623a86"

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
    control_msgs/JointTrajectoryGoal goal
      trajectory_msgs/JointTrajectory trajectory
        std_msgs/Header header
          uint32 seq
          time stamp
          string frame_id
        string[] joint_names
        trajectory_msgs/JointTrajectoryPoint[] points
          float64[] positions
          float64[] velocities
          float64[] accelerations
          float64[] effort
          duration time_from_start
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"control_msgs/JointTrajectoryGoal"
    ]
end