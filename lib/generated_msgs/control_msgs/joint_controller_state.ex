defmodule Elixir.ControlMsgs.JointControllerState do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          set_point: float(),
          process_value: float(),
          process_value_dot: float(),
          error: float(),
          time_step: float(),
          command: float(),
          p: float(),
          i: float(),
          d: float(),
          i_clamp: float(),
          antiwindup: atom()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            set_point: 0.0,
            process_value: 0.0,
            process_value_dot: 0.0,
            error: 0.0,
            time_step: 0.0,
            command: 0.0,
            p: 0.0,
            i: 0.0,
            d: 0.0,
            i_clamp: 0.0,
            antiwindup: false

  @impl ROS.Message.Behaviour
  def md5sum, do: "987ad85e4756f3aef7f1e5e7fe0595d1"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float64 set_point
    float64 process_value
    float64 process_value_dot
    float64 error
    float64 time_step
    float64 command
    float64 p
    float64 i
    float64 d
    float64 i_clamp
    bool antiwindup
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      set_point: :float64,
      process_value: :float64,
      process_value_dot: :float64,
      error: :float64,
      time_step: :float64,
      command: :float64,
      p: :float64,
      i: :float64,
      d: :float64,
      i_clamp: :float64,
      antiwindup: :bool
    ]
end