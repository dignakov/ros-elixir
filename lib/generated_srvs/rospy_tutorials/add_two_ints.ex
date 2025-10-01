defmodule Elixir.RospyTutorials.AddTwoInts do
  @moduledoc false

  defmodule Elixir.RospyTutorials.AddTwoInts.Request do
    @moduledoc false
    @type t :: %__MODULE__{a: integer(), b: integer()}

    defstruct a: 0, b: 0

    def types, do: [a: :int64, b: :int64]
  end

  defmodule Elixir.RospyTutorials.AddTwoInts.Response do
    @moduledoc false
    @type t :: %__MODULE__{sum: integer()}

    defstruct sum: 0

    def types, do: [sum: :int64]
  end

  def md5sum, do: "6a2e34150c00229791cc89ff309fff21"

  def definition do
    """
    int64 a
    int64 b
    ---
    int64 sum
    """
  end
end