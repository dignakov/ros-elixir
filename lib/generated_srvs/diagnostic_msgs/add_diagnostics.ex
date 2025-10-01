defmodule Elixir.DiagnosticMsgs.AddDiagnostics do
  @moduledoc false

  defmodule Elixir.DiagnosticMsgs.AddDiagnostics.Request do
    @moduledoc false
    @type t :: %__MODULE__{load_namespace: binary()}

    defstruct load_namespace: ""

    def types, do: [load_namespace: :string]
  end

  defmodule Elixir.DiagnosticMsgs.AddDiagnostics.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), message: binary()}

    defstruct success: false, message: ""

    def types, do: [success: :bool, message: :string]
  end

  def md5sum, do: "e6ac9bbde83d0d3186523c3687aecaee"

  def definition do
    """
    string load_namespace
    ---
    bool success
    string message
    """
  end
end