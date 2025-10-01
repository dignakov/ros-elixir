defmodule Elixir.ControlMsgs.FollowJointTrajectoryResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{error_code: integer(), error_string: binary()}

  defstruct error_code: 0, error_string: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "493383b18409bfb604b4e26c676401d2"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 SUCCESSFUL=0
    int32 INVALID_GOAL=-1
    int32 INVALID_JOINTS=-2
    int32 OLD_HEADER_TIMESTAMP=-3
    int32 PATH_TOLERANCE_VIOLATED=-4
    int32 GOAL_TOLERANCE_VIOLATED=-5
    int32 error_code
    string error_string
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [error_code: :int32, error_string: :string]

  def successful, do: 0

  def invalid_goal, do: -1

  def invalid_joints, do: -2

  def old_header_timestamp, do: -3

  def path_tolerance_violated, do: -4

  def goal_tolerance_violated, do: -5
end