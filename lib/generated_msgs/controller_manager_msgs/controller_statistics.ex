defmodule Elixir.ControllerManagerMsgs.ControllerStatistics do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          name: binary(),
          type: binary(),
          timestamp: Time.t(),
          running: atom(),
          max_time: Time.t(),
          mean_time: Time.t(),
          variance_time: Time.t(),
          num_control_loop_overruns: integer(),
          time_last_control_loop_overrun: Time.t()
        }

  defstruct name: "",
            type: "",
            timestamp: ~T[00:00:00],
            running: false,
            max_time: ~T[00:00:00],
            mean_time: ~T[00:00:00],
            variance_time: ~T[00:00:00],
            num_control_loop_overruns: 0,
            time_last_control_loop_overrun: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "697780c372c8d8597a1436d0e2ad3ba8"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
      name: :string,
      type: :string,
      timestamp: :time,
      running: :bool,
      max_time: :duration,
      mean_time: :duration,
      variance_time: :duration,
      num_control_loop_overruns: :int32,
      time_last_control_loop_overrun: :time
    ]
end