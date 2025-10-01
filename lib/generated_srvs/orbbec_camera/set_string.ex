defmodule Elixir.OrbbecCamera.SetString do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.SetString.Request do
    @moduledoc false
    @type t :: %__MODULE__{data: binary()}

    defstruct data: ""

    def types, do: [data: :string]
  end

  defmodule Elixir.OrbbecCamera.SetString.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), message: binary()}

    defstruct success: false, message: ""

    def types, do: [success: :bool, message: :string]
  end

  def md5sum, do: "546971982e3fbbd5a41e60fb6432e357"

  def definition do
    """
    string data
    ---
    bool success
    string message
    """
  end
end