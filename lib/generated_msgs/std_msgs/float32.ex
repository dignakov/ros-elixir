defmodule Elixir.StdMsgs.Float32 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: float()}

  defstruct data: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "73fcbf46b49191e672908e50842a83d4"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float32 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :float32]
end