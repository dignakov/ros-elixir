defmodule Elixir.Nodelet.NodeletList do
  @moduledoc false

  defmodule Elixir.Nodelet.NodeletList.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.Nodelet.NodeletList.Response do
    @moduledoc false
    @type t :: %__MODULE__{nodelets: list(binary())}

    defstruct nodelets: []

    def types, do: [nodelets: :"string[]"]
  end

  def md5sum, do: "99c7b10e794f5600b8030e697e946ca7"

  def definition do
    """
    ---
    string[] nodelets
    """
  end
end