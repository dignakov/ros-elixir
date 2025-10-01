defmodule Elixir.GeometryMsgs.TransformStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          child_frame_id: binary(),
          transform: Elixir.GeometryMsgs.Transform.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            child_frame_id: "",
            transform: %Elixir.GeometryMsgs.Transform{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "b5764a33bfeb3588febc2682852579b0"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
  def types,
    do: [
      header: :"std_msgs/Header",
      child_frame_id: :string,
      transform: :"geometry_msgs/Transform"
    ]
end