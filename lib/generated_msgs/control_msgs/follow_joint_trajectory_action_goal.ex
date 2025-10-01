defmodule Elixir.ControlMsgs.FollowJointTrajectoryActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.ControlMsgs.FollowJointTrajectoryGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.ControlMsgs.FollowJointTrajectoryGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "cff5c1d533bf2f82dd0138d57f4304bb"

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
    control_msgs/FollowJointTrajectoryGoal goal
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
      control_msgs/JointTolerance[] path_tolerance
        string name
        float64 position
        float64 velocity
        float64 acceleration
      control_msgs/JointTolerance[] goal_tolerance
        string name
        float64 position
        float64 velocity
        float64 acceleration
      duration goal_time_tolerance
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"control_msgs/FollowJointTrajectoryGoal"
    ]
end