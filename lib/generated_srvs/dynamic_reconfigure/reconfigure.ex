defmodule Elixir.DynamicReconfigure.Reconfigure do
  @moduledoc false

  defmodule Elixir.DynamicReconfigure.Reconfigure.Request do
    @moduledoc false
    @type t :: %__MODULE__{config: Elixir.DynamicReconfigure.Config.t()}

    defstruct config: %Elixir.DynamicReconfigure.Config{}

    def types, do: [config: :"dynamic_reconfigure/Config"]
  end

  defmodule Elixir.DynamicReconfigure.Reconfigure.Response do
    @moduledoc false
    @type t :: %__MODULE__{config: Elixir.DynamicReconfigure.Config.t()}

    defstruct config: %Elixir.DynamicReconfigure.Config{}

    def types, do: [config: :"dynamic_reconfigure/Config"]
  end

  def md5sum, do: "bb125d226a21982a4a98760418dc2672"

  def definition do
    """
    dynamic_reconfigure/Config config
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
    ---
    dynamic_reconfigure/Config config
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
end