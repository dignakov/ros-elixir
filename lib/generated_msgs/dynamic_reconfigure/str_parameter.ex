defmodule Elixir.DynamicReconfigure.StrParameter do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{name: binary(), value: binary()}

  defstruct name: "", value: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "bc6ccc4a57f61779c8eaae61e9f422e0"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    string value
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, value: :string]
end