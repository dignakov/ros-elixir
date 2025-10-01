defmodule Elixir.ControlMsgs.SingleJointPositionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{position: float(), min_duration: Time.t(), max_velocity: float()}

  defstruct position: 0.0, min_duration: ~T[00:00:00], max_velocity: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "fbaaa562a23a013fd5053e5f72cbb35c"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 position
    duration min_duration
    float64 max_velocity
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [position: :float64, min_duration: :duration, max_velocity: :float64]
end