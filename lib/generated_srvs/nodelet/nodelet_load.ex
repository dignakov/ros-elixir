defmodule Elixir.Nodelet.NodeletLoad do
  @moduledoc false

  defmodule Elixir.Nodelet.NodeletLoad.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            name: binary(),
            type: binary(),
            remap_source_args: list(binary()),
            remap_target_args: list(binary()),
            my_argv: list(binary()),
            bond_id: binary()
          }

    defstruct name: "",
              type: "",
              remap_source_args: [],
              remap_target_args: [],
              my_argv: [],
              bond_id: ""

    def types,
      do: [
        name: :string,
        type: :string,
        remap_source_args: :"string[]",
        remap_target_args: :"string[]",
        my_argv: :"string[]",
        bond_id: :string
      ]
  end

  defmodule Elixir.Nodelet.NodeletLoad.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom()}

    defstruct success: false

    def types, do: [success: :bool]
  end

  def md5sum, do: "8cfbf33bf3fbd4c54a833f6e2b105331"

  def definition do
    """
    string name
    string type
    string[] remap_source_args
    string[] remap_target_args
    string[] my_argv
    string bond_id
    ---
    bool success
    """
  end
end