defmodule Elixir.Tf2Msgs.LookupTransformActionResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status: Elixir.ActionlibMsgs.GoalStatus.t(),
          result: Elixir.Tf2Msgs.LookupTransformResult.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            status: %Elixir.ActionlibMsgs.GoalStatus{},
            result: %Elixir.Tf2Msgs.LookupTransformResult{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "ac26ce75a41384fa8bb4dc10f491ab90"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    actionlib_msgs/GoalStatus status
      uint8 PENDING=0
      uint8 ACTIVE=1
      uint8 PREEMPTED=2
      uint8 SUCCEEDED=3
      uint8 ABORTED=4
      uint8 REJECTED=5
      uint8 PREEMPTING=6
      uint8 RECALLING=7
      uint8 RECALLED=8
      uint8 LOST=9
      actionlib_msgs/GoalID goal_id
        time stamp
        string id
      uint8 status
      string text
    tf2_msgs/LookupTransformResult result
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
  def types,
    do: [
      header: :"std_msgs/Header",
      status: :"actionlib_msgs/GoalStatus",
      result: :"tf2_msgs/LookupTransformResult"
    ]
end