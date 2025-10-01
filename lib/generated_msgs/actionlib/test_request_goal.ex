defmodule Elixir.Actionlib.TestRequestGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          terminate_status: integer(),
          ignore_cancel: atom(),
          result_text: binary(),
          the_result: integer(),
          is_simple_client: atom(),
          delay_accept: Time.t(),
          delay_terminate: Time.t(),
          pause_status: Time.t()
        }

  defstruct terminate_status: 0,
            ignore_cancel: false,
            result_text: "",
            the_result: 0,
            is_simple_client: false,
            delay_accept: ~T[00:00:00],
            delay_terminate: ~T[00:00:00],
            pause_status: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "db5d00ba98302d6c6dd3737e9a03ceea"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 TERMINATE_SUCCESS=0
    int32 TERMINATE_ABORTED=1
    int32 TERMINATE_REJECTED=2
    int32 TERMINATE_LOSE=3
    int32 TERMINATE_DROP=4
    int32 TERMINATE_EXCEPTION=5
    int32 terminate_status
    bool ignore_cancel
    string result_text
    int32 the_result
    bool is_simple_client
    duration delay_accept
    duration delay_terminate
    duration pause_status
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      terminate_status: :int32,
      ignore_cancel: :bool,
      result_text: :string,
      the_result: :int32,
      is_simple_client: :bool,
      delay_accept: :duration,
      delay_terminate: :duration,
      pause_status: :duration
    ]

  def terminate_success, do: 0

  def terminate_aborted, do: 1

  def terminate_rejected, do: 2

  def terminate_lose, do: 3

  def terminate_drop, do: 4

  def terminate_exception, do: 5
end