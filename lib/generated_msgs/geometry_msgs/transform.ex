defmodule Elixir.GeometryMsgs.Transform do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          translation: Elixir.GeometryMsgs.Vector3.t(),
          rotation: Elixir.GeometryMsgs.Quaternion.t()
        }

  defstruct translation: %Elixir.GeometryMsgs.Vector3{},
            rotation: %Elixir.GeometryMsgs.Quaternion{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "ac9eff44abf714214112b05d54a3cf9b"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
  def types, do: [translation: :"geometry_msgs/Vector3", rotation: :"geometry_msgs/Quaternion"]
end