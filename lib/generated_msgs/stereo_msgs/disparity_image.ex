defmodule Elixir.StereoMsgs.DisparityImage do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          image: Elixir.SensorMsgs.Image.t(),
          f: float(),
          T: float(),
          valid_window: Elixir.SensorMsgs.RegionOfInterest.t(),
          min_disparity: float(),
          max_disparity: float(),
          delta_d: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            image: %Elixir.SensorMsgs.Image{},
            f: 0.0,
            T: 0.0,
            valid_window: %Elixir.SensorMsgs.RegionOfInterest{},
            min_disparity: 0.0,
            max_disparity: 0.0,
            delta_d: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "04a177815f75271039fa21f16acad8c9"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    sensor_msgs/Image image
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
    float32 f
    float32 T
    sensor_msgs/RegionOfInterest valid_window
      uint32 x_offset
      uint32 y_offset
      uint32 height
      uint32 width
      bool do_rectify
    float32 min_disparity
    float32 max_disparity
    float32 delta_d
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      image: :"sensor_msgs/Image",
      f: :float32,
      T: :float32,
      valid_window: :"sensor_msgs/RegionOfInterest",
      min_disparity: :float32,
      max_disparity: :float32,
      delta_d: :float32
    ]
end