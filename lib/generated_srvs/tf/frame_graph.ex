defmodule Elixir.Tf.FrameGraph do
  @moduledoc false

  defmodule Elixir.Tf.FrameGraph.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.Tf.FrameGraph.Response do
    @moduledoc false
    @type t :: %__MODULE__{dot_graph: binary()}

    defstruct dot_graph: ""

    def types, do: [dot_graph: :string]
  end

  def md5sum, do: "c4af9ac907e58e906eb0b6e3c58478c0"

  def definition do
    """
    ---
    string dot_graph
    """
  end
end