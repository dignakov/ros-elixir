defmodule Elixir.Tf2Msgs.LookupTransformGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          target_frame: binary(),
          source_frame: binary(),
          source_time: Time.t(),
          timeout: Time.t(),
          target_time: Time.t(),
          fixed_frame: binary(),
          advanced: atom()
        }

  defstruct target_frame: "",
            source_frame: "",
            source_time: ~T[00:00:00],
            timeout: ~T[00:00:00],
            target_time: ~T[00:00:00],
            fixed_frame: "",
            advanced: false

  @impl ROS.Message.Behaviour
  def md5sum, do: "35e3720468131d675a18bb6f3e5f22f8"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string target_frame
    string source_frame
    time source_time
    duration timeout
    time target_time
    string fixed_frame
    bool advanced
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      target_frame: :string,
      source_frame: :string,
      source_time: :time,
      timeout: :duration,
      target_time: :time,
      fixed_frame: :string,
      advanced: :bool
    ]
end