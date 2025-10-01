defmodule Elixir.GeometryMsgs.TwistStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), twist: Elixir.GeometryMsgs.Twist.t()}

  defstruct header: %Elixir.StdMsgs.Header{}, twist: %Elixir.GeometryMsgs.Twist{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "98d34b0043a2093cf9d9345ab6eef12e"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Twist twist
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
  def types, do: [header: :"std_msgs/Header", twist: :"geometry_msgs/Twist"]
end