defmodule Elixir.SensorMsgs.RelativeHumidity do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          relative_humidity: float(),
          variance: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, relative_humidity: 0.0, variance: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "8730015b05955b7e992ce29a2678d90f"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float64 relative_humidity
    float64 variance
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", relative_humidity: :float64, variance: :float64]
end