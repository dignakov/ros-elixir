defmodule Elixir.ShapeMsgs.SolidPrimitive do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{type: non_neg_integer(), dimensions: list(float())}

  defstruct type: 0, dimensions: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "d8f8cbc74c5ff283fca29569ccefb45d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 BOX=1
    uint8 SPHERE=2
    uint8 CYLINDER=3
    uint8 CONE=4
    uint8 BOX_X=0
    uint8 BOX_Y=1
    uint8 BOX_Z=2
    uint8 SPHERE_RADIUS=0
    uint8 CYLINDER_HEIGHT=0
    uint8 CYLINDER_RADIUS=1
    uint8 CONE_HEIGHT=0
    uint8 CONE_RADIUS=1
    uint8 type
    float64[] dimensions
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [type: :uint8, dimensions: :"float64[]"]

  def box, do: 1

  def sphere, do: 2

  def cylinder, do: 3

  def cone, do: 4

  def box_x, do: 0

  def box_y, do: 1

  def box_z, do: 2

  def sphere_radius, do: 0

  def cylinder_height, do: 0

  def cylinder_radius, do: 1

  def cone_height, do: 0

  def cone_radius, do: 1
end