defmodule Elixir.TrajectoryMsgs.MultiDOFJointTrajectory do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          joint_names: list(binary()),
          points: list(Elixir.TrajectoryMsgs.MultiDOFJointTrajectoryPoint.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, joint_names: [], points: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "ef145a45a5f47b77b7f5cdde4b16c942"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string[] joint_names
    trajectory_msgs/MultiDOFJointTrajectoryPoint[] points
      geometry_msgs/Transform[] transforms
        geometry_msgs/Vector3 translation
          float64 x
          float64 y
          float64 z
        geometry_msgs/Quaternion rotation
          float64 x
          float64 y
          float64 z
          float64 w
      geometry_msgs/Twist[] velocities
        geometry_msgs/Vector3 linear
          float64 x
          float64 y
          float64 z
        geometry_msgs/Vector3 angular
          float64 x
          float64 y
          float64 z
      geometry_msgs/Twist[] accelerations
        geometry_msgs/Vector3 linear
          float64 x
          float64 y
          float64 z
        geometry_msgs/Vector3 angular
          float64 x
          float64 y
          float64 z
      duration time_from_start
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      joint_names: :"string[]",
      points: :"trajectory_msgs/MultiDOFJointTrajectoryPoint[]"
    ]
end