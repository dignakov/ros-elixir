defmodule Elixir.Actionlib.TestFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{feedback: integer()}

  defstruct feedback: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "49ceb5b32ea3af22073ede4a0328249e"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 feedback
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [feedback: :int32]
end