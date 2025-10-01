defmodule Elixir.Tf2Msgs.LookupTransformActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.Tf2Msgs.LookupTransformGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.Tf2Msgs.LookupTransformGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "f2e7bcdb75c847978d0351a13e699da5"

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
    tf2_msgs/LookupTransformGoal goal
      string target_frame
      string source_frame
      time source_time
      duration timeout
      time target_time
      string fixed_frame
      bool advanced
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"tf2_msgs/LookupTransformGoal"
    ]
end