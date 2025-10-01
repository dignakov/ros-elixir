defmodule Elixir.GeometryMsgs.Point32 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{x: float(), y: float(), z: float()}

  defstruct x: 0.0, y: 0.0, z: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "cc153912f1453b708d221682bc23d9ac"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float32 x
    float32 y
    float32 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [x: :float32, y: :float32, z: :float32]
end