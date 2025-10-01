defmodule Elixir.SensorMsgs.CameraInfo do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          height: non_neg_integer(),
          width: non_neg_integer(),
          distortion_model: binary(),
          D: list(float()),
          K: list(float()),
          R: list(float()),
          P: list(float()),
          binning_x: non_neg_integer(),
          binning_y: non_neg_integer(),
          roi: Elixir.SensorMsgs.RegionOfInterest.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            height: 0,
            width: 0,
            distortion_model: "",
            D: [],
            K: [],
            R: [],
            P: [],
            binning_x: 0,
            binning_y: 0,
            roi: %Elixir.SensorMsgs.RegionOfInterest{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "c9a58c1b0b154e0e6da7578cb991d214"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    uint32 height
    uint32 width
    string distortion_model
    float64[] D
    float64[9] K
    float64[9] R
    float64[12] P
    uint32 binning_x
    uint32 binning_y
    sensor_msgs/RegionOfInterest roi
      uint32 x_offset
      uint32 y_offset
      uint32 height
      uint32 width
      bool do_rectify
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      height: :uint32,
      width: :uint32,
      distortion_model: :string,
      D: :"float64[]",
      K: :"float64[]",
      R: :"float64[]",
      P: :"float64[]",
      binning_x: :uint32,
      binning_y: :uint32,
      roi: :"sensor_msgs/RegionOfInterest"
    ]
end