defmodule Elixir.SmachMsgs.SmachContainerStatus do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          path: binary(),
          initial_states: list(binary()),
          active_states: list(binary()),
          local_data: binary(),
          info: binary()
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            path: "",
            initial_states: [],
            active_states: [],
            local_data: "",
            info: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "5ba2bb79ac19e3842d562a191f2a675b"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string path
    string[] initial_states
    string[] active_states
    string local_data
    string info
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      path: :string,
      initial_states: :"string[]",
      active_states: :"string[]",
      local_data: :string,
      info: :string
    ]
end