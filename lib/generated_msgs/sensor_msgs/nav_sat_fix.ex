defmodule Elixir.SensorMsgs.NavSatFix do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          status: Elixir.SensorMsgs.NavSatStatus.t(),
          latitude: float(),
          longitude: float(),
          altitude: float(),
          position_covariance: list(float()),
          position_covariance_type: non_neg_integer()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            status: %Elixir.SensorMsgs.NavSatStatus{},
            latitude: 0.0,
            longitude: 0.0,
            altitude: 0.0,
            position_covariance: [],
            position_covariance_type: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "2d3a8cd499b9b4a0249fb98fd05cfa48"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 COVARIANCE_TYPE_UNKNOWN=0
    uint8 COVARIANCE_TYPE_APPROXIMATED=1
    uint8 COVARIANCE_TYPE_DIAGONAL_KNOWN=2
    uint8 COVARIANCE_TYPE_KNOWN=3
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    sensor_msgs/NavSatStatus status
      int8 STATUS_NO_FIX=-1
      int8 STATUS_FIX=0
      int8 STATUS_SBAS_FIX=1
      int8 STATUS_GBAS_FIX=2
      uint16 SERVICE_GPS=1
      uint16 SERVICE_GLONASS=2
      uint16 SERVICE_COMPASS=4
      uint16 SERVICE_GALILEO=8
      int8 status
      uint16 service
    float64 latitude
    float64 longitude
    float64 altitude
    float64[9] position_covariance
    uint8 position_covariance_type
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      status: :"sensor_msgs/NavSatStatus",
      latitude: :float64,
      longitude: :float64,
      altitude: :float64,
      position_covariance: :"float64[]",
      position_covariance_type: :uint8
    ]

  def covariance_type_unknown, do: 0

  def covariance_type_approximated, do: 1

  def covariance_type_diagonal_known, do: 2

  def covariance_type_known, do: 3
end