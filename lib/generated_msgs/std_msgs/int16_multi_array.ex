defmodule Elixir.StdMsgs.Int16MultiArray do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{layout: Elixir.StdMsgs.MultiArrayLayout.t(), data: list(integer())}

  defstruct layout: %Elixir.StdMsgs.MultiArrayLayout{}, data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "d9338d7f523fcb692fae9d0a0e9f067c"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/MultiArrayLayout layout
      std_msgs/MultiArrayDimension[] dim
        string label
        uint32 size
        uint32 stride
      uint32 data_offset
    int16[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [layout: :"std_msgs/MultiArrayLayout", data: :"int16[]"]
end