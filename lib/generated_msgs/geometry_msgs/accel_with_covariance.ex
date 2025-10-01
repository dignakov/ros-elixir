defmodule Elixir.GeometryMsgs.AccelWithCovariance do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{accel: Elixir.GeometryMsgs.Accel.t(), covariance: list(float())}

  defstruct accel: %Elixir.GeometryMsgs.Accel{}, covariance: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "ad5a718d699c6be72a02b8d6a139f334"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
  def types, do: [accel: :"geometry_msgs/Accel", covariance: :"float64[]"]
end