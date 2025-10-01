defmodule Elixir.SmachMsgs.SmachContainerStructure do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          header: Elixir.StdMsgs.Header.t(),
          path: binary(),
          children: list(binary()),
          internal_outcomes: list(binary()),
          outcomes_from: list(binary()),
          outcomes_to: list(binary()),
          container_outcomes: list(binary())
        }

  defstruct header: %Elixir.StdMsgs.Header{},
            path: "",
            children: [],
            internal_outcomes: [],
            outcomes_from: [],
            outcomes_to: [],
            container_outcomes: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "3d3d1e0d0f99779ee9e58101a5dcf7ea"

  @impl ROS.Message.Behaviour
  def definition do
    """
    std_msgs/Header header
      uint32 seq
      time stamp
      string frame_id
    string path
    string[] children
    string[] internal_outcomes
    string[] outcomes_from
    string[] outcomes_to
    string[] container_outcomes
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      header: :"std_msgs/Header",
      path: :string,
      children: :"string[]",
      internal_outcomes: :"string[]",
      outcomes_from: :"string[]",
      outcomes_to: :"string[]",
      container_outcomes: :"string[]"
    ]
end