defmodule Elixir.StdMsgs.UInt64 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: non_neg_integer()}

  defstruct data: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "1b2a79973e8bf53d7b53acb71299cb57"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint64 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :uint64]
end