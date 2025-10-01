defmodule Elixir.SensorMsgs.PointField do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          name: binary(),
          offset: non_neg_integer(),
          datatype: non_neg_integer(),
          count: non_neg_integer()
        }

  defstruct name: "", offset: 0, datatype: 0, count: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "268eacb2962780ceac86cbd17e328150"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 INT8=1
    uint8 UINT8=2
    uint8 INT16=3
    uint8 UINT16=4
    uint8 INT32=5
    uint8 UINT32=6
    uint8 FLOAT32=7
    uint8 FLOAT64=8
    string name
    uint32 offset
    uint8 datatype
    uint32 count
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, offset: :uint32, datatype: :uint8, count: :uint32]

  def int8, do: 1

  def uint8, do: 2

  def int16, do: 3

  def uint16, do: 4

  def int32, do: 5

  def uint32, do: 6

  def float32, do: 7

  def float64, do: 8
end