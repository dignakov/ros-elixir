defmodule Elixir.ControlMsgs.PointHeadFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{pointing_angle_error: float()}

  defstruct pointing_angle_error: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "cce80d27fd763682da8805a73316cab4"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 pointing_angle_error
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [pointing_angle_error: :float64]
end