defmodule Elixir.NavMsgs.MapMetaData do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          map_load_time: Time.t(),
          resolution: float(),
          width: non_neg_integer(),
          height: non_neg_integer(),
          origin: Elixir.GeometryMsgs.Pose.t()
        }

  defstruct map_load_time: ~T[00:00:00],
            resolution: 0.0,
            width: 0,
            height: 0,
            origin: %Elixir.GeometryMsgs.Pose{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "10cfc8a2818024d3248802c00c95f11b"

  @impl ROS.Message.Behaviour
  def definition do
    """
    time map_load_time
    float32 resolution
    uint32 width
    uint32 height
    geometry_msgs/Pose origin
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
  def types,
    do: [
      map_load_time: :time,
      resolution: :float32,
      width: :uint32,
      height: :uint32,
      origin: :"geometry_msgs/Pose"
    ]
end