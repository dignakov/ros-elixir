defmodule Elixir.GeometryMsgs.Vector3Stamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          vector: Elixir.GeometryMsgs.Vector3.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, vector: %Elixir.GeometryMsgs.Vector3{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "7b324c7325e683bf02a9b14b01090ec7"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Vector3 vector
      float64 x
      float64 y
      float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", vector: :"geometry_msgs/Vector3"]
end