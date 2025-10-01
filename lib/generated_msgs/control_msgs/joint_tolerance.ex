defmodule Elixir.ControlMsgs.JointTolerance do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          name: binary(),
          position: float(),
          velocity: float(),
          acceleration: float()
        }

  defstruct name: "", position: 0.0, velocity: 0.0, acceleration: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "f544fe9c16cf04547e135dd6063ff5be"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    float64 position
    float64 velocity
    float64 acceleration
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, position: :float64, velocity: :float64, acceleration: :float64]
end