defmodule Elixir.DynamicReconfigure.SensorLevels do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{}

  defstruct []

  @impl ROS.Message.Behaviour
  def md5sum, do: "6322637bee96d5489db6e2127c47602c"

  @impl ROS.Message.Behaviour
  def definition do
    """
    byte RECONFIGURE_CLOSE=3
    byte RECONFIGURE_STOP=1
    byte RECONFIGURE_RUNNING=0
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: []

  def reconfigure_close, do: 3

  def reconfigure_stop, do: 1

  def reconfigure_running, do: 0
end