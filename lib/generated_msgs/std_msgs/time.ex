defmodule Elixir.StdMsgs.Time do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: Time.t()}

  defstruct data: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "cd7166c74c552c311fbcc2fe5a7bc289"

  @impl ROS.Message.Behaviour
  def definition do
    """
    time data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :time]
end