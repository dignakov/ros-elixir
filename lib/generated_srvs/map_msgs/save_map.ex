defmodule Elixir.MapMsgs.SaveMap do
  @moduledoc false

  defmodule Elixir.MapMsgs.SaveMap.Request do
    @moduledoc false
    @type t :: %__MODULE__{filename: Elixir.StdMsgs.String.t()}

    defstruct filename: %Elixir.StdMsgs.String{}

    def types, do: [filename: :"std_msgs/String"]
  end

  defmodule Elixir.MapMsgs.SaveMap.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "716e25f9d9dc76ceba197f93cbf05dc7"

  def definition do
    """
    std_msgs/String filename
      string data
    ---
    """
  end
end