defmodule Elixir.RospyTutorials.HeaderString do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), data: binary()}

  defstruct header: %Elixir.StdMsgs.Header{}, data: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "c99a9440709e4d4a9716d55b8270d5e7"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", data: :string]
end