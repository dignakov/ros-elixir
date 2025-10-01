defmodule Elixir.IrisSupportMsgs.LightCmd do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          colour1: non_neg_integer(),
          colour2: non_neg_integer(),
          colour3: non_neg_integer(),
          modulation: non_neg_integer(),
          milliseconds: non_neg_integer()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            colour1: 0,
            colour2: 0,
            colour3: 0,
            modulation: 0,
            milliseconds: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "167d468a0bd0164ca15a79be0a6049a3"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint32 OFF=0
    uint32 ON=1
    uint32 TAIGA=2
    uint32 BLINK=3
    uint32 CHASE=4
    uint32 REV_CHASE=5
    uint32 VOOB=6
    uint32 ANTS=7
    uint32 CYLON=8
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    uint32 colour1
    uint32 colour2
    uint32 colour3
    uint32 modulation
    uint32 milliseconds
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      colour1: :uint32,
      colour2: :uint32,
      colour3: :uint32,
      modulation: :uint32,
      milliseconds: :uint32
    ]

  def off, do: 0

  def on, do: 1

  def taiga, do: 2

  def blink, do: 3

  def chase, do: 4

  def rev_chase, do: 5

  def voob, do: 6

  def ants, do: 7

  def cylon, do: 8
end