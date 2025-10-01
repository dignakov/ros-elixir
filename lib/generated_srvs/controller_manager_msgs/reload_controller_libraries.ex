defmodule Elixir.ControllerManagerMsgs.ReloadControllerLibraries do
  @moduledoc false

  defmodule Elixir.ControllerManagerMsgs.ReloadControllerLibraries.Request do
    @moduledoc false
    @type t :: %__MODULE__{force_kill: atom()}

    defstruct force_kill: false

    def types, do: [force_kill: :bool]
  end

  defmodule Elixir.ControllerManagerMsgs.ReloadControllerLibraries.Response do
    @moduledoc false
    @type t :: %__MODULE__{ok: atom()}

    defstruct ok: false

    def types, do: [ok: :bool]
  end

  def md5sum, do: "40e8c411fd1797d2e2c486018f846040"

  def definition do
    """
    bool force_kill
    ---
    bool ok
    """
  end
end