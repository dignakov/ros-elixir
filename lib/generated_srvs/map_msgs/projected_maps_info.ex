defmodule Elixir.MapMsgs.ProjectedMapsInfo do
  @moduledoc false

  defmodule Elixir.MapMsgs.ProjectedMapsInfo.Request do
    @moduledoc false
    @type t :: %__MODULE__{projected_maps_info: list(Elixir.MapMsgs.ProjectedMapInfo.t())}

    defstruct projected_maps_info: []

    def types, do: [projected_maps_info: :"map_msgs/ProjectedMapInfo[]"]
  end

  defmodule Elixir.MapMsgs.ProjectedMapsInfo.Response do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  def md5sum, do: "d7980a33202421c8cd74565e57a4d229"

  def definition do
    """
    map_msgs/ProjectedMapInfo[] projected_maps_info
      string frame_id
      float64 x
      float64 y
      float64 width
      float64 height
      float64 min_z
      float64 max_z
    ---
    """
  end
end