defmodule Elixir.MapMsgs.ProjectedMapInfo do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          frame_id: binary(),
          x: float(),
          y: float(),
          width: float(),
          height: float(),
          min_z: float(),
          max_z: float()
        }

  defstruct frame_id: "", x: 0.0, y: 0.0, width: 0.0, height: 0.0, min_z: 0.0, max_z: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "2dc10595ae94de23f22f8a6d2a0eef7a"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string frame_id
    float64 x
    float64 y
    float64 width
    float64 height
    float64 min_z
    float64 max_z
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      frame_id: :string,
      x: :float64,
      y: :float64,
      width: :float64,
      height: :float64,
      min_z: :float64,
      max_z: :float64
    ]
end