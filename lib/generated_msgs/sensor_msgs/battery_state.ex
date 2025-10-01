defmodule Elixir.SensorMsgs.BatteryState do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          voltage: float(),
          temperature: float(),
          current: float(),
          charge: float(),
          capacity: float(),
          design_capacity: float(),
          percentage: float(),
          power_supply_status: non_neg_integer(),
          power_supply_health: non_neg_integer(),
          power_supply_technology: non_neg_integer(),
          present: atom(),
          cell_voltage: list(float()),
          cell_temperature: list(float()),
          location: binary(),
          serial_number: binary()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            voltage: 0.0,
            temperature: 0.0,
            current: 0.0,
            charge: 0.0,
            capacity: 0.0,
            design_capacity: 0.0,
            percentage: 0.0,
            power_supply_status: 0,
            power_supply_health: 0,
            power_supply_technology: 0,
            present: false,
            cell_voltage: [],
            cell_temperature: [],
            location: "",
            serial_number: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "4ddae7f048e32fda22cac764685e3974"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 POWER_SUPPLY_STATUS_UNKNOWN=0
    uint8 POWER_SUPPLY_STATUS_CHARGING=1
    uint8 POWER_SUPPLY_STATUS_DISCHARGING=2
    uint8 POWER_SUPPLY_STATUS_NOT_CHARGING=3
    uint8 POWER_SUPPLY_STATUS_FULL=4
    uint8 POWER_SUPPLY_HEALTH_UNKNOWN=0
    uint8 POWER_SUPPLY_HEALTH_GOOD=1
    uint8 POWER_SUPPLY_HEALTH_OVERHEAT=2
    uint8 POWER_SUPPLY_HEALTH_DEAD=3
    uint8 POWER_SUPPLY_HEALTH_OVERVOLTAGE=4
    uint8 POWER_SUPPLY_HEALTH_UNSPEC_FAILURE=5
    uint8 POWER_SUPPLY_HEALTH_COLD=6
    uint8 POWER_SUPPLY_HEALTH_WATCHDOG_TIMER_EXPIRE=7
    uint8 POWER_SUPPLY_HEALTH_SAFETY_TIMER_EXPIRE=8
    uint8 POWER_SUPPLY_TECHNOLOGY_UNKNOWN=0
    uint8 POWER_SUPPLY_TECHNOLOGY_NIMH=1
    uint8 POWER_SUPPLY_TECHNOLOGY_LION=2
    uint8 POWER_SUPPLY_TECHNOLOGY_LIPO=3
    uint8 POWER_SUPPLY_TECHNOLOGY_LIFE=4
    uint8 POWER_SUPPLY_TECHNOLOGY_NICD=5
    uint8 POWER_SUPPLY_TECHNOLOGY_LIMN=6
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float32 voltage
    float32 temperature
    float32 current
    float32 charge
    float32 capacity
    float32 design_capacity
    float32 percentage
    uint8 power_supply_status
    uint8 power_supply_health
    uint8 power_supply_technology
    bool present
    float32[] cell_voltage
    float32[] cell_temperature
    string location
    string serial_number
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      voltage: :float32,
      temperature: :float32,
      current: :float32,
      charge: :float32,
      capacity: :float32,
      design_capacity: :float32,
      percentage: :float32,
      power_supply_status: :uint8,
      power_supply_health: :uint8,
      power_supply_technology: :uint8,
      present: :bool,
      cell_voltage: :"float32[]",
      cell_temperature: :"float32[]",
      location: :string,
      serial_number: :string
    ]

  def power_supply_status_unknown, do: 0

  def power_supply_status_charging, do: 1

  def power_supply_status_discharging, do: 2

  def power_supply_status_not_charging, do: 3

  def power_supply_status_full, do: 4

  def power_supply_health_unknown, do: 0

  def power_supply_health_good, do: 1

  def power_supply_health_overheat, do: 2

  def power_supply_health_dead, do: 3

  def power_supply_health_overvoltage, do: 4

  def power_supply_health_unspec_failure, do: 5

  def power_supply_health_cold, do: 6

  def power_supply_health_watchdog_timer_expire, do: 7

  def power_supply_health_safety_timer_expire, do: 8

  def power_supply_technology_unknown, do: 0

  def power_supply_technology_nimh, do: 1

  def power_supply_technology_lion, do: 2

  def power_supply_technology_lipo, do: 3

  def power_supply_technology_life, do: 4

  def power_supply_technology_nicd, do: 5

  def power_supply_technology_limn, do: 6
end