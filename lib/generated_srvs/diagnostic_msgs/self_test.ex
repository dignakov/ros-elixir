defmodule Elixir.DiagnosticMsgs.SelfTest do
  @moduledoc false

  defmodule Elixir.DiagnosticMsgs.SelfTest.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.DiagnosticMsgs.SelfTest.Response do
    @moduledoc false
    @type t :: %__MODULE__{
            id: binary(),
            passed: integer(),
            status: list(Elixir.DiagnosticMsgs.DiagnosticStatus.t())
          }

    defstruct id: "", passed: 0, status: []

    def types, do: [id: :string, passed: :int8, status: :"diagnostic_msgs/DiagnosticStatus[]"]
  end

  def md5sum, do: "ac21b1bab7ab17546986536c22eb34e9"

  def definition do
    """
    ---
    string id
    byte passed
    diagnostic_msgs/DiagnosticStatus[] status
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
end