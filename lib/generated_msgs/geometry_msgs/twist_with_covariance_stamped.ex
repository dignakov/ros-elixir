defmodule Elixir.GeometryMsgs.TwistWithCovarianceStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          twist: Elixir.GeometryMsgs.TwistWithCovariance.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, twist: %Elixir.GeometryMsgs.TwistWithCovariance{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "8927a1a12fb2607ceea095b2dc440a96"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/TwistWithCovariance twist
      geometry_msgs/Twist twist
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
  def types, do: [header: :"std_msgs/Header", twist: :"geometry_msgs/TwistWithCovariance"]
end