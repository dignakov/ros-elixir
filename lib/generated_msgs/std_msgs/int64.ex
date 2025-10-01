defmodule Elixir.StdMsgs.Int64 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: integer()}

  defstruct data: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "34add168574510e6e17f5d23ecc077ef"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int64 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :int64]
end