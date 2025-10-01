defmodule Elixir.Roscpp.SetLoggerLevel do
  @moduledoc false

  defmodule Elixir.Roscpp.SetLoggerLevel.Request do
    @moduledoc false
    @type t :: %__MODULE__{logger: binary(), level: binary()}

    defstruct logger: "", level: ""

    def types, do: [logger: :string, level: :string]
  end

  defmodule Elixir.Roscpp.SetLoggerLevel.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "51da076440d78ca1684d36c868df61ea"

  def definition do
    """
    string logger
    string level
    ---
    """
  end
end