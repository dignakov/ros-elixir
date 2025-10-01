defmodule Elixir.StdMsgs.Float64 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: float()}

  defstruct data: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "fdb28210bfa9d7c91146260178d9a584"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :float64]
end