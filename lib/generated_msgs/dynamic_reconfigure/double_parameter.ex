defmodule Elixir.DynamicReconfigure.DoubleParameter do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{name: binary(), value: float()}

  defstruct name: "", value: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "d8512f27253c0f65f928a67c329cd658"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    float64 value
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, value: :float64]
end