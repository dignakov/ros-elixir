defmodule Elixir.TopicTools.MuxAdd do
  @moduledoc false

  defmodule Elixir.TopicTools.MuxAdd.Request do
    @moduledoc false
    @type t :: %__MODULE__{topic: binary()}

    defstruct topic: ""

    def types, do: [topic: :string]
  end

  defmodule Elixir.TopicTools.MuxAdd.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "d8f94bae31b356b24d0427f80426d0c3"

  def definition do
    """
    string topic
    ---
    """
  end
end