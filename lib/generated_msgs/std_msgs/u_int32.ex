defmodule Elixir.StdMsgs.UInt32 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: non_neg_integer()}

  defstruct data: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "304a39449588c7f8ce2df6e8001c5fce"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint32 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :uint32]
end