defmodule Elixir.OrbbecCamera.IMUInfo do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          noise_density: float(),
          random_walk: float(),
          reference_temperature: float(),
          bias: list(float()),
          gravity: list(float()),
          scale_misalignment: list(float()),
          temperature_slope: list(float())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            noise_density: 0.0,
            random_walk: 0.0,
            reference_temperature: 0.0,
            bias: [],
            gravity: [],
            scale_misalignment: [],
            temperature_slope: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "efdf590a2d0b51a471d0de8470a87a58"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float64 noise_density
    float64 random_walk
    float64 reference_temperature
    float64[3] bias
    float64[3] gravity
    float64[9] scale_misalignment
    float64[9] temperature_slope
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      noise_density: :float64,
      random_walk: :float64,
      reference_temperature: :float64,
      bias: :"float64[]",
      gravity: :"float64[]",
      scale_misalignment: :"float64[]",
      temperature_slope: :"float64[]"
    ]
end