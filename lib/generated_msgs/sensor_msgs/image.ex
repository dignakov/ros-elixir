defmodule Elixir.SensorMsgs.Image do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          height: non_neg_integer(),
          width: non_neg_integer(),
          encoding: binary(),
          is_bigendian: non_neg_integer(),
          step: non_neg_integer(),
          data: list(non_neg_integer())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            height: 0,
            width: 0,
            encoding: "",
            is_bigendian: 0,
            step: 0,
            data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "060021388200f6f0f447d0fcd9c64743"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    uint32 height
    uint32 width
    string encoding
    uint8 is_bigendian
    uint32 step
    uint8[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      height: :uint32,
      width: :uint32,
      encoding: :string,
      is_bigendian: :uint8,
      step: :uint32,
      data: :"uint8[]"
    ]
end