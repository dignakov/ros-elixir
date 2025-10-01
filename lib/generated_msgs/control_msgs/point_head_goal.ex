defmodule Elixir.ControlMsgs.PointHeadGoal do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          target: Elixir.GeometryMsgs.PointStamped.t(),
          pointing_axis: Elixir.GeometryMsgs.Vector3.t(),
          pointing_frame: binary(),
          min_duration: Time.t(),
          max_velocity: float()
        }

  defstruct target: %Elixir.GeometryMsgs.PointStamped{},
            pointing_axis: %Elixir.GeometryMsgs.Vector3{},
            pointing_frame: "",
            min_duration: ~T[00:00:00],
            max_velocity: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "8b92b1cd5e06c8a94c917dc3209a4c1d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    geometry_msgs/PointStamped target
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      geometry_msgs/Point point
        float64 x
        float64 y
        float64 z
    geometry_msgs/Vector3 pointing_axis
      float64 x
      float64 y
      float64 z
    string pointing_frame
    duration min_duration
    float64 max_velocity
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      target: :"geometry_msgs/PointStamped",
      pointing_axis: :"geometry_msgs/Vector3",
      pointing_frame: :string,
      min_duration: :duration,
      max_velocity: :float64
    ]
end