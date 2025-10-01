defmodule Elixir.SensorMsgs.TimeReference do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), time_ref: Time.t(), source: binary()}

  defstruct header: %Elixir.StdMsgs.Header{}, time_ref: ~T[00:00:00], source: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "fded64a0265108ba86c3d38fb11c0c16"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    time time_ref
    string source
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", time_ref: :time, source: :string]
end