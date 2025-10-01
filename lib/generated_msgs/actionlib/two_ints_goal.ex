defmodule Elixir.Actionlib.TwoIntsGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{a: integer(), b: integer()}

  defstruct a: 0, b: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "36d09b846be0b371c5f190354dd3153e"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int64 a
    int64 b
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [a: :int64, b: :int64]
end