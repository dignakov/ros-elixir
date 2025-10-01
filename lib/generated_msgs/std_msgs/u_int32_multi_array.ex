defmodule Elixir.StdMsgs.UInt32MultiArray do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          layout: Elixir.StdMsgs.MultiArrayLayout.t(),
          data: list(non_neg_integer())
        }

  defstruct layout: %Elixir.StdMsgs.MultiArrayLayout{}, data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "4d6a180abc9be191b96a7eda6c8a233d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/MultiArrayLayout layout
      std_msgs/MultiArrayDimension[] dim
        string label
        uint32 size
        uint32 stride
      uint32 data_offset
    uint32[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [layout: :"std_msgs/MultiArrayLayout", data: :"uint32[]"]
end