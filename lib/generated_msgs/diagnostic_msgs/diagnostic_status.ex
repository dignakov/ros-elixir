defmodule Elixir.DiagnosticMsgs.DiagnosticStatus do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          level: integer(),
          name: binary(),
          message: binary(),
          hardware_id: binary(),
          values: list(Elixir.DiagnosticMsgs.KeyValue.t())
        }

  defstruct level: 0, name: "", message: "", hardware_id: "", values: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "d0ce08bc6e5ba34c7754f563a9cabaf1"

  @impl ROS.Message.Behaviour
  def definition do
    """
    byte OK=0
    byte WARN=1
    byte ERROR=2
    byte STALE=3
    byte level
    string name
    string message
    string hardware_id
    diagnostic_msgs/KeyValue[] values
      string key
      string value
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      level: :int8,
      name: :string,
      message: :string,
      hardware_id: :string,
      values: :"diagnostic_msgs/KeyValue[]"
    ]

  def ok, do: 0

  def warn, do: 1

  def error, do: 2

  def stale, do: 3
end