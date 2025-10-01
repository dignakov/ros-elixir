defmodule Elixir.Turtlesim.Pose do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          x: float(),
          y: float(),
          theta: float(),
          linear_velocity: float(),
          angular_velocity: float()
        }

  defstruct x: 0.0, y: 0.0, theta: 0.0, linear_velocity: 0.0, angular_velocity: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "863b248d5016ca62ea2e895ae5265cf9"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float32 x
    float32 y
    float32 theta
    float32 linear_velocity
    float32 angular_velocity
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      x: :float32,
      y: :float32,
      theta: :float32,
      linear_velocity: :float32,
      angular_velocity: :float32
    ]
end