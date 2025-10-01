defmodule Elixir.ActionlibTutorials.AveragingActionFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status: Elixir.ActionlibMsgs.GoalStatus.t(),
          feedback: Elixir.ActionlibTutorials.AveragingFeedback.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            status: %Elixir.ActionlibMsgs.GoalStatus{},
            feedback: %Elixir.ActionlibTutorials.AveragingFeedback{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "78a4a09241b1791069223ae7ebd5b16b"

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
    actionlib_tutorials/AveragingFeedback feedback
      int32 sample
      float32 data
      float32 mean
      float32 std_dev
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      status: :"actionlib_msgs/GoalStatus",
      feedback: :"actionlib_tutorials/AveragingFeedback"
    ]
end