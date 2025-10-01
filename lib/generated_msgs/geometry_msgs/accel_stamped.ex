defmodule Elixir.GeometryMsgs.AccelStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), accel: Elixir.GeometryMsgs.Accel.t()}

  defstruct header: %Elixir.StdMsgs.Header{}, accel: %Elixir.GeometryMsgs.Accel{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "d8a98a5d81351b6eb0578c78557e7659"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Accel accel
      geometry_msgs/Vector3 linear
        float64 x
        float64 y
        float64 z
      geometry_msgs/Vector3 angular
        float64 x
        float64 y
        float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", accel: :"geometry_msgs/Accel"]
end