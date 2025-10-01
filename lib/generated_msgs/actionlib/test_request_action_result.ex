defmodule Elixir.Actionlib.TestRequestActionResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status: Elixir.ActionlibMsgs.GoalStatus.t(),
          result: Elixir.Actionlib.TestRequestResult.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            status: %Elixir.ActionlibMsgs.GoalStatus{},
            result: %Elixir.Actionlib.TestRequestResult{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "0476d1fdf437a3a6e7d6d0e9f5561298"

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
    actionlib/TestRequestResult result
      int32 the_result
      bool is_simple_server
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      status: :"actionlib_msgs/GoalStatus",
      result: :"actionlib/TestRequestResult"
    ]
end