defmodule Elixir.Tf2Msgs.FrameGraph do
  @moduledoc false

  defmodule Elixir.Tf2Msgs.FrameGraph.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.Tf2Msgs.FrameGraph.Response do
    @moduledoc false
    @type t :: %__MODULE__{frame_yaml: binary()}

    defstruct frame_yaml: ""

    def types, do: [frame_yaml: :string]
  end

  def md5sum, do: "437ea58e9463815a0d511c7326b686b0"

  def definition do
    """
    ---
    string frame_yaml
    """
  end
end