defmodule Elixir.ShapeMsgs.MeshTriangle do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{vertex_indices: list(non_neg_integer())}

  defstruct vertex_indices: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "23688b2e6d2de3d32fe8af104a903253"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint32[3] vertex_indices
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [vertex_indices: :"uint32[]"]
end