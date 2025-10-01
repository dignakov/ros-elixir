defmodule Elixir.SensorMsgs.JointState do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          name: list(binary()),
          position: list(float()),
          velocity: list(float()),
          effort: list(float())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, name: [], position: [], velocity: [], effort: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "3066dcd76a6cfaef579bd0f34173e9fd"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string[] name
    float64[] position
    float64[] velocity
    float64[] effort
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      name: :"string[]",
      position: :"float64[]",
      velocity: :"float64[]",
      effort: :"float64[]"
    ]
end