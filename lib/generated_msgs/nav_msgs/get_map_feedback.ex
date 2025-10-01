defmodule Elixir.NavMsgs.GetMapFeedback do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{}

  defstruct []

  @impl ROS.Message.Behaviour
  def md5sum, do: "d41d8cd98f00b204e9800998ecf8427e"

  @impl ROS.Message.Behaviour
  def definition do
    """

    """
  end

  @impl ROS.Message.Behaviour
  def types, do: []
end