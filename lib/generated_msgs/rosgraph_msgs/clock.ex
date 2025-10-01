defmodule Elixir.RosgraphMsgs.Clock do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{clock: Time.t()}

  defstruct clock: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "a9c97c1d230cfc112e270351a944ee47"

  @impl ROS.Message.Behaviour
  def definition do
    """
    time clock
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [clock: :time]
end