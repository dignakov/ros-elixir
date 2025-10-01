defmodule Elixir.Actionlib.TestResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{result: integer()}

  defstruct result: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "034a8e20d6a306665e3a5b340fab3f09"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 result
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [result: :int32]
end