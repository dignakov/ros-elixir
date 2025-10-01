defmodule Elixir.Turtlesim.TeleportAbsolute do
  @moduledoc false

  defmodule Elixir.Turtlesim.TeleportAbsolute.Request do
    @moduledoc false
    @type t :: %__MODULE__{x: float(), y: float(), theta: float()}

    defstruct x: 0.0, y: 0.0, theta: 0.0

    def types, do: [x: :float32, y: :float32, theta: :float32]
  end

  defmodule Elixir.Turtlesim.TeleportAbsolute.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "a130bc60ee6513855dc62ea83fcc5b20"

  def definition do
    """
    float32 x
    float32 y
    float32 theta
    ---
    """
  end
end