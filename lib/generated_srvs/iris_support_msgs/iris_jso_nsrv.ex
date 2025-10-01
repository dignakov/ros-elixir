defmodule Elixir.IrisSupportMsgs.IrisJSONsrv do
  @moduledoc false

  defmodule Elixir.IrisSupportMsgs.IrisJSONsrv.Request do
    @moduledoc false
    @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), json_str: binary()}

    defstruct header: %Elixir.StdMsgs.Header{}, json_str: ""

    def types, do: [header: :"std_msgs/Header", json_str: :string]
  end

  defmodule Elixir.IrisSupportMsgs.IrisJSONsrv.Response do
    @moduledoc false
    @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), json_str: binary()}

    defstruct header: %Elixir.StdMsgs.Header{}, json_str: ""

    def types, do: [header: :"std_msgs/Header", json_str: :string]
  end

  def md5sum, do: "a8bb21cdf0d2ec6dce832d4980010082"

  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string json_str
    ---
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string json_str
    """
  end
end