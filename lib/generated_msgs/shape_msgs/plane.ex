defmodule Elixir.ShapeMsgs.Plane do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{coef: list(float())}

  defstruct coef: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "2c1b92ed8f31492f8e73f6a4a44ca796"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64[4] coef
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [coef: :"float64[]"]
end