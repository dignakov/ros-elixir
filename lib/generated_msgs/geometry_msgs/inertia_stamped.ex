defmodule Elixir.GeometryMsgs.InertiaStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          inertia: Elixir.GeometryMsgs.Inertia.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, inertia: %Elixir.GeometryMsgs.Inertia{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "ddee48caeab5a966c5e8d166654a9ac7"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Inertia inertia
      float64 m
      geometry_msgs/Vector3 com
        float64 x
        float64 y
        float64 z
      float64 ixx
      float64 ixy
      float64 ixz
      float64 iyy
      float64 iyz
      float64 izz
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", inertia: :"geometry_msgs/Inertia"]
end