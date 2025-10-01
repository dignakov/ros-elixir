defmodule Elixir.DiagnosticMsgs.KeyValue do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{key: binary(), value: binary()}

  defstruct key: "", value: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "cf57fdc6617a881a88c16e768132149c"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string key
    string value
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [key: :string, value: :string]
end