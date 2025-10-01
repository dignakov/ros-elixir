defmodule Elixir.SensorMsgs.ChannelFloat32 do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{name: binary(), values: list(float())}

  defstruct name: "", values: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "3d40139cdd33dfedcb71ffeeeb42ae7f"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    float32[] values
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, values: :"float32[]"]
end