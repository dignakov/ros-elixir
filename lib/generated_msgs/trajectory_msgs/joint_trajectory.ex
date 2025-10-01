defmodule Elixir.TrajectoryMsgs.JointTrajectory do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          joint_names: list(binary()),
          points: list(Elixir.TrajectoryMsgs.JointTrajectoryPoint.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, joint_names: [], points: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "65b4f94a94d1ed67169da35a02f33d3f"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
      joint_names: :"string[]",
      points: :"trajectory_msgs/JointTrajectoryPoint[]"
    ]
end