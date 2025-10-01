defmodule Elixir.ControlMsgs.SingleJointPositionFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          position: float(),
          velocity: float(),
          error: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, position: 0.0, velocity: 0.0, error: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "8cee65610a3d08e0a1bded82f146f1fd"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float64 position
    float64 velocity
    float64 error
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [header: :"std_msgs/Header", position: :float64, velocity: :float64, error: :float64]
end