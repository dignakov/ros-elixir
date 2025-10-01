defmodule Elixir.StdMsgs.MultiArrayLayout do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          dim: list(Elixir.StdMsgs.MultiArrayDimension.t()),
          data_offset: non_neg_integer()
        }

  defstruct dim: [], data_offset: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "0fed2a11c13e11c5571b4e2a995a91a3"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/MultiArrayDimension[] dim
      string label
      uint32 size
      uint32 stride
    uint32 data_offset
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [dim: :"std_msgs/MultiArrayDimension[]", data_offset: :uint32]
end