defmodule Elixir.SensorMsgs.Imu do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          orientation: Elixir.GeometryMsgs.Quaternion.t(),
          orientation_covariance: list(float()),
          angular_velocity: Elixir.GeometryMsgs.Vector3.t(),
          angular_velocity_covariance: list(float()),
          linear_acceleration: Elixir.GeometryMsgs.Vector3.t(),
          linear_acceleration_covariance: list(float())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            orientation: %Elixir.GeometryMsgs.Quaternion{},
            orientation_covariance: [],
            angular_velocity: %Elixir.GeometryMsgs.Vector3{},
            angular_velocity_covariance: [],
            linear_acceleration: %Elixir.GeometryMsgs.Vector3{},
            linear_acceleration_covariance: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "6a62c6daae103f4ff57a132d6f95cec2"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Quaternion orientation
      float64 x
      float64 y
      float64 z
      float64 w
    float64[9] orientation_covariance
    geometry_msgs/Vector3 angular_velocity
      float64 x
      float64 y
      float64 z
    float64[9] angular_velocity_covariance
    geometry_msgs/Vector3 linear_acceleration
      float64 x
      float64 y
      float64 z
    float64[9] linear_acceleration_covariance
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      orientation: :"geometry_msgs/Quaternion",
      orientation_covariance: :"float64[]",
      angular_velocity: :"geometry_msgs/Vector3",
      angular_velocity_covariance: :"float64[]",
      linear_acceleration: :"geometry_msgs/Vector3",
      linear_acceleration_covariance: :"float64[]"
    ]
end