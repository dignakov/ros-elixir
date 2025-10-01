defmodule Elixir.TurtleActionlib.Velocity do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{linear: float(), angular: float()}

  defstruct linear: 0.0, angular: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "9d5c2dcd348ac8f76ce2a4307bd63a13"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float32 linear
    float32 angular
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [linear: :float32, angular: :float32]
end