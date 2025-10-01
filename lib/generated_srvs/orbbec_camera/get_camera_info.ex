defmodule Elixir.OrbbecCamera.GetCameraInfo do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.GetCameraInfo.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.OrbbecCamera.GetCameraInfo.Response do
    @moduledoc false
    @type t :: %__MODULE__{
            info: Elixir.SensorMsgs.CameraInfo.t(),
            success: atom(),
            message: binary()
          }

    defstruct info: %Elixir.SensorMsgs.CameraInfo{}, success: false, message: ""

    def types, do: [info: :"sensor_msgs/CameraInfo", success: :bool, message: :string]
  end

  def md5sum, do: "aacf7dfed1a501be45f34981291a5579"

  def definition do
    """
    ---
    sensor_msgs/CameraInfo info
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
    bool success
    string message
    """
  end
end