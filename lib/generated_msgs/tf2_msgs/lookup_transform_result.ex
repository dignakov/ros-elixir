defmodule Elixir.Tf2Msgs.LookupTransformResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          transform: Elixir.GeometryMsgs.TransformStamped.t(),
          error: Elixir.Tf2Msgs.TF2Error.t()
        }

  defstruct transform: %Elixir.GeometryMsgs.TransformStamped{}, error: %Elixir.Tf2Msgs.TF2Error{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "3fe5db6a19ca9cfb675418c5ad875c36"

  @impl ROS.Message.Behaviour
  def definition do
    """
    geometry_msgs/TransformStamped transform
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
    tf2_msgs/TF2Error error
      uint8 NO_ERROR=0
      uint8 LOOKUP_ERROR=1
      uint8 CONNECTIVITY_ERROR=2
      uint8 EXTRAPOLATION_ERROR=3
      uint8 INVALID_ARGUMENT_ERROR=4
      uint8 TIMEOUT_ERROR=5
      uint8 TRANSFORM_ERROR=6
      uint8 error
      string error_string
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [transform: :"geometry_msgs/TransformStamped", error: :"tf2_msgs/TF2Error"]
end