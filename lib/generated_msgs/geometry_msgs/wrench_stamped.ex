defmodule Elixir.GeometryMsgs.WrenchStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          wrench: Elixir.GeometryMsgs.Wrench.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, wrench: %Elixir.GeometryMsgs.Wrench{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "d78d3cb249ce23087ade7e7d0c40cfa7"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Wrench wrench
      geometry_msgs/Vector3 force
        float64 x
        float64 y
        float64 z
      geometry_msgs/Vector3 torque
        float64 x
        float64 y
        float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", wrench: :"geometry_msgs/Wrench"]
end