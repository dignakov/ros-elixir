defmodule Elixir.StdMsgs.MultiArrayDimension do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{label: binary(), size: non_neg_integer(), stride: non_neg_integer()}

  defstruct label: "", size: 0, stride: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "4cd0c83a8683deae40ecdac60e53bfa8"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string label
    uint32 size
    uint32 stride
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [label: :string, size: :uint32, stride: :uint32]
end