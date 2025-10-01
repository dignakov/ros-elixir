defmodule Elixir.ControllerManagerMsgs.ControllersStatistics do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          controller: list(Elixir.ControllerManagerMsgs.ControllerStatistics.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, controller: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "a154c347736773e3700d1719105df29d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    controller_manager_msgs/ControllerStatistics[] controller
      string name
      string type
      time timestamp
      bool running
      duration max_time
      duration mean_time
      duration variance_time
      int32 num_control_loop_overruns
      time time_last_control_loop_overrun
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      controller: :"controller_manager_msgs/ControllerStatistics[]"
    ]
end