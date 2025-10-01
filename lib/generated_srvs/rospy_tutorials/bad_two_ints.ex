defmodule Elixir.RospyTutorials.BadTwoInts do
  @moduledoc false

  defmodule Elixir.RospyTutorials.BadTwoInts.Request do
    @moduledoc false
    @type t :: %__MODULE__{a: integer(), b: integer()}

    defstruct a: 0, b: 0

    def types, do: [a: :int64, b: :int32]
  end

  defmodule Elixir.RospyTutorials.BadTwoInts.Response do
    @moduledoc false
    @type t :: %__MODULE__{sum: integer()}

    defstruct sum: 0

    def types, do: [sum: :int32]
  end

  def md5sum, do: "60962375a49bd6746d7c85dff75ebb9c"

  def definition do
    """
    int64 a
    int32 b
    ---
    int32 sum
    """
  end
end