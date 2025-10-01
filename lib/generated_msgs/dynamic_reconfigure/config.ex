defmodule Elixir.DynamicReconfigure.Config do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          bools: list(Elixir.DynamicReconfigure.BoolParameter.t()),
          ints: list(Elixir.DynamicReconfigure.IntParameter.t()),
          strs: list(Elixir.DynamicReconfigure.StrParameter.t()),
          doubles: list(Elixir.DynamicReconfigure.DoubleParameter.t()),
          groups: list(Elixir.DynamicReconfigure.GroupState.t())
        }

  defstruct bools: [], ints: [], strs: [], doubles: [], groups: []

  @impl ROS.Message.Behaviour
  def md5sum, do: "958f16a05573709014982821e6822580"

  @impl ROS.Message.Behaviour
  def definition do
    """
    dynamic_reconfigure/BoolParameter[] bools
      string name
      bool value
    dynamic_reconfigure/IntParameter[] ints
      string name
      int32 value
    dynamic_reconfigure/StrParameter[] strs
      string name
      string value
    dynamic_reconfigure/DoubleParameter[] doubles
      string name
      float64 value
    dynamic_reconfigure/GroupState[] groups
      string name
      bool state
      int32 id
      int32 parent
    """
  end

  @impl ROS.Message.Behaviour
  def types,
    do: [
      bools: :"dynamic_reconfigure/BoolParameter[]",
      ints: :"dynamic_reconfigure/IntParameter[]",
      strs: :"dynamic_reconfigure/StrParameter[]",
      doubles: :"dynamic_reconfigure/DoubleParameter[]",
      groups: :"dynamic_reconfigure/GroupState[]"
    ]
end