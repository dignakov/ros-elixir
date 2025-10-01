defmodule Elixir.ControlMsgs.GripperCommandFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          position: float(),
          effort: float(),
          stalled: atom(),
          reached_goal: atom()
        }

  defstruct position: 0.0, effort: 0.0, stalled: false, reached_goal: false

  @impl ROS.Message.Behaviour
  def md5sum, do: "e4cbff56d3562bcf113da5a5adeef91f"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 position
    float64 effort
    bool stalled
    bool reached_goal
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [position: :float64, effort: :float64, stalled: :bool, reached_goal: :bool]
end