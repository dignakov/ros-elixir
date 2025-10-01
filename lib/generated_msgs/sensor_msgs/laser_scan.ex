defmodule Elixir.SensorMsgs.LaserScan do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          angle_min: float(),
          angle_max: float(),
          angle_increment: float(),
          time_increment: float(),
          scan_time: float(),
          range_min: float(),
          range_max: float(),
          ranges: list(float()),
          intensities: list(float())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            angle_min: 0.0,
            angle_max: 0.0,
            angle_increment: 0.0,
            time_increment: 0.0,
            scan_time: 0.0,
            range_min: 0.0,
            range_max: 0.0,
            ranges: [],
            intensities: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "90c7ef2dc6895d81024acba2ac42f369"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float32 angle_min
    float32 angle_max
    float32 angle_increment
    float32 time_increment
    float32 scan_time
    float32 range_min
    float32 range_max
    float32[] ranges
    float32[] intensities
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      angle_min: :float32,
      angle_max: :float32,
      angle_increment: :float32,
      time_increment: :float32,
      scan_time: :float32,
      range_min: :float32,
      range_max: :float32,
      ranges: :"float32[]",
      intensities: :"float32[]"
    ]
end