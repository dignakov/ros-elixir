defmodule Elixir.StdSrvs.SetBool do
  @moduledoc false

  defmodule Elixir.StdSrvs.SetBool.Request do
    @moduledoc false
    @type t :: %__MODULE__{data: atom()}

    defstruct data: false

    def types, do: [data: :bool]
  end

  defmodule Elixir.StdSrvs.SetBool.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), message: binary()}

    defstruct success: false, message: ""

    def types, do: [success: :bool, message: :string]
  end

  def md5sum, do: "09fb03525b03e7ea1fd3992bafd87e16"

  def definition do
    """
    bool data
    ---
    bool success
    string message
    """
  end
end