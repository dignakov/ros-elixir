defmodule Elixir.SensorMsgs.Joy do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          axes: list(float()),
          buttons: list(integer())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, axes: [], buttons: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "5a9ea5f83505693b71e785041e67a8bb"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float32[] axes
    int32[] buttons
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", axes: :"float32[]", buttons: :"int32[]"]
end