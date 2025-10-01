defmodule Elixir.OrbbecCamera.SetInt32 do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.SetInt32.Request do
    @moduledoc false
    @type t :: %__MODULE__{data: integer()}

    defstruct data: 0

    def types, do: [data: :int32]
  end

  defmodule Elixir.OrbbecCamera.SetInt32.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), message: binary()}

    defstruct success: false, message: ""

    def types, do: [success: :bool, message: :string]
  end

  def md5sum, do: "41a6318c88ca9d75d7a585e2aa4ca6ea"

  def definition do
    """
    int32 data
    ---
    bool success
    string message
    """
  end
end