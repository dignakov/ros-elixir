defmodule Elixir.Realsense2Camera.DeviceInfo do
  @moduledoc false

  defmodule Elixir.Realsense2Camera.DeviceInfo.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.Realsense2Camera.DeviceInfo.Response do
    @moduledoc false
    @type t :: %__MODULE__{
            device_name: binary(),
            serial_number: binary(),
            firmware_version: binary(),
            usb_type_descriptor: binary(),
            firmware_update_id: binary(),
            sensors: binary()
          }

    defstruct device_name: "",
              serial_number: "",
              firmware_version: "",
              usb_type_descriptor: "",
              firmware_update_id: "",
              sensors: ""

    def types,
      do: [
        device_name: :string,
        serial_number: :string,
        firmware_version: :string,
        usb_type_descriptor: :string,
        firmware_update_id: :string,
        sensors: :string
      ]
  end

  def md5sum, do: "914e9cfa74a4f66f08c3fe1016943c1b"

  def definition do
    """
    ---
    string device_name
    string serial_number
    string firmware_version
    string usb_type_descriptor
    string firmware_update_id
    string sensors
    """
  end
end