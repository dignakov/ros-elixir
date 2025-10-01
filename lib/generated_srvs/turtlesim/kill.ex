defmodule Elixir.Turtlesim.Kill do
  @moduledoc false

  defmodule Elixir.Turtlesim.Kill.Request do
    @moduledoc false
    @type t :: %__MODULE__{name: binary()}

    defstruct name: ""

    def types, do: [name: :string]
  end

  defmodule Elixir.Turtlesim.Kill.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "c1f3d28f1b044c871e6eff2e9fc3c667"

  def definition do
    """
    string name
    ---
    """
  end
end