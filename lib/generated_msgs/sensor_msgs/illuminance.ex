defmodule Elixir.SensorMsgs.Illuminance do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          illuminance: float(),
          variance: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, illuminance: 0.0, variance: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "8cf5febb0952fca9d650c3d11a81a188"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float64 illuminance
    float64 variance
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", illuminance: :float64, variance: :float64]
end