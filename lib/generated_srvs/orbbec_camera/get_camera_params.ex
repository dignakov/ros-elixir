defmodule Elixir.OrbbecCamera.GetCameraParams do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.GetCameraParams.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.OrbbecCamera.GetCameraParams.Response do
    @moduledoc false
    @type t :: %__MODULE__{
            l_intr_p: list(float()),
            r_intr_p: list(float()),
            r2l_r: list(float()),
            r2l_t: list(float()),
            success: atom(),
            message: binary()
          }

    defstruct l_intr_p: [], r_intr_p: [], r2l_r: [], r2l_t: [], success: false, message: ""

    def types,
      do: [
        l_intr_p: :"float32[]",
        r_intr_p: :"float32[]",
        r2l_r: :"float32[]",
        r2l_t: :"float32[]",
        success: :bool,
        message: :string
      ]
  end

  def md5sum, do: "06621ca772ba4ac96475002c209b1554"

  def definition do
    """
    ---
    float32[4] l_intr_p
    float32[4] r_intr_p
    float32[9] r2l_r
    float32[3] r2l_t
    bool success
    string message
    """
  end
end