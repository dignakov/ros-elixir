defmodule Elixir.Actionlib.TestRequestActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.Actionlib.TestRequestGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.Actionlib.TestRequestGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "1889556d3fef88f821c7cb004e4251f3"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    actionlib_msgs/GoalID goal_id
      time stamp
      string id
    actionlib/TestRequestGoal goal
      int32 TERMINATE_SUCCESS=0
      int32 TERMINATE_ABORTED=1
      int32 TERMINATE_REJECTED=2
      int32 TERMINATE_LOSE=3
      int32 TERMINATE_DROP=4
      int32 TERMINATE_EXCEPTION=5
      int32 terminate_status
      bool ignore_cancel
      string result_text
      int32 the_result
      bool is_simple_client
      duration delay_accept
      duration delay_terminate
      duration pause_status
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"actionlib/TestRequestGoal"
    ]
end