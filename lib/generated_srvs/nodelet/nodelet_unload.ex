defmodule Elixir.Nodelet.NodeletUnload do
  @moduledoc false

  defmodule Elixir.Nodelet.NodeletUnload.Request do
    @moduledoc false
    @type t :: %__MODULE__{name: binary()}

    defstruct name: ""

    def types, do: [name: :string]
  end

  defmodule Elixir.Nodelet.NodeletUnload.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom()}

    defstruct success: false

    def types, do: [success: :bool]
  end

  def md5sum, do: "d08a3b641c2f8680fbdfb1ea2e17a3e1"

  def definition do
    """
    string name
    ---
    bool success
    """
  end
end