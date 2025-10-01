defmodule Elixir.Tf2Msgs.TFMessage do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{transforms: list(Elixir.GeometryMsgs.TransformStamped.t())}

  defstruct transforms: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "94810edda583a504dfda3829e70d7eec"

  @impl ROS.Message.Behaviour
  def definition do
    """
    geometry_msgs/TransformStamped[] transforms
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      string child_frame_id
      geometry_msgs/Transform transform
        geometry_msgs/Vector3 translation
          float64 x
          float64 y
          float64 z
        geometry_msgs/Quaternion rotation
          float64 x
          float64 y
          float64 z
          float64 w
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [transforms: :"geometry_msgs/TransformStamped[]"]
end