defmodule Elixir.TopicTools.MuxList do
  @moduledoc false

  defmodule Elixir.TopicTools.MuxList.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.TopicTools.MuxList.Response do
    @moduledoc false
    @type t :: %__MODULE__{topics: list(binary())}

    defstruct topics: []

    def types, do: [topics: :"string[]"]
  end

  def md5sum, do: "b0eef9a05d4e829092fc2f2c3c2aad3d"

  def definition do
    """
    ---
    string[] topics
    """
  end
end