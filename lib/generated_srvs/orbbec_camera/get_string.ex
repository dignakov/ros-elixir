defmodule Elixir.OrbbecCamera.GetString do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.GetString.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.OrbbecCamera.GetString.Response do
    @moduledoc false
    @type t :: %__MODULE__{data: binary(), success: atom(), message: binary()}

    defstruct data: "", success: false, message: ""

    def types, do: [data: :string, success: :bool, message: :string]
  end

  def md5sum, do: "15baad3d82a7b70bfc4eb31d66322293"

  def definition do
    """
    ---
    string data
    bool success
    string message
    """
  end
end