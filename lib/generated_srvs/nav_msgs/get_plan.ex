defmodule Elixir.NavMsgs.GetPlan do
  @moduledoc false

  defmodule Elixir.NavMsgs.GetPlan.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            start: Elixir.GeometryMsgs.PoseStamped.t(),
            goal: Elixir.GeometryMsgs.PoseStamped.t(),
            tolerance: float()
          }

    defstruct start: %Elixir.GeometryMsgs.PoseStamped{},
              goal: %Elixir.GeometryMsgs.PoseStamped{},
              tolerance: 0.0

    def types,
      do: [
        start: :"geometry_msgs/PoseStamped",
        goal: :"geometry_msgs/PoseStamped",
        tolerance: :float32
      ]
  end

  defmodule Elixir.NavMsgs.GetPlan.Response do
    @moduledoc false
    @type t :: %__MODULE__{plan: Elixir.NavMsgs.Path.t()}

    defstruct plan: %Elixir.NavMsgs.Path{}

    def types, do: [plan: :"nav_msgs/Path"]
  end

  def md5sum, do: "421c8ea4d21c6c9db7054b4bbdf1e024"

  def definition do
    """
    geometry_msgs/PoseStamped start
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      geometry_msgs/Pose pose
        geometry_msgs/Point position
          float64 x
          float64 y
          float64 z
        geometry_msgs/Quaternion orientation
          float64 x
          float64 y
          float64 z
          float64 w
    geometry_msgs/PoseStamped goal
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      geometry_msgs/Pose pose
        geometry_msgs/Point position
          float64 x
          float64 y
          float64 z
        geometry_msgs/Quaternion orientation
          float64 x
          float64 y
          float64 z
          float64 w
    float32 tolerance
    ---
    nav_msgs/Path plan
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      geometry_msgs/PoseStamped[] poses
        std_msgs/Header header
          uint32 seq
          time stamp
          string frame_id
        geometry_msgs/Pose pose
          geometry_msgs/Point position
            float64 x
            float64 y
            float64 z
          geometry_msgs/Quaternion orientation
            float64 x
            float64 y
            float64 z
            float64 w
    """
  end
end