defmodule Elixir.GeometryMsgs.Quaternion do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{x: float(), y: float(), z: float(), w: float()}

  defstruct x: 0.0, y: 0.0, z: 0.0, w: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "a779879fadf0160734f906b8c19c7004"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 x
    float64 y
    float64 z
    float64 w
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [x: :float64, y: :float64, z: :float64, w: :float64]
end