defmodule Elixir.ActionlibMsgs.GoalID do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{stamp: Time.t(), id: binary()}

  defstruct stamp: ~T[00:00:00], id: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "302881f31927c1df708a2dbab0e80ee8"

  @impl ROS.Message.Behaviour
  def definition do
    """
    time stamp
    string id
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [stamp: :time, id: :string]
end