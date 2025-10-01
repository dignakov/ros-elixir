defmodule Elixir.ControlMsgs.QueryTrajectoryState do
  @moduledoc false

  defmodule Elixir.ControlMsgs.QueryTrajectoryState.Request do
    @moduledoc false
    @type t :: %__MODULE__{time: Time.t()}

    defstruct time: ~T[00:00:00]

    def types, do: [time: :time]
  end

  defmodule Elixir.ControlMsgs.QueryTrajectoryState.Response do
    @moduledoc false
    @type t :: %__MODULE__{
            name: list(binary()),
            position: list(float()),
            velocity: list(float()),
            acceleration: list(float())
          }

    defstruct name: [], position: [], velocity: [], acceleration: []

    def types,
      do: [
        name: :"string[]",
        position: :"float64[]",
        velocity: :"float64[]",
        acceleration: :"float64[]"
      ]
  end

  def md5sum, do: "ec93cdecbd8062d761aa52b7c90cd44b"

  def definition do
    """
    time time
    ---
    string[] name
    float64[] position
    float64[] velocity
    float64[] acceleration
    """
  end
end