defmodule Elixir.StdMsgs.Int16 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: integer()}

  defstruct data: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "8524586e34fbd7cb1c08c5f5f1ca0e57"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int16 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :int16]
end