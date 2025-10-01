defmodule Elixir.GeometryMsgs.QuaternionStamped do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          quaternion: Elixir.GeometryMsgs.Quaternion.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, quaternion: %Elixir.GeometryMsgs.Quaternion{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "e57f1e547e0e1fd13504588ffc8334e2"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Quaternion quaternion
      float64 x
      float64 y
      float64 z
      float64 w
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", quaternion: :"geometry_msgs/Quaternion"]
end