defmodule Elixir.RosgraphMsgs.Log do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          level: integer(),
          name: binary(),
          msg: binary(),
          file: binary(),
          function: binary(),
          line: non_neg_integer(),
          topics: list(binary())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            level: 0,
            name: "",
            msg: "",
            file: "",
            function: "",
            line: 0,
            topics: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "acffd30cd6b6de30f120938c17c593fb"

  @impl ROS.Message.Behaviour
  def definition do
    """
    byte DEBUG=1
    byte INFO=2
    byte WARN=4
    byte ERROR=8
    byte FATAL=16
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    byte level
    string name
    string msg
    string file
    string function
    uint32 line
    string[] topics
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      level: :int8,
      name: :string,
      msg: :string,
      file: :string,
      function: :string,
      line: :uint32,
      topics: :"string[]"
    ]

  def debug, do: 1

  def info, do: 2

  def warn, do: 4

  def error, do: 8

  def fatal, do: 16
end