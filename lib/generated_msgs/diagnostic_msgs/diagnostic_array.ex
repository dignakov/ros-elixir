defmodule Elixir.DiagnosticMsgs.DiagnosticArray do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status: list(Elixir.DiagnosticMsgs.DiagnosticStatus.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, status: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "60810da900de1dd6ddd437c3503511da"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    diagnostic_msgs/DiagnosticStatus[] status
      byte OK=0
      byte WARN=1
      byte ERROR=2
      byte STALE=3
      byte level
      string name
      string message
      string hardware_id
      diagnostic_msgs/KeyValue[] values
        string key
        string value
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", status: :"diagnostic_msgs/DiagnosticStatus[]"]
end