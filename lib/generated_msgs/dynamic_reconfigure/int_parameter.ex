defmodule Elixir.DynamicReconfigure.IntParameter do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{name: binary(), value: integer()}

  defstruct name: "", value: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "65fedc7a0cbfb8db035e46194a350bf1"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    int32 value
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, value: :int32]
end