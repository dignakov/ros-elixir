defmodule Elixir.StdMsgs.UInt8 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: non_neg_integer()}

  defstruct data: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "7c8164229e7d2c17eb95e9231617fdee"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :uint8]
end