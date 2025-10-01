defmodule Elixir.StdMsgs.Int8 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: integer()}

  defstruct data: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "27ffa0c9c4b8fb8492252bcad9e5c57b"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int8 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :int8]
end