defmodule Elixir.OrbbecCamera.Extrinsics do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          rotation: list(float()),
          translation: list(float())
        }

  defstruct header: %Elixir.StdMsgs.Header{}, rotation: [], translation: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "3627b43073f4cd5dd6dc179a49eda2ad"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    float64[9] rotation
    float64[3] translation
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", rotation: :"float64[]", translation: :"float64[]"]
end