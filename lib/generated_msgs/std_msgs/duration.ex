defmodule Elixir.StdMsgs.Duration do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: Time.t()}

  defstruct data: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "3e286caf4241d664e55f3ad380e2ae46"

  @impl ROS.Message.Behaviour
  def definition do
    """
    duration data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :duration]
end