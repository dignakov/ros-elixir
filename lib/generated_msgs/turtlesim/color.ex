defmodule Elixir.Turtlesim.Color do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{r: non_neg_integer(), g: non_neg_integer(), b: non_neg_integer()}

  defstruct r: 0, g: 0, b: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "353891e354491c51aabe32df673fb446"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 r
    uint8 g
    uint8 b
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [r: :uint8, g: :uint8, b: :uint8]
end