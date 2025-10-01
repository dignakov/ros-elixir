defmodule Elixir.GeometryMsgs.Pose2D do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{x: float(), y: float(), theta: float()}

  defstruct x: 0.0, y: 0.0, theta: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "938fa65709584ad8e77d238529be13b8"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 x
    float64 y
    float64 theta
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [x: :float64, y: :float64, theta: :float64]
end