defmodule Elixir.StdMsgs.Int32MultiArray do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{layout: Elixir.StdMsgs.MultiArrayLayout.t(), data: list(integer())}

  defstruct layout: %Elixir.StdMsgs.MultiArrayLayout{}, data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "1d99f79f8b325b44fee908053e9c945b"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/MultiArrayLayout layout
      std_msgs/MultiArrayDimension[] dim
        string label
        uint32 size
        uint32 stride
      uint32 data_offset
    int32[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [layout: :"std_msgs/MultiArrayLayout", data: :"int32[]"]
end