defmodule Elixir.GeometryMsgs.TwistWithCovariance do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{twist: Elixir.GeometryMsgs.Twist.t(), covariance: list(float())}

  defstruct twist: %Elixir.GeometryMsgs.Twist{}, covariance: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "1fe8a28e6890a4cc3ae4c3ca5c7d82e6"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
  def types, do: [twist: :"geometry_msgs/Twist", covariance: :"float64[]"]
end