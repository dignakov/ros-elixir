defmodule Elixir.NavMsgs.Odometry do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          child_frame_id: binary(),
          pose: Elixir.GeometryMsgs.PoseWithCovariance.t(),
          twist: Elixir.GeometryMsgs.TwistWithCovariance.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            child_frame_id: "",
            pose: %Elixir.GeometryMsgs.PoseWithCovariance{},
            twist: %Elixir.GeometryMsgs.TwistWithCovariance{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "cd5e73d190d741a2f92e81eda573aca7"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string child_frame_id
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
  def types,
    do: [
      header: :"std_msgs/Header",
      child_frame_id: :string,
      pose: :"geometry_msgs/PoseWithCovariance",
      twist: :"geometry_msgs/TwistWithCovariance"
    ]
end