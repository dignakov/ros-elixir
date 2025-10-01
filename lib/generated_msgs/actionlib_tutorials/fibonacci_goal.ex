defmodule Elixir.ActionlibTutorials.FibonacciGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{order: integer()}

  defstruct order: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "6889063349a00b249bd1661df429d822"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 order
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [order: :int32]
end