defmodule Elixir.StdSrvs.Empty do
  @moduledoc false

  defmodule Elixir.StdSrvs.Empty.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.StdSrvs.Empty.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "d41d8cd98f00b204e9800998ecf8427e"

  def definition do
    """
    ---
    """
  end
end