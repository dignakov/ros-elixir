defmodule Elixir.ControlMsgs.FollowJointTrajectoryGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          trajectory: Elixir.TrajectoryMsgs.JointTrajectory.t(),
          path_tolerance: list(Elixir.ControlMsgs.JointTolerance.t()),
          goal_tolerance: list(Elixir.ControlMsgs.JointTolerance.t()),
          goal_time_tolerance: Time.t()
        }

  defstruct trajectory: %Elixir.TrajectoryMsgs.JointTrajectory{},
            path_tolerance: [],
            goal_tolerance: [],
            goal_time_tolerance: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "69636787b6ecbde4d61d711979bc7ecb"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
      trajectory: :"trajectory_msgs/JointTrajectory",
      path_tolerance: :"control_msgs/JointTolerance[]",
      goal_tolerance: :"control_msgs/JointTolerance[]",
      goal_time_tolerance: :duration
    ]
end