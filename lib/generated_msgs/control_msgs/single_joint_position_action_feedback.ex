defmodule Elixir.ControlMsgs.SingleJointPositionActionFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status: Elixir.ActionlibMsgs.GoalStatus.t(),
          feedback: Elixir.ControlMsgs.SingleJointPositionFeedback.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            status: %Elixir.ActionlibMsgs.GoalStatus{},
            feedback: %Elixir.ControlMsgs.SingleJointPositionFeedback{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "3503b7cf8972f90d245850a5d8796cfa"

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
    control_msgs/SingleJointPositionFeedback feedback
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      float64 position
      float64 velocity
      float64 error
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      status: :"actionlib_msgs/GoalStatus",
      feedback: :"control_msgs/SingleJointPositionFeedback"
    ]
end