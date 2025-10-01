defmodule Elixir.OrbbecCamera.Metadata do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{header: Elixir.StdMsgs.Header.t(), json_data: binary()}

  defstruct header: %Elixir.StdMsgs.Header{}, json_data: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "4966ca002be16ee67fe4dbfb2f354787"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string json_data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [header: :"std_msgs/Header", json_data: :string]
end