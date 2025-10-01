defmodule Elixir.DynamicReconfigure.BoolParameter do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{name: binary(), value: atom()}

  defstruct name: "", value: false

  @impl ROS.Message.Behaviour
  def md5sum, do: "23f05028c1a699fb83e22401228c3a9e"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    bool value
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, value: :bool]
end