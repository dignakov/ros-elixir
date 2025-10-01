defmodule Elixir.IrisSupportMsgs.ViveMsg do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          valid: atom(),
          role: integer(),
          R: list(float()),
          t: list(float()),
          v: list(float()),
          w: list(float()),
          pad: list(float()),
          trigger: float(),
          buttons: list(atom())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            valid: false,
            role: 0,
            R: [],
            t: [],
            v: [],
            w: [],
            pad: [],
            trigger: 0.0,
            buttons: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "0513b4329e3abff307a3c2a1e8b46fcb"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    bool valid
    int32 role
    float32[9] R
    float32[3] t
    float32[3] v
    float32[3] w
    float32[2] pad
    float32 trigger
    bool[4] buttons
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      valid: :bool,
      role: :int32,
      R: :"float32[]",
      t: :"float32[]",
      v: :"float32[]",
      w: :"float32[]",
      pad: :"float32[]",
      trigger: :float32,
      buttons: :"bool[]"
    ]
end