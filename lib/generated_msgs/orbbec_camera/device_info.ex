defmodule Elixir.OrbbecCamera.DeviceInfo do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          name: binary(),
          serial_number: binary(),
          firmware_version: binary(),
          supported_min_sdk_version: binary(),
          hardware_version: binary()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            name: "",
            serial_number: "",
            firmware_version: "",
            supported_min_sdk_version: "",
            hardware_version: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "1888569b0132dc804ac1aacd640af6e8"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string name
    string serial_number
    string firmware_version
    string supported_min_sdk_version
    string hardware_version
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      name: :string,
      serial_number: :string,
      firmware_version: :string,
      supported_min_sdk_version: :string,
      hardware_version: :string
    ]
end