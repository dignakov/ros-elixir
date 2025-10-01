defmodule Elixir.GeometryMsgs.AccelWithCovarianceStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          accel: Elixir.GeometryMsgs.AccelWithCovariance.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, accel: %Elixir.GeometryMsgs.AccelWithCovariance{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "96adb295225031ec8d57fb4251b0a886"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/AccelWithCovariance accel
      geometry_msgs/Accel accel
        geometry_msgs/Vector3 linear
          float64 x
          float64 y
          float64 z
        geometry_msgs/Vector3 angular
          float64 x
          float64 y
          float64 z
      float64[36] covariance
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", accel: :"geometry_msgs/AccelWithCovariance"]
end