defmodule Elixir.ControlMsgs.GripperCommand do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{position: float(), max_effort: float()}

  defstruct position: 0.0, max_effort: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "680acaff79486f017132a7f198d40f08"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 position
    float64 max_effort
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [position: :float64, max_effort: :float64]
end