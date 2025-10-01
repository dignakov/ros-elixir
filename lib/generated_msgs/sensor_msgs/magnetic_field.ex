defmodule Elixir.SensorMsgs.MagneticField do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          magnetic_field: Elixir.GeometryMsgs.Vector3.t(),
          magnetic_field_covariance: list(float())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            magnetic_field: %Elixir.GeometryMsgs.Vector3{},
            magnetic_field_covariance: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "2f3b0b43eed0c9501de0fa3ff89a45aa"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    geometry_msgs/Vector3 magnetic_field
      float64 x
      float64 y
      float64 z
    float64[9] magnetic_field_covariance
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      magnetic_field: :"geometry_msgs/Vector3",
      magnetic_field_covariance: :"float64[]"
    ]
end