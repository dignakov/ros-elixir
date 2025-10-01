defmodule Elixir.Tf2Msgs.TF2Error do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{error: non_neg_integer(), error_string: binary()}

  defstruct error: 0, error_string: ""

  @impl ROS.Message.Behaviour
  def md5sum, do: "bc6848fd6fd750c92e38575618a4917d"

  @impl ROS.Message.Behaviour
  def definition do
    """
    uint8 NO_ERROR=0
    uint8 LOOKUP_ERROR=1
    uint8 CONNECTIVITY_ERROR=2
    uint8 EXTRAPOLATION_ERROR=3
    uint8 INVALID_ARGUMENT_ERROR=4
    uint8 TIMEOUT_ERROR=5
    uint8 TRANSFORM_ERROR=6
    uint8 error
    string error_string
    """
  end

  @impl ROS.Message.Behaviour
  def types, do: [error: :uint8, error_string: :string]

  def no_error, do: 0

  def lookup_error, do: 1

  def connectivity_error, do: 2

  def extrapolation_error, do: 3

  def invalid_argument_error, do: 4

  def timeout_error, do: 5

  def transform_error, do: 6
end