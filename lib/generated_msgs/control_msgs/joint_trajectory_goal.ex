defmodule Elixir.ControlMsgs.JointTrajectoryGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{trajectory: Elixir.TrajectoryMsgs.JointTrajectory.t()}

  defstruct trajectory: %Elixir.TrajectoryMsgs.JointTrajectory{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "2a0eff76c870e8595636c2a562ca298e"

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
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [trajectory: :"trajectory_msgs/JointTrajectory"]
end