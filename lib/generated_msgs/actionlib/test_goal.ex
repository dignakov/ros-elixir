defmodule Elixir.Actionlib.TestGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{goal: integer()}

  defstruct goal: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "18df0149936b7aa95588e3862476ebde"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 goal
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [goal: :int32]
end