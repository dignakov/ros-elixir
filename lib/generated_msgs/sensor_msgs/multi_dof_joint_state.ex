defmodule Elixir.SensorMsgs.MultiDOFJointState do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          joint_names: list(binary()),
          transforms: list(Elixir.GeometryMsgs.Transform.t()),
          twist: list(Elixir.GeometryMsgs.Twist.t()),
          wrench: list(Elixir.GeometryMsgs.Wrench.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            joint_names: [],
            transforms: [],
            twist: [],
            wrench: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "690f272f0640d2631c305eeb8301e59d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string[] joint_names
    geometry_msgs/Transform[] transforms
      geometry_msgs/Vector3 translation
        float64 x
        float64 y
        float64 z
      geometry_msgs/Quaternion rotation
        float64 x
        float64 y
        float64 z
        float64 w
    geometry_msgs/Twist[] twist
      geometry_msgs/Vector3 linear
        float64 x
        float64 y
        float64 z
      geometry_msgs/Vector3 angular
        float64 x
        float64 y
        float64 z
    geometry_msgs/Wrench[] wrench
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
  def types,
    do: [
      header: :"std_msgs/Header",
      joint_names: :"string[]",
      transforms: :"geometry_msgs/Transform[]",
      twist: :"geometry_msgs/Twist[]",
      wrench: :"geometry_msgs/Wrench[]"
    ]
end