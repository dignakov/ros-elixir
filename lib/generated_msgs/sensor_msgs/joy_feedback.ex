defmodule Elixir.SensorMsgs.JoyFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{type: non_neg_integer(), id: non_neg_integer(), intensity: float()}

  defstruct type: 0, id: 0, intensity: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "f4dcd73460360d98f36e55ee7f2e46f1"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 TYPE_LED=0
    uint8 TYPE_RUMBLE=1
    uint8 TYPE_BUZZER=2
    uint8 type
    uint8 id
    float32 intensity
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [type: :uint8, id: :uint8, intensity: :float32]

  def type_led, do: 0

  def type_rumble, do: 1

  def type_buzzer, do: 2
end