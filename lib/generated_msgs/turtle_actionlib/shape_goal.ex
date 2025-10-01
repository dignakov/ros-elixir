defmodule Elixir.TurtleActionlib.ShapeGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{edges: integer(), radius: float()}

  defstruct edges: 0, radius: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "3b9202ab7292cebe5a95ab2bf6b9c091"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 edges
    float32 radius
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [edges: :int32, radius: :float32]
end