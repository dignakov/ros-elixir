defmodule Elixir.StdMsgs.Bool do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: atom()}

  defstruct data: false

  @impl ROS.Message.Behaviour
  def md5sum, do: "8b94c1b53db61fb6aed406028ad6332a"

  @impl ROS.Message.Behaviour
  def definition do
    """
    bool data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :bool]
end