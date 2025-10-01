defmodule Elixir.StdMsgs.String do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{data: binary()}

  defstruct data: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "992ce8a1687cec8c8bd883ec73ca41d1"

  @impl ROS.Message.Behaviour
  def definition do
    """
    string data
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [data: :string]
end