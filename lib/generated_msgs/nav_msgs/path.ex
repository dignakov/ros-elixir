defmodule Elixir.NavMsgs.Path do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          poses: list(Elixir.GeometryMsgs.PoseStamped.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, poses: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "6227e2b7e9cce15051f669a5e197bbf7"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/PoseStamped[] poses
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      geometry_msgs/Pose pose
        geometry_msgs/Point position
          float64 x
          float64 y
          float64 z
        geometry_msgs/Quaternion orientation
          float64 x
          float64 y
          float64 z
          float64 w
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", poses: :"geometry_msgs/PoseStamped[]"]
end