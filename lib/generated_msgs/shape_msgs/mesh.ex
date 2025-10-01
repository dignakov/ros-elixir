defmodule Elixir.ShapeMsgs.Mesh do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          triangles: list(Elixir.ShapeMsgs.MeshTriangle.t()),
          vertices: list(Elixir.GeometryMsgs.Point.t())
        }

  defstruct triangles: [], vertices: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "1ffdae9486cd3316a121c578b47a85cc"

  @impl ROS.Message.Behaviour
  def definition do
    """
    shape_msgs/MeshTriangle[] triangles
      uint32[3] vertex_indices
    geometry_msgs/Point[] vertices
      float64 x
      float64 y
      float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [triangles: :"shape_msgs/MeshTriangle[]", vertices: :"geometry_msgs/Point[]"]
end