defmodule Elixir.ControlMsgs.PidState do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          timestep: Time.t(),
          error: float(),
          error_dot: float(),
          p_error: float(),
          i_error: float(),
          d_error: float(),
          p_term: float(),
          i_term: float(),
          d_term: float(),
          i_max: float(),
          i_min: float(),
          output: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            timestep: ~T[00:00:00],
            error: 0.0,
            error_dot: 0.0,
            p_error: 0.0,
            i_error: 0.0,
            d_error: 0.0,
            p_term: 0.0,
            i_term: 0.0,
            d_term: 0.0,
            i_max: 0.0,
            i_min: 0.0,
            output: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "b138ec00e886c10e73f27e8712252ea6"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    duration timestep
    float64 error
    float64 error_dot
    float64 p_error
    float64 i_error
    float64 d_error
    float64 p_term
    float64 i_term
    float64 d_term
    float64 i_max
    float64 i_min
    float64 output
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      timestep: :duration,
      error: :float64,
      error_dot: :float64,
      p_error: :float64,
      i_error: :float64,
      d_error: :float64,
      p_term: :float64,
      i_term: :float64,
      d_term: :float64,
      i_max: :float64,
      i_min: :float64,
      output: :float64
    ]
end