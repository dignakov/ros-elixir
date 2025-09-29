defmodule Bite do
  @moduledoc false
  # Minimal subset used by your code:
  # - drop/2 and take/2|3 operate on binaries
  # - to_string/1 returns the binary (Elixir strings are binaries)

  @spec drop(binary(), non_neg_integer()) :: binary()
  def drop(<<>>, _n), do: <<>>
  def drop(bin, 0), do: bin
  def drop(<<_::size(8), rest::binary>>, n), do: drop(rest, n - 1)

  @spec take(binary(), non_neg_integer()) :: binary()
  @spec take(binary(), non_neg_integer(), charlist()) :: binary()
  def take(bin, n), do: _take(bin, n)
  def take(bin, n, _opts), do: _take(bin, n)

  @spec to_string(binary()) :: String.t()
  def to_string(bin) when is_binary(bin), do: bin

  # -- internal --------------------------------------------------------------

  defp _take(<<>>, _n), do: <<>>
  defp _take(_bin, 0), do: <<>>
  defp _take(<<h::size(8), t::binary>>, n), do: <<h>> <> _take(t, n - 1)
end
