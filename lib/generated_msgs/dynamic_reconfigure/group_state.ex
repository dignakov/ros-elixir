defmodule Elixir.DynamicReconfigure.GroupState do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{name: binary(), state: atom(), id: integer(), parent: integer()}

  defstruct name: "", state: false, id: 0, parent: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "a2d87f51dc22930325041a2f8b1571f8"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    bool state
    int32 id
    int32 parent
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [name: :string, state: :bool, id: :int32, parent: :int32]
end