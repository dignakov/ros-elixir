defmodule Elixir.ControlMsgs.GripperCommandGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{command: Elixir.ControlMsgs.GripperCommand.t()}

  defstruct command: %Elixir.ControlMsgs.GripperCommand{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "86fd82f4ddc48a4cb6856cfa69217e43"

  @impl ROS.Message.Behaviour
  def definition do
    """
    control_msgs/GripperCommand command
      float64 position
      float64 max_effort
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [command: :"control_msgs/GripperCommand"]
end