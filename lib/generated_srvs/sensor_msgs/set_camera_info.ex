defmodule Elixir.SensorMsgs.SetCameraInfo do
  @moduledoc false

  defmodule Elixir.SensorMsgs.SetCameraInfo.Request do
    @moduledoc false
    @type t :: %__MODULE__{camera_info: Elixir.SensorMsgs.CameraInfo.t()}

    defstruct camera_info: %Elixir.SensorMsgs.CameraInfo{}

    def types, do: [camera_info: :"sensor_msgs/CameraInfo"]
  end

  defmodule Elixir.SensorMsgs.SetCameraInfo.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), status_message: binary()}

    defstruct success: false, status_message: ""

    def types, do: [success: :bool, status_message: :string]
  end

  def md5sum, do: "bef1df590ed75ed1f393692395e15482"

  def definition do
    """
    sensor_msgs/CameraInfo camera_info
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
    ---
    bool success
    string status_message
    """
  end
end