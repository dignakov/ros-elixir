defmodule Elixir.Turtlesim.TeleportRelative do
  @moduledoc false

  defmodule Elixir.Turtlesim.TeleportRelative.Request do
    @moduledoc false
    @type t :: %__MODULE__{linear: float(), angular: float()}

    defstruct linear: 0.0, angular: 0.0

    def types, do: [linear: :float32, angular: :float32]
  end

  defmodule Elixir.Turtlesim.TeleportRelative.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "9d5c2dcd348ac8f76ce2a4307bd63a13"

  def definition do
    """
    float32 linear
    float32 angular
    ---
    """
  end
end