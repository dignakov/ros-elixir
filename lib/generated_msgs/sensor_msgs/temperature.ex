defmodule Elixir.SensorMsgs.Temperature do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          temperature: float(),
          variance: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, temperature: 0.0, variance: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "ff71b307acdbe7c871a5a6d7ed359100"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float64 temperature
    float64 variance
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", temperature: :float64, variance: :float64]
end