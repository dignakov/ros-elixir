defmodule Elixir.Roscpp.GetLoggers do
  @moduledoc false

  defmodule Elixir.Roscpp.GetLoggers.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.Roscpp.GetLoggers.Response do
    @moduledoc false
    @type t :: %__MODULE__{loggers: list(Elixir.Roscpp.Logger.t())}

    defstruct loggers: []

    def types, do: [loggers: :"roscpp/Logger[]"]
  end

  def md5sum, do: "32e97e85527d4678a8f9279894bb64b0"

  def definition do
    """
    ---
    roscpp/Logger[] loggers
      string name
      string level
    """
  end
end