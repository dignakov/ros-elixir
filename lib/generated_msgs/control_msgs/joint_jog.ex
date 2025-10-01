defmodule Elixir.ControlMsgs.JointJog do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          joint_names: list(binary()),
          displacements: list(float()),
          velocities: list(float()),
          duration: float()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            joint_names: [],
            displacements: [],
            velocities: [],
            duration: 0.0

  @impl ROS.Message.Behaviour
  def md5sum, do: "1685da700c8c2e1254afc92a5fb89c96"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string[] joint_names
    float64[] displacements
    float64[] velocities
    float64 duration
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      joint_names: :"string[]",
      displacements: :"float64[]",
      velocities: :"float64[]",
      duration: :float64
    ]
end