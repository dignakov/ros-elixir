defmodule Elixir.ActionlibTutorials.AveragingGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{samples: integer()}

  defstruct samples: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "32c9b10ef9b253faa93b93f564762c8f"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 samples
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [samples: :int32]
end