defmodule Elixir.ControllerManagerMsgs.SwitchController do
  @moduledoc false

  defmodule Elixir.ControllerManagerMsgs.SwitchController.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            start_controllers: list(binary()),
            stop_controllers: list(binary()),
            strictness: integer(),
            start_asap: atom(),
            timeout: float()
          }

    defstruct start_controllers: [],
              stop_controllers: [],
              strictness: 0,
              start_asap: false,
              timeout: 0.0

    def types,
      do: [
        start_controllers: :"string[]",
        stop_controllers: :"string[]",
        strictness: :int32,
        start_asap: :bool,
        timeout: :float64
      ]

    def best_effort, do: 1

    def strict, do: 2
  end

  defmodule Elixir.ControllerManagerMsgs.SwitchController.Response do
    @moduledoc false
    @type t :: %__MODULE__{ok: atom()}

    defstruct ok: false

    def types, do: [ok: :bool]
  end

  def md5sum, do: "b29a7abc673b2c54c14b54e50f8d06a5"

  def definition do
    """
    int32 BEST_EFFORT=1
    int32 STRICT=2
    string[] start_controllers
    string[] stop_controllers
    int32 strictness
    bool start_asap
    float64 timeout
    ---
    bool ok
    """
  end
end