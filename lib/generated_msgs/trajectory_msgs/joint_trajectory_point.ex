defmodule Elixir.TrajectoryMsgs.JointTrajectoryPoint do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          positions: list(float()),
          velocities: list(float()),
          accelerations: list(float()),
          effort: list(float()),
          time_from_start: Time.t()
        }

  defstruct positions: [],
            velocities: [],
            accelerations: [],
            effort: [],
            time_from_start: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "f3cd1e1c4d320c79d6985c904ae5dcd3"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64[] positions
    float64[] velocities
    float64[] accelerations
    float64[] effort
    duration time_from_start
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      positions: :"float64[]",
      velocities: :"float64[]",
      accelerations: :"float64[]",
      effort: :"float64[]",
      time_from_start: :duration
    ]
end