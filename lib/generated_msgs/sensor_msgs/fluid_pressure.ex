defmodule Elixir.SensorMsgs.FluidPressure do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          fluid_pressure: float(),
          variance: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, fluid_pressure: 0.0, variance: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "804dc5cea1c5306d6a2eb80b9833befe"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float64 fluid_pressure
    float64 variance
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", fluid_pressure: :float64, variance: :float64]
end