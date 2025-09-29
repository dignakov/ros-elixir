defmodule Satchel do
  @moduledoc """
  Satchel is a library for serializing and de-serializing values. Currently,
  only little endian is supported (for my own convenience). The following
  types are supported:

  * `bool` (unsigned 8-bit int)
  * `int8`
  * `uint8`
  * `int16`
  * `uint16`
  * `int32`
  * `uint32`
  * `int64`
  * `uint64`
  * `float32`
  * `float64`
  * `string`
  * `time`, a tuple of secs and nsecs where both are `uint32`s.
  * `duration`, a tuple of secs and nsecs where both are `int32`s.
  """

  @doc """
  Pack an Elixir value as a binary.
  """
  @spec pack(any(), atom()) :: binary()
  def pack(data, type)

  def pack(b, :bool), do: <<b::unsigned-little-integer-8>>

  def pack(n, :int8), do: <<n::signed-little-integer-8>>
  def pack(n, :uint8), do: <<n::unsigned-little-integer-8>>
  def pack(n, :int16), do: <<n::signed-little-integer-16>>
  def pack(n, :uint16), do: <<n::unsigned-little-integer-16>>
  def pack(n, :int32), do: <<n::signed-little-integer-32>>
  def pack(n, :uint32), do: <<n::unsigned-little-integer-32>>
  def pack(n, :int64), do: <<n::signed-little-integer-64>>
  def pack(n, :uint64), do: <<n::unsigned-little-integer-64>>

  def pack(f, :float32), do: <<f::signed-little-float-32>>
  def pack(f, :float64), do: <<f::signed-little-float-64>>

  def pack(str, :string), do: str

  def pack({secs, nsecs}, :time),
    do: <<secs::unsigned-little-integer-32, nsecs::unsigned-little-integer-32>>

  def pack({secs, nsecs}, :duration),
    do: <<secs::signed-little-integer-32, nsecs::signed-little-integer-32>>

  # TODO examples in @doc tag
  @doc """
  Unpack a binary value.
  """
  @spec unpack(binary(), atom()) :: any()
  def unpack(data, type)
  def unpack(str, :string), do: str
  def unpack(data, type) do
    {value, _rest} = unpack_take(data, type)

    value
  end

  @doc """
  Unpack a binary which potentially contains other terms. Returns the value
  parsed and the rest of the binary.

  > This does not accept variable-sized types like `string`.
  """
  @spec unpack_take(binary(), atom()) :: {any(), binary()}
  def unpack_take(binary, type)
  def unpack_take(<<b::unsigned-little-integer-8, rest::binary>>, :bool), do: {b == 1, rest}

  def unpack_take(<<n::signed-little-integer-8, rest::binary>>, :int8), do: {n, rest}
  def unpack_take(<<n::unsigned-little-integer-8, rest::binary>>, :uint8), do: {n, rest}
  def unpack_take(<<n::signed-little-integer-16, rest::binary>>, :int16), do: {n, rest}
  def unpack_take(<<n::unsigned-little-integer-16, rest::binary>>, :uint16), do: {n, rest}
  def unpack_take(<<n::signed-little-integer-32, rest::binary>>, :int32), do: {n, rest}
  def unpack_take(<<n::unsigned-little-integer-32, rest::binary>>, :uint32), do: {n, rest}
  def unpack_take(<<n::signed-little-integer-64, rest::binary>>, :int64), do: {n, rest}
  def unpack_take(<<n::unsigned-little-integer-64, rest::binary>>, :uint64), do: {n, rest}

  def unpack_take(<<f::signed-little-float-32, rest::binary>>, :float32), do: {f, rest}
  def unpack_take(<<f::signed-little-float-64, rest::binary>>, :float64), do: {f, rest}


  def unpack_take(
        <<secs::unsigned-little-integer-32, nsecs::unsigned-little-integer-32, rest::binary>>,
        :time
      ),
      do: {{secs, nsecs}, rest}

  def unpack_take(
        <<secs::signed-little-integer-32, nsecs::signed-little-integer-32, rest::binary>>,
        :duration
      ),
      do: {{secs, nsecs}, rest}
end
