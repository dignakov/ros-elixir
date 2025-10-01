defmodule Elixir.NavMsgs.GridCells do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          cell_width: float(),
          cell_height: float(),
          cells: list(Elixir.GeometryMsgs.Point.t())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, cell_width: 0.0, cell_height: 0.0, cells: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "b9e4f5df6d28e272ebde00a3994830f5"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float32 cell_width
    float32 cell_height
    geometry_msgs/Point[] cells
      float64 x
      float64 y
      float64 z
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      cell_width: :float32,
      cell_height: :float32,
      cells: :"geometry_msgs/Point[]"
    ]
end