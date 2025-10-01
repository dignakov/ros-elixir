defmodule Elixir.GeometryMsgs.PoseStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), pose: Elixir.GeometryMsgs.Pose.t()}

  defstruct header: %Elixir.StdMsgs.Header{}, pose: %Elixir.GeometryMsgs.Pose{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "d3812c3cbc69362b77dc0b19b345f8f5"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
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
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", pose: :"geometry_msgs/Pose"]
end