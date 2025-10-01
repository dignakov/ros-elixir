defmodule Elixir.TopicTools.DemuxSelect do
  @moduledoc false

  defmodule Elixir.TopicTools.DemuxSelect.Request do
    @moduledoc false
    @type t :: %__MODULE__{topic: binary()}

    defstruct topic: ""

    def types, do: [topic: :string]
  end

  defmodule Elixir.TopicTools.DemuxSelect.Response do
    @moduledoc false
    @type t :: %__MODULE__{prev_topic: binary()}

    defstruct prev_topic: ""

    def types, do: [prev_topic: :string]
  end

  def md5sum, do: "053052240ca985e1f2eedbb0dae9b1f7"

  def definition do
    """
    string topic
    ---
    string prev_topic
    """
  end
end