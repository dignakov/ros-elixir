defmodule Elixir.StdSrvs.Trigger do
  @moduledoc false

  defmodule Elixir.StdSrvs.Trigger.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.StdSrvs.Trigger.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), message: binary()}

    defstruct success: false, message: ""

    def types, do: [success: :bool, message: :string]
  end

  def md5sum, do: "937c9679a518e3a18d831e57125ea522"

  def definition do
    """
    ---
    bool success
    string message
    """
  end
end