defmodule Elixir.OrbbecCamera.SetArrays do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.SetArrays.Request do
    @moduledoc false
    @type t :: %__MODULE__{enable: atom(), data_param: list(float())}

    defstruct enable: false, data_param: []

    def types, do: [enable: :bool, data_param: :"float32[]"]
  end

  defmodule Elixir.OrbbecCamera.SetArrays.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), message: binary()}

    defstruct success: false, message: ""

    def types, do: [success: :bool, message: :string]
  end

  def md5sum, do: "5ec206645f78d76502a2effe3ab66933"

  def definition do
    """
    bool enable
    float32[] data_param
    ---
    bool success
    string message
    """
  end
end