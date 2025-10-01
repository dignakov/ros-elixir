defmodule Elixir.OrbbecCamera.GetBool do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.GetBool.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.OrbbecCamera.GetBool.Response do
    @moduledoc false
    @type t :: %__MODULE__{data: atom(), success: atom(), message: binary()}

    defstruct data: false, success: false, message: ""

    def types, do: [data: :bool, success: :bool, message: :string]
  end

  def md5sum, do: "43f76a855b16e988566e147b692f2fab"

  def definition do
    """
    ---
    bool data
    bool success
    string message
    """
  end
end