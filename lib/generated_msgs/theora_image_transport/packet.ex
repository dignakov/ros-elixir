defmodule Elixir.TheoraImageTransport.Packet do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          data: list(non_neg_integer()),
          b_o_s: integer(),
          e_o_s: integer(),
          granulepos: integer(),
          packetno: integer()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            data: [],
            b_o_s: 0,
            e_o_s: 0,
            granulepos: 0,
            packetno: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "33ac4e14a7cff32e7e0d65f18bb410f3"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    uint8[] data
    int32 b_o_s
    int32 e_o_s
    int64 granulepos
    int64 packetno
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      data: :"uint8[]",
      b_o_s: :int32,
      e_o_s: :int32,
      granulepos: :int64,
      packetno: :int64
    ]
end