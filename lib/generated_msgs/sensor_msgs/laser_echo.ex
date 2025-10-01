defmodule Elixir.SensorMsgs.LaserEcho do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{echoes: list(float())}

  defstruct echoes: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "8bc5ae449b200fba4d552b4225586696"

  @impl ROS.Message.Behaviour
  def definition do
    """
    float32[] echoes
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [echoes: :"float32[]"]
end