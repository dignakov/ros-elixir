defmodule Elixir.RospyTutorials.Floats do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: list(float())}

  defstruct data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "420cd38b6b071cd49f2970c3e2cee511"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float32[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :"float32[]"]
end