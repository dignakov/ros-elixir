defmodule Elixir.IrisSupportMsgs.IrisBasicService do
  @moduledoc false

  defmodule Elixir.IrisSupportMsgs.IrisBasicService.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            header: Elixir.StdMsgs.Header.t(),
            uuid: binary(),
            id_int: non_neg_integer(),
            id_str: binary(),
            val_int: non_neg_integer(),
            val_str: binary(),
            val_float: float(),
            json_str: binary()
          }

    defstruct header: %Elixir.StdMsgs.Header{},
              uuid: "",
              id_int: 0,
              id_str: "",
              val_int: 0,
              val_str: "",
              val_float: 0.0,
              json_str: ""

    def types,
      do: [
        header: :"std_msgs/Header",
        uuid: :string,
        id_int: :uint16,
        id_str: :string,
        val_int: :uint16,
        val_str: :string,
        val_float: :float32,
        json_str: :string
      ]
  end

  defmodule Elixir.IrisSupportMsgs.IrisBasicService.Response do
    @moduledoc false
    @type t :: %__MODULE__{
            uuid: binary(),
            success: atom(),
            message: binary(),
            id_int: non_neg_integer(),
            id_str: binary(),
            val_int: non_neg_integer(),
            val_str: binary(),
            val_float: float(),
            json_str: binary()
          }

    defstruct uuid: "",
              success: false,
              message: "",
              id_int: 0,
              id_str: "",
              val_int: 0,
              val_str: "",
              val_float: 0.0,
              json_str: ""

    def types,
      do: [
        uuid: :string,
        success: :bool,
        message: :string,
        id_int: :uint16,
        id_str: :string,
        val_int: :uint16,
        val_str: :string,
        val_float: :float32,
        json_str: :string
      ]
  end

  def md5sum, do: "73e8852aeb9fc0f17cb11679af1e586a"

  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string uuid
    uint16 id_int
    string id_str
    uint16 val_int
    string val_str
    float32 val_float
    string json_str
    ---
    string uuid
    bool success
    string message
    uint16 id_int
    string id_str
    uint16 val_int
    string val_str
    float32 val_float
    string json_str
    """
  end
end