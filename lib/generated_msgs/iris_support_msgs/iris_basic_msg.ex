defmodule Elixir.IrisSupportMsgs.IrisBasicMsg do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

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

  @impl ROS.Message.Behaviour
  def md5sum, do: "c5b6453d667630e1abc3415a0b57e0a4"

  @impl ROS.Message.Behaviour
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
    """
  end

  @impl ROS.Message.Behaviour
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