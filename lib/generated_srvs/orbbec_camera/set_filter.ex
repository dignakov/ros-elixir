defmodule Elixir.OrbbecCamera.SetFilter do
  @moduledoc false

  defmodule Elixir.OrbbecCamera.SetFilter.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            filter_name: binary(),
            filter_enable: atom(),
            filter_param: list(float())
          }

    defstruct filter_name: "", filter_enable: false, filter_param: []

    def types, do: [filter_name: :string, filter_enable: :bool, filter_param: :"float32[]"]
  end

  defmodule Elixir.OrbbecCamera.SetFilter.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), message: binary()}

    defstruct success: false, message: ""

    def types, do: [success: :bool, message: :string]
  end

  def md5sum, do: "037b7c075b0fb69f649f20b878a7ce51"

  def definition do
    """
    string filter_name
    bool filter_enable
    float32[] filter_param
    ---
    bool success
    string message
    """
  end
end