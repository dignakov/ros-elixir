defmodule Elixir.SensorMsgs.NavSatStatus do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{status: integer(), service: non_neg_integer()}

  defstruct status: 0, service: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "331cdbddfa4bc96ffc3b9ad98900a54c"

  @impl ROS.Message.Behaviour
  def definition do
    """
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
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [status: :int8, service: :uint16]

  def status_no_fix, do: -1

  def status_fix, do: 0

  def status_sbas_fix, do: 1

  def status_gbas_fix, do: 2

  def service_gps, do: 1

  def service_glonass, do: 2

  def service_compass, do: 4

  def service_galileo, do: 8
end