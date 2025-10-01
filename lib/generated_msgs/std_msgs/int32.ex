defmodule Elixir.StdMsgs.Int32 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: integer()}

  defstruct data: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "da5909fbe378aeaf85e547e830cc1bb7"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :int32]
end