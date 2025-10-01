defmodule Elixir.SensorMsgs.JoyFeedbackArray do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{array: list(Elixir.SensorMsgs.JoyFeedback.t())}

  defstruct array: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "cde5730a895b1fc4dee6f91b754b213d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    sensor_msgs/JoyFeedback[] array
      uint8 TYPE_LED=0
      uint8 TYPE_RUMBLE=1
      uint8 TYPE_BUZZER=2
      uint8 type
      uint8 id
      float32 intensity
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [array: :"sensor_msgs/JoyFeedback[]"]
end