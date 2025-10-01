defmodule Elixir.RosgraphMsgs.TopicStatistics do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          topic: binary(),
          node_pub: binary(),
          node_sub: binary(),
          window_start: Time.t(),
          window_stop: Time.t(),
          delivered_msgs: integer(),
          dropped_msgs: integer(),
          traffic: integer(),
          period_mean: Time.t(),
          period_stddev: Time.t(),
          period_max: Time.t(),
          stamp_age_mean: Time.t(),
          stamp_age_stddev: Time.t(),
          stamp_age_max: Time.t()
        }

  defstruct topic: "",
            node_pub: "",
            node_sub: "",
            window_start: ~T[00:00:00],
            window_stop: ~T[00:00:00],
            delivered_msgs: 0,
            dropped_msgs: 0,
            traffic: 0,
            period_mean: ~T[00:00:00],
            period_stddev: ~T[00:00:00],
            period_max: ~T[00:00:00],
            stamp_age_mean: ~T[00:00:00],
            stamp_age_stddev: ~T[00:00:00],
            stamp_age_max: ~T[00:00:00]

  @impl ROS.Message.Behaviour
  def md5sum, do: "10152ed868c5097a5e2e4a89d7daa710"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string topic
    string node_pub
    string node_sub
    time window_start
    time window_stop
    int32 delivered_msgs
    int32 dropped_msgs
    int32 traffic
    duration period_mean
    duration period_stddev
    duration period_max
    duration stamp_age_mean
    duration stamp_age_stddev
    duration stamp_age_max
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      topic: :string,
      node_pub: :string,
      node_sub: :string,
      window_start: :time,
      window_stop: :time,
      delivered_msgs: :int32,
      dropped_msgs: :int32,
      traffic: :int32,
      period_mean: :duration,
      period_stddev: :duration,
      period_max: :duration,
      stamp_age_mean: :duration,
      stamp_age_stddev: :duration,
      stamp_age_max: :duration
    ]
end