defmodule Elixir.ActionlibMsgs.GoalStatusArray do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status_list: list(Elixir.ActionlibMsgs.GoalStatus.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, status_list: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "8b2b82f13216d0a8ea88bd3af735e619"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    actionlib_msgs/GoalStatus[] status_list
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
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", status_list: :"actionlib_msgs/GoalStatus[]"]
end