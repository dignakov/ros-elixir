defmodule Elixir.IrisSupportMsgs.GetTrajectoryFromJointWaypoints do
  @moduledoc false

  defmodule Elixir.IrisSupportMsgs.GetTrajectoryFromJointWaypoints.Request do
    @moduledoc false
    @type t :: %__MODULE__{
            header: Elixir.StdMsgs.Header.t(),
            id_int: non_neg_integer(),
            id_str: binary(),
            val_int: non_neg_integer(),
            val_str: binary(),
            json_str: binary(),
            waypoints: Elixir.TrajectoryMsgs.JointTrajectory.t()
          }

    defstruct header: %Elixir.StdMsgs.Header{},
              id_int: 0,
              id_str: "",
              val_int: 0,
              val_str: "",
              json_str: "",
              waypoints: %Elixir.TrajectoryMsgs.JointTrajectory{}

    def types,
      do: [
        header: :"std_msgs/Header",
        id_int: :uint16,
        id_str: :string,
        val_int: :uint16,
        val_str: :string,
        json_str: :string,
        waypoints: :"trajectory_msgs/JointTrajectory"
      ]
  end

  defmodule Elixir.IrisSupportMsgs.GetTrajectoryFromJointWaypoints.Response do
    @moduledoc false
    @type t :: %__MODULE__{
            success: atom(),
            message: binary(),
            id_int: non_neg_integer(),
            id_str: binary(),
            val_int: non_neg_integer(),
            val_str: binary(),
            json_str: binary(),
            joint_trajectory: Elixir.TrajectoryMsgs.JointTrajectory.t()
          }

    defstruct success: false,
              message: "",
              id_int: 0,
              id_str: "",
              val_int: 0,
              val_str: "",
              json_str: "",
              joint_trajectory: %Elixir.TrajectoryMsgs.JointTrajectory{}

    def types,
      do: [
        success: :bool,
        message: :string,
        id_int: :uint16,
        id_str: :string,
        val_int: :uint16,
        val_str: :string,
        json_str: :string,
        joint_trajectory: :"trajectory_msgs/JointTrajectory"
      ]
  end

  def md5sum, do: "4b6e97794a8c49743dfce299e92e3722"

  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    uint16 id_int
    string id_str
    uint16 val_int
    string val_str
    string json_str
    trajectory_msgs/JointTrajectory waypoints
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      string[] joint_names
      trajectory_msgs/JointTrajectoryPoint[] points
        float64[] positions
        float64[] velocities
        float64[] accelerations
        float64[] effort
        duration time_from_start
    ---
    bool success
    string message
    uint16 id_int
    string id_str
    uint16 val_int
    string val_str
    string json_str
    trajectory_msgs/JointTrajectory joint_trajectory
      std_msgs/Header header
        uint32 seq
        time stamp
        string frame_id
      string[] joint_names
      trajectory_msgs/JointTrajectoryPoint[] points
        float64[] positions
        float64[] velocities
        float64[] accelerations
        float64[] effort
        duration time_from_start
    """
  end
end