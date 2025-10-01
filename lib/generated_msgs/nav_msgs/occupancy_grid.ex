defmodule Elixir.NavMsgs.OccupancyGrid do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          info: Elixir.NavMsgs.MapMetaData.t(),
          data: list(integer())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, info: %Elixir.NavMsgs.MapMetaData{}, data: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "3381f2d731d4076ec5c71b0759edbe4e"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    nav_msgs/MapMetaData info
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
    int8[] data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", info: :"nav_msgs/MapMetaData", data: :"int8[]"]
end