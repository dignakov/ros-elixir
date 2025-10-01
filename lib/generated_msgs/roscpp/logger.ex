defmodule Elixir.Roscpp.Logger do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{name: binary(), level: binary()}

  defstruct name: "", level: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "a6069a2ff40db7bd32143dd66e1f408e"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    string level
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, level: :string]
end