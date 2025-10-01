defmodule Elixir.ControllerManagerMsgs.UnloadController do
  @moduledoc false

  defmodule Elixir.ControllerManagerMsgs.UnloadController.Request do
    @moduledoc false
    @type t :: %__MODULE__{name: binary()}

    defstruct name: ""

    def types, do: [name: :string]
  end

  defmodule Elixir.ControllerManagerMsgs.UnloadController.Response do
    @moduledoc false
    @type t :: %__MODULE__{ok: atom()}

    defstruct ok: false

    def types, do: [ok: :bool]
  end

  def md5sum, do: "647e5c54b8d6468952d8d31f1efe96c0"

  def definition do
    """
    string name
    ---
    bool ok
    """
  end
end