defmodule Elixir.StdMsgs.UInt16 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: non_neg_integer()}

  defstruct data: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "1df79edf208b629fe6b81923a544552d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint16 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :uint16]
end