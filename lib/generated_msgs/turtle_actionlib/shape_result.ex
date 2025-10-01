defmodule Elixir.TurtleActionlib.ShapeResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{interior_angle: float(), apothem: float()}

  defstruct interior_angle: 0.0, apothem: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "b06c6e2225f820dbc644270387cd1a7c"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float32 interior_angle
    float32 apothem
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [interior_angle: :float32, apothem: :float32]
end