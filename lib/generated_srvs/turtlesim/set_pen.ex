defmodule Elixir.Turtlesim.SetPen do
  @moduledoc false

  defmodule Elixir.Turtlesim.SetPen.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            r: non_neg_integer(),
            g: non_neg_integer(),
            b: non_neg_integer(),
            width: non_neg_integer(),
            off: non_neg_integer()
          }

    defstruct r: 0, g: 0, b: 0, width: 0, off: 0

    def types, do: [r: :uint8, g: :uint8, b: :uint8, width: :uint8, off: :uint8]
  end

  defmodule Elixir.Turtlesim.SetPen.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "9f452acce566bf0c0954594f69a8e41b"

  def definition do
    """
    uint8 r
    uint8 g
    uint8 b
    uint8 width
    uint8 off
    ---
    """
  end
end