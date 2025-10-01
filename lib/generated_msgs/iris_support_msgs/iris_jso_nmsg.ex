defmodule Elixir.IrisSupportMsgs.IrisJSONmsg do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), json_str: binary()}

  defstruct header: %Elixir.StdMsgs.Header{}, json_str: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "fe58a2f80d00a4b12a3e63c7fb70a7e4"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string json_str
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", json_str: :string]
end