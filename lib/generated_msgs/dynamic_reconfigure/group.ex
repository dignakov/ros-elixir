defmodule Elixir.DynamicReconfigure.Group do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          name: binary(),
          type: binary(),
          parameters: list(Elixir.DynamicReconfigure.ParamDescription.t()),
          parent: integer(),
          id: integer()
        }

  defstruct name: "", type: "", parameters: [], parent: 0, id: 0

  @impl ROS.Message.Behaviour
  def md5sum, do: "9e8cd9e9423c94823db3614dd8b1cf7a"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string name
    string type
    dynamic_reconfigure/ParamDescription[] parameters
      string name
      string type
      uint32 level
      string description
      string edit_method
    int32 parent
    int32 id
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      name: :string,
      type: :string,
      parameters: :"dynamic_reconfigure/ParamDescription[]",
      parent: :int32,
      id: :int32
    ]
end