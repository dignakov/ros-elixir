defmodule Elixir.DynamicReconfigure.ConfigDescription do
  @moduledoc false
  @behaviour ROS.Message.Behaviour

  @type t :: %__MODULE__{
          groups: list(Elixir.DynamicReconfigure.Group.t()),
          max: Elixir.DynamicReconfigure.Config.t(),
          min: Elixir.DynamicReconfigure.Config.t(),
          dflt: Elixir.DynamicReconfigure.Config.t()
        }

  defstruct groups: [],
            max: %Elixir.DynamicReconfigure.Config{},
            min: %Elixir.DynamicReconfigure.Config{},
            dflt: %Elixir.DynamicReconfigure.Config{}

  @impl ROS.Message.Behaviour
  def md5sum, do: "757ce9d44ba8ddd801bb30bc456f946f"

  @impl ROS.Message.Behaviour
  def definition do
    """
    dynamic_reconfigure/Group[] groups
      string name
      string type
      dynamic_reconfigure/ParamDescription[] parameters
        string name
        string type
        uint32 level
        string description
        string edit_method
      int32 parent
      int32 id
    dynamic_reconfigure/Config max
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
    dynamic_reconfigure/Config min
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
    dynamic_reconfigure/Config dflt
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
      groups: :"dynamic_reconfigure/Group[]",
      max: :"dynamic_reconfigure/Config",
      min: :"dynamic_reconfigure/Config",
      dflt: :"dynamic_reconfigure/Config"
    ]
end