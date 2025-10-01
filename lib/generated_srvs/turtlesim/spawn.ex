defmodule Elixir.Turtlesim.Spawn do
  @moduledoc false

  defmodule Elixir.Turtlesim.Spawn.Request do
    @moduledoc false
    @type t :: %__MODULE__{x: float(), y: float(), theta: float(), name: binary()}

    defstruct x: 0.0, y: 0.0, theta: 0.0, name: ""

    def types, do: [x: :float32, y: :float32, theta: :float32, name: :string]
  end

  defmodule Elixir.Turtlesim.Spawn.Response do
    @moduledoc false
    @type t :: %__MODULE__{name: binary()}

    defstruct name: ""

    def types, do: [name: :string]
  end

  def md5sum, do: "0b2d2e872a8e2887d5ed626f2bf2c561"

  def definition do
    """
    float32 x
    float32 y
    float32 theta
    string name
    ---
    string name
    """
  end
end