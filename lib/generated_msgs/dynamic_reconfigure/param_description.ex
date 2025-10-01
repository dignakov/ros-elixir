defmodule Elixir.DynamicReconfigure.ParamDescription do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          name: binary(),
          type: binary(),
          level: non_neg_integer(),
          description: binary(),
          edit_method: binary()
        }

  defstruct name: "", type: "", level: 0, description: "", edit_method: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "7434fcb9348c13054e0c3b267c8cb34d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    string type
    uint32 level
    string description
    string edit_method
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [name: :string, type: :string, level: :uint32, description: :string, edit_method: :string]
end