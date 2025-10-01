defmodule Elixir.ControlMsgs.FollowJointTrajectoryFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          joint_names: list(binary()),
          desired: Elixir.TrajectoryMsgs.JointTrajectoryPoint.t(),
          actual: Elixir.TrajectoryMsgs.JointTrajectoryPoint.t(),
          error: Elixir.TrajectoryMsgs.JointTrajectoryPoint.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            joint_names: [],
            desired: %Elixir.TrajectoryMsgs.JointTrajectoryPoint{},
            actual: %Elixir.TrajectoryMsgs.JointTrajectoryPoint{},
            error: %Elixir.TrajectoryMsgs.JointTrajectoryPoint{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "10817c60c2486ef6b33e97dcd87f4474"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string[] joint_names
    trajectory_msgs/JointTrajectoryPoint desired
      float64[] positions
      float64[] velocities
      float64[] accelerations
      float64[] effort
      duration time_from_start
    trajectory_msgs/JointTrajectoryPoint actual
      float64[] positions
      float64[] velocities
      float64[] accelerations
      float64[] effort
      duration time_from_start
    trajectory_msgs/JointTrajectoryPoint error
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
      joint_names: :"string[]",
      desired: :"trajectory_msgs/JointTrajectoryPoint",
      actual: :"trajectory_msgs/JointTrajectoryPoint",
      error: :"trajectory_msgs/JointTrajectoryPoint"
    ]
end