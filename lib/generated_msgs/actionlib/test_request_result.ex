defmodule Elixir.Actionlib.TestRequestResult do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{the_result: integer(), is_simple_server: atom()}

  defstruct the_result: 0, is_simple_server: false

  @impl ROS.Message.Behaviour
  def md5sum, do: "61c2364524499c7c5017e2f3fce7ba06"

  @impl ROS.Message.Behaviour
  def definition do
    """
    int32 the_result
    bool is_simple_server
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [the_result: :int32, is_simple_server: :bool]
end