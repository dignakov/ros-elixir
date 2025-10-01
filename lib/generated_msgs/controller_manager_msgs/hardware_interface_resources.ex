defmodule Elixir.ControllerManagerMsgs.HardwareInterfaceResources do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{hardware_interface: binary(), resources: list(binary())}

  defstruct hardware_interface: "", resources: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "f25b55cbf1d1f76e82e5ec9e83f76258"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string hardware_interface
    string[] resources
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [hardware_interface: :string, resources: :"string[]"]
end