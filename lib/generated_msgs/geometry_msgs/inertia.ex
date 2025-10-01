defmodule Elixir.GeometryMsgs.Inertia do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          m: float(),
          com: Elixir.GeometryMsgs.Vector3.t(),
          ixx: float(),
          ixy: float(),
          ixz: float(),
          iyy: float(),
          iyz: float(),
          izz: float()
        }

  defstruct m: 0.0,
            com: %Elixir.GeometryMsgs.Vector3{},
            ixx: 0.0,
            ixy: 0.0,
            ixz: 0.0,
            iyy: 0.0,
            iyz: 0.0,
            izz: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "1d26e4bb6c83ff141c5cf0d883c2b0fe"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float64 m
    geometry_msgs/Vector3 com
      float64 x
      float64 y
      float64 z
    float64 ixx
    float64 ixy
    float64 ixz
    float64 iyy
    float64 iyz
    float64 izz
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      m: :float64,
      com: :"geometry_msgs/Vector3",
      ixx: :float64,
      ixy: :float64,
      ixz: :float64,
      iyy: :float64,
      iyz: :float64,
      izz: :float64
    ]
end