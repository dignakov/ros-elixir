defmodule Elixir.ControlMsgs.PointHeadActionGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          goal: Elixir.ControlMsgs.PointHeadGoal.t()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            goal_id: %Elixir.ActionlibMsgs.GoalID{},
            goal: %Elixir.ControlMsgs.PointHeadGoal{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "b53a8323d0ba7b310ba17a2d3a82a6b8"

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
    control_msgs/PointHeadGoal goal
      geometry_msgs/PointStamped target
        std_msgs/Header header
          uint32 seq
          time stamp
          string frame_id
        geometry_msgs/Point point
          float64 x
          float64 y
          float64 z
      geometry_msgs/Vector3 pointing_axis
        float64 x
        float64 y
        float64 z
      string pointing_frame
      duration min_duration
      float64 max_velocity
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      goal_id: :"actionlib_msgs/GoalID",
      goal: :"control_msgs/PointHeadGoal"
    ]
end