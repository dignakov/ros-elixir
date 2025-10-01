defmodule Elixir.Actionlib.TwoIntsResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{sum: integer()}

  defstruct sum: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "b88405221c77b1878a3cbbfff53428d7"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int64 sum
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [sum: :int64]
end