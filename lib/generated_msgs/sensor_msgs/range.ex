defmodule Elixir.SensorMsgs.Range do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          radiation_type: non_neg_integer(),
          field_of_view: float(),
          min_range: float(),
          max_range: float(),
          range: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            radiation_type: 0,
            field_of_view: 0.0,
            min_range: 0.0,
            max_range: 0.0,
            range: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "c005c34273dc426c67a020a87bc24148"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 ULTRASOUND=0
    uint8 INFRARED=1
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    uint8 radiation_type
    float32 field_of_view
    float32 min_range
    float32 max_range
    float32 range
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      radiation_type: :uint8,
      field_of_view: :float32,
      min_range: :float32,
      max_range: :float32,
      range: :float32
    ]

  def ultrasound, do: 0

  def infrared, do: 1
end