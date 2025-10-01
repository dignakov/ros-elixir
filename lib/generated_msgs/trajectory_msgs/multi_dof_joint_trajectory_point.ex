defmodule Elixir.TrajectoryMsgs.MultiDOFJointTrajectoryPoint do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          transforms: list(Elixir.GeometryMsgs.Transform.t()),
          velocities: list(Elixir.GeometryMsgs.Twist.t()),
          accelerations: list(Elixir.GeometryMsgs.Twist.t()),
          time_from_start: Time.t()
        }

  defstruct transforms: [], velocities: [], accelerations: [], time_from_start: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "3ebe08d1abd5b65862d50e09430db776"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
      transforms: :"geometry_msgs/Transform[]",
      velocities: :"geometry_msgs/Twist[]",
      accelerations: :"geometry_msgs/Twist[]",
      time_from_start: :duration
    ]
end