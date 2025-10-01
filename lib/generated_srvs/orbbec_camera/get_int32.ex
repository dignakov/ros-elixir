defmodule Elixir.OrbbecCamera.GetInt32 do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.GetInt32.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.OrbbecCamera.GetInt32.Response do
    @moduledoc false
    @type t :: %__MODULE__{data: integer(), success: atom(), message: binary()}

    defstruct data: 0, success: false, message: ""

    def types, do: [data: :int32, success: :bool, message: :string]
  end

  def md5sum, do: "1e06c77f31583d55c01571a573d75b9f"

  def definition do
    """
    ---
    int32 data
    bool success
    string message
    """
  end
end