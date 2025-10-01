defmodule Elixir.ActionlibTutorials.AveragingResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{mean: float(), std_dev: float()}

  defstruct mean: 0.0, std_dev: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "d5c7decf6df75ffb4367a05c1bcc7612"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float32 mean
    float32 std_dev
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [mean: :float32, std_dev: :float32]
end