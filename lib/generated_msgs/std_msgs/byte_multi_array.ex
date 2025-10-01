defmodule Elixir.StdMsgs.ByteMultiArray do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{layout: Elixir.StdMsgs.MultiArrayLayout.t(), data: list(integer())}

  defstruct layout: %Elixir.StdMsgs.MultiArrayLayout{}, data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "70ea476cbcfd65ac2f68f3cda1e891fe"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/MultiArrayLayout layout
      std_msgs/MultiArrayDimension[] dim
        string label
        uint32 size
        uint32 stride
      uint32 data_offset
    byte[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [layout: :"std_msgs/MultiArrayLayout", data: :"byte[]"]
end