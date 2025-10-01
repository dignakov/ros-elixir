defmodule Elixir.ControllerManagerMsgs.ControllerState do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          name: binary(),
          state: binary(),
          type: binary(),
          claimed_resources: list(Elixir.ControllerManagerMsgs.HardwareInterfaceResources.t())
        }

  defstruct name: "", state: "", type: "", claimed_resources: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "aeb6b261d97793ab74099a3740245272"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    string state
    string type
    controller_manager_msgs/HardwareInterfaceResources[] claimed_resources
      string hardware_interface
      string[] resources
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      name: :string,
      state: :string,
      type: :string,
      claimed_resources: :"controller_manager_msgs/HardwareInterfaceResources[]"
    ]
end