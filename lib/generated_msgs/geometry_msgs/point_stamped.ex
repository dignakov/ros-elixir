defmodule Elixir.GeometryMsgs.PointStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), point: Elixir.GeometryMsgs.Point.t()}

  defstruct header: %Elixir.StdMsgs.Header{}, point: %Elixir.GeometryMsgs.Point{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "c63aecb41bfdfd6b7e1fac37c7cbe7bf"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Point point
      float64 x
      float64 y
      float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", point: :"geometry_msgs/Point"]
end