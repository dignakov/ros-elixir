defmodule Elixir.MapMsgs.OccupancyGridUpdate do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          x: integer(),
          y: integer(),
          width: non_neg_integer(),
          height: non_neg_integer(),
          data: list(integer())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, x: 0, y: 0, width: 0, height: 0, data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "b295be292b335c34718bd939deebe1c9"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    int32 x
    int32 y
    uint32 width
    uint32 height
    int8[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      x: :int32,
      y: :int32,
      width: :uint32,
      height: :uint32,
      data: :"int8[]"
    ]
end