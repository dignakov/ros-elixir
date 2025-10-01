defmodule Elixir.IrisSupportMsgs.CmdLightString do
  @moduledoc false

  defmodule Elixir.IrisSupportMsgs.CmdLightString.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            header: Elixir.StdMsgs.Header.t(),
            colour_code: binary(),
            modulation: binary(),
            milliseconds: non_neg_integer()
          }

    defstruct header: %Elixir.StdMsgs.Header{}, colour_code: "", modulation: "", milliseconds: 0

    def types,
      do: [
        header: :"std_msgs/Header",
        colour_code: :string,
        modulation: :string,
        milliseconds: :uint32
      ]
  end

  defmodule Elixir.IrisSupportMsgs.CmdLightString.Response do
    @moduledoc false
    @type t :: %__MODULE__{success: atom(), message: binary()}

    defstruct success: false, message: ""

    def types, do: [success: :bool, message: :string]
  end

  def md5sum, do: "8558b57eda1e7a7a4040704bedb68588"

  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string colour_code
    string modulation
    uint32 milliseconds
    ---
    bool success
    string message
    """
  end
end