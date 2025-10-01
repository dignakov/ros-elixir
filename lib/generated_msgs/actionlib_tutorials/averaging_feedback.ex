defmodule Elixir.ActionlibTutorials.AveragingFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{sample: integer(), data: float(), mean: float(), std_dev: float()}

  defstruct sample: 0, data: 0.0, mean: 0.0, std_dev: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "9e8dfc53c2f2a032ca33fa80ec46fd4f"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 sample
    float32 data
    float32 mean
    float32 std_dev
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [sample: :int32, data: :float32, mean: :float32, std_dev: :float32]
end