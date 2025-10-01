defmodule Elixir.SmachMsgs.SmachContainerInitialStatusCmd do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{path: binary(), initial_states: list(binary()), local_data: binary()}

  defstruct path: "", initial_states: [], local_data: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "45f8cf31fc29b829db77f23001f788d6"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string path
    string[] initial_states
    string local_data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [path: :string, initial_states: :"string[]", local_data: :string]
end