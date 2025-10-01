defmodule Elixir.OrbbecCamera.GetDeviceInfo do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.GetDeviceInfo.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.OrbbecCamera.GetDeviceInfo.Response do
    @moduledoc false
    @type t :: %__MODULE__{
            info: Elixir.OrbbecCamera.DeviceInfo.t(),
            success: atom(),
            message: binary()
          }

    defstruct info: %Elixir.OrbbecCamera.DeviceInfo{}, success: false, message: ""

    def types, do: [info: :"orbbec_camera/DeviceInfo", success: :bool, message: :string]
  end

  def md5sum, do: "a172c842ade7825e92d115b1aef6b0d1"

  def definition do
    """
    ---
    orbbec_camera/DeviceInfo info
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      string name
      string serial_number
      string firmware_version
      string supported_min_sdk_version
      string hardware_version
    bool success
    string message
    """
  end
end