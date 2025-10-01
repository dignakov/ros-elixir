defmodule Elixir.SensorMsgs.RegionOfInterest do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          x_offset: non_neg_integer(),
          y_offset: non_neg_integer(),
          height: non_neg_integer(),
          width: non_neg_integer(),
          do_rectify: atom()
        }

  defstruct x_offset: 0, y_offset: 0, height: 0, width: 0, do_rectify: false

  @impl ROS.Message.Behaviour
  def md5sum, do: "bdb633039d588fcccb441a4d43ccfe09"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint32 x_offset
    uint32 y_offset
    uint32 height
    uint32 width
    bool do_rectify
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [x_offset: :uint32, y_offset: :uint32, height: :uint32, width: :uint32, do_rectify: :bool]
end