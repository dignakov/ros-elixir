defmodule Elixir.ControlMsgs.QueryCalibrationState do
  @moduledoc false

  defmodule Elixir.ControlMsgs.QueryCalibrationState.Request do
    @moduledoc false
    @type t :: %__MODULE__{}

    defstruct []

    def types, do: []
  end

  defmodule Elixir.ControlMsgs.QueryCalibrationState.Response do
    @moduledoc false
    @type t :: %__MODULE__{is_calibrated: atom()}

    defstruct is_calibrated: false

    def types, do: [is_calibrated: :bool]
  end

  def md5sum, do: "28af3beedcb84986b8e470dc5470507d"

  def definition do
    """
    ---
    bool is_calibrated
    """
  end
end