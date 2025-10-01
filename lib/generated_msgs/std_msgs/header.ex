defmodule Elixir.StdMsgs.Header do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{seq: non_neg_integer(), stamp: Time.t(), frame_id: binary()}

  defstruct seq: 0, stamp: ~T[00:00:00], frame_id: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "2176decaecbce78abc3b96ef049fabed"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint32 seq
    time stamp
    string frame_id
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [seq: :uint32, stamp: :time, frame_id: :string]
end