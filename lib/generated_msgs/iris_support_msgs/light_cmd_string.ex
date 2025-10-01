defmodule Elixir.IrisSupportMsgs.LightCmdString do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          colour_code: binary(),
          modulation: binary(),
          milliseconds: non_neg_integer()
        }

  defstruct header: %Elixir.StdMsgs.Header{}, colour_code: "", modulation: "", milliseconds: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "9579961f345a65e2c60ed61f8dd00dda"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string colour_code
    string modulation
    uint32 milliseconds
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      colour_code: :string,
      modulation: :string,
      milliseconds: :uint32
    ]
end