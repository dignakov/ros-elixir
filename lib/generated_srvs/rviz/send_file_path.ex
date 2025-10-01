defmodule Elixir.Rviz.SendFilePath do
  @moduledoc false

  defmodule Elixir.Rviz.SendFilePath.Request do
    @moduledoc false
    @type t :: %__MODULE__{path: Elixir.StdMsgs.String.t()}

    defstruct path: %Elixir.StdMsgs.String{}

    def types, do: [path: :"std_msgs/String"]
  end

  defmodule Elixir.Rviz.SendFilePath.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom()}

    defstruct success: false

    def types, do: [success: :bool]
  end

  def md5sum, do: "92f17244ff295b327b62c307fafe751b"

  def definition do
    """
    std_msgs/String path
      string data
    ---
    bool success
    """
  end
end