defmodule Elixir.SensorMsgs.CompressedImage do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          format: binary(),
          data: list(non_neg_integer())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, format: "", data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "8f7a12909da2c9d3332d540a0977563f"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string format
    uint8[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", format: :string, data: :"uint8[]"]
end