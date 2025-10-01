defmodule Elixir.ControllerManagerMsgs.ListControllers do
  @moduledoc false

  defmodule Elixir.ControllerManagerMsgs.ListControllers.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.ControllerManagerMsgs.ListControllers.Response do
    @moduledoc false
    @type t :: %__MODULE__{controller: list(Elixir.ControllerManagerMsgs.ControllerState.t())}

    defstruct controller: []

    def types, do: [controller: :"controller_manager_msgs/ControllerState[]"]
  end

  def md5sum, do: "1341feb2e63fa791f855565d0da950d8"

  def definition do
    """
    ---
    controller_manager_msgs/ControllerState[] controller
      string name
      string state
      string type
      controller_manager_msgs/HardwareInterfaceResources[] claimed_resources
        string hardware_interface
        string[] resources
    """
  end
end