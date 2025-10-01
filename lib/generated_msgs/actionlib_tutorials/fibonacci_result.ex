defmodule Elixir.ActionlibTutorials.FibonacciResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{sequence: list(integer())}

  defstruct sequence: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "b81e37d2a31925a0e8ae261a8699cb79"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32[] sequence
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [sequence: :"int32[]"]
end