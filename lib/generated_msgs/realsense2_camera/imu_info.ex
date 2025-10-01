defmodule Elixir.Realsense2Camera.IMUInfo do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          frame_id: binary(),
          data: list(float()),
          noise_variances: list(float()),
          bias_variances: list(float())
        }

  defstruct frame_id: "", data: [], noise_variances: [], bias_variances: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "a02adb3a99530b11ba18a16f40f9512a"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string frame_id
    float64[12] data
    float64[3] noise_variances
    float64[3] bias_variances
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      frame_id: :string,
      data: :"float64[]",
      noise_variances: :"float64[]",
      bias_variances: :"float64[]"
    ]
end