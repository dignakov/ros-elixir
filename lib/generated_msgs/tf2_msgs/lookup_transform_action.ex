defmodule Elixir.Tf2Msgs.LookupTransformAction do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          action_goal: Elixir.Tf2Msgs.LookupTransformActionGoal.t(),
          action_result: Elixir.Tf2Msgs.LookupTransformActionResult.t(),
          action_feedback: Elixir.Tf2Msgs.LookupTransformActionFeedback.t()
        }

  defstruct action_goal: %Elixir.Tf2Msgs.LookupTransformActionGoal{},
            action_result: %Elixir.Tf2Msgs.LookupTransformActionResult{},
            action_feedback: %Elixir.Tf2Msgs.LookupTransformActionFeedback{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "7ee01ba91a56c2245c610992dbaa3c37"

  @impl ROS.Message.Behaviour
  def definition do
    """
    tf2_msgs/LookupTransformActionGoal action_goal
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      actionlib_msgs/GoalID goal_id
        time stamp
        string id
      tf2_msgs/LookupTransformGoal goal
        string target_frame
        string source_frame
        time source_time
        duration timeout
        time target_time
        string fixed_frame
        bool advanced
    tf2_msgs/LookupTransformActionResult action_result
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
    tf2_msgs/LookupTransformActionFeedback action_feedback
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
      tf2_msgs/LookupTransformFeedback feedback
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      action_goal: :"tf2_msgs/LookupTransformActionGoal",
      action_result: :"tf2_msgs/LookupTransformActionResult",
      action_feedback: :"tf2_msgs/LookupTransformActionFeedback"
    ]
end