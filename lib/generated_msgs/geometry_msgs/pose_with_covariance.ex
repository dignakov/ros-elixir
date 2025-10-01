defmodule Elixir.GeometryMsgs.PoseWithCovariance do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{pose: Elixir.GeometryMsgs.Pose.t(), covariance: list(float())}

  defstruct pose: %Elixir.GeometryMsgs.Pose{}, covariance: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "c23e848cf1b7533a8d7c259073a97e6f"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
  def types, do: [pose: :"geometry_msgs/Pose", covariance: :"float64[]"]
end