defmodule Elixir.ControllerManagerMsgs.ListControllerTypes do
  @moduledoc false

  defmodule Elixir.ControllerManagerMsgs.ListControllerTypes.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.ControllerManagerMsgs.ListControllerTypes.Response do
    @moduledoc false
    @type t :: %__MODULE__{types: list(binary()), base_classes: list(binary())}

    defstruct types: [], base_classes: []

    def types, do: [types: :"string[]", base_classes: :"string[]"]
  end

  def md5sum, do: "c1d4cd11aefa9f97ba4aeb5b33987f4e"

  def definition do
    """
    ---
    string[] types
    string[] base_classes
    """
  end
end