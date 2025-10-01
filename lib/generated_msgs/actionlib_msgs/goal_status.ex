defmodule Elixir.ActionlibMsgs.GoalStatus do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          goal_id: Elixir.ActionlibMsgs.GoalID.t(),
          status: non_neg_integer(),
          text: binary()
        }

  defstruct goal_id: %Elixir.ActionlibMsgs.GoalID{}, status: 0, text: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "d388f9b87b3c471f784434d671988d4a"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
  def types, do: [goal_id: :"actionlib_msgs/GoalID", status: :uint8, text: :string]

  def pending, do: 0

  def active, do: 1

  def preempted, do: 2

  def succeeded, do: 3

  def aborted, do: 4

  def rejected, do: 5

  def preempting, do: 6

  def recalling, do: 7

  def recalled, do: 8

  def lost, do: 9
end