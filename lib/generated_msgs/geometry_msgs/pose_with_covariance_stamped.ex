defmodule Elixir.GeometryMsgs.PoseWithCovarianceStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          pose: Elixir.GeometryMsgs.PoseWithCovariance.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, pose: %Elixir.GeometryMsgs.PoseWithCovariance{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "953b798c0f514ff060a53a3498ce6246"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/PoseWithCovariance pose
      geometry_msgs/Pose pose
        geometry_msgs/Point position
          float64 x
          float64 y
          float64 z
        geometry_msgs/Quaternion orientation
          float64 x
          float64 y
          float64 z
          float64 w
      float64[36] covariance
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", pose: :"geometry_msgs/PoseWithCovariance"]
end