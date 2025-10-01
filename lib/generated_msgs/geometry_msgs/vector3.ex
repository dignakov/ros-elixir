defmodule Elixir.GeometryMsgs.Vector3 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{x: float(), y: float(), z: float()}

  defstruct x: 0.0, y: 0.0, z: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "4a842b65f413084dc2b10fb484ea7f17"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 x
    float64 y
    float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [x: :float64, y: :float64, z: :float64]
end