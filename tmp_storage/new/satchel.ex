defmodule Satchel do
  @moduledoc false

  @type int_t ::
          :bool
          | :int8  | :uint8
          | :int16 | :uint16
          | :int32 | :uint32
          | :int64 | :uint64

  @type float_t :: :float32 | :float64
  @type special_t :: :string | :time | :duration
  @type type_t :: int_t | float_t | special_t

  # Pipe-friendly form
  @spec pack(any(), type_t) :: binary()
  def pack(data, type) when is_atom(type), do: do_pack(type, data)

  # Reversed form (e.g., Satchel.pack(:uint32, n))
  @spec pack(type_t, any()) :: binary()
  def pack(type, data) when is_atom(type), do: do_pack(type, data)

  @spec unpack(binary(), type_t) :: any()
  def unpack(str, :string) when is_binary(str), do: str
  def unpack(bin, type) when is_binary(bin) and is_atom(type) do
    {val, _rest} = unpack_take(bin, type)
    val
  end

  @spec unpack_take(binary(), type_t) :: {any(), binary()}
  # bool
  def unpack_take(<<b::unsigned-little-8,  rest::binary>>, :bool),   do: {b == 1, rest}

  # signed/unsigned ints
  def unpack_take(<<n::signed-little-8,   rest::binary>>, :int8),   do: {n, rest}
  def unpack_take(<<n::unsigned-little-8, rest::binary>>, :uint8),  do: {n, rest}
  def unpack_take(<<n::signed-little-16,  rest::binary>>, :int16),  do: {n, rest}
  def unpack_take(<<n::unsigned-little-16,rest::binary>>, :uint16), do: {n, rest}
  def unpack_take(<<n::signed-little-32,  rest::binary>>, :int32),  do: {n, rest}
  def unpack_take(<<n::unsigned-little-32,rest::binary>>, :uint32), do: {n, rest}
  def unpack_take(<<n::signed-little-64,  rest::binary>>, :int64),  do: {n, rest}
  def unpack_take(<<n::unsigned-little-64,rest::binary>>, :uint64), do: {n, rest}

  # floats
  def unpack_take(<<f::little-float-32,    rest::binary>>, :float32), do: {f, rest}
  def unpack_take(<<f::little-float-64,    rest::binary>>, :float64), do: {f, rest}

  # time / duration
  def unpack_take(
        <<secs::unsigned-little-32, nsecs::unsigned-little-32, rest::binary>>,
        :time
      ),
      do: {{secs, nsecs}, rest}

  def unpack_take(
        <<secs::signed-little-32, nsecs::signed-little-32, rest::binary>>,
        :duration
      ),
      do: {{secs, nsecs}, rest}

  def unpack_take(_bin, type),
    do: raise(ArgumentError, "Satchel.unpack_take/2 unsupported type: #{inspect(type)}")

  # -- internal --------------------------------------------------------------

  defp do_pack(:bool,  b) when b in [0, 1, true, false],
    do: <<(if b in [1, true], do: 1, else: 0)::unsigned-little-8>>

  defp do_pack(:int8,  n), do: <<n::signed-little-8>>
  defp do_pack(:uint8, n), do: <<n::unsigned-little-8>>
  defp do_pack(:int16, n), do: <<n::signed-little-16>>
  defp do_pack(:uint16,n), do: <<n::unsigned-little-16>>
  defp do_pack(:int32, n), do: <<n::signed-little-32>>
  defp do_pack(:uint32,n), do: <<n::unsigned-little-32>>
  defp do_pack(:int64, n), do: <<n::signed-little-64>>
  defp do_pack(:uint64,n), do: <<n::unsigned-little-64>>

  defp do_pack(:float32, f), do: <<f::little-float-32>>
  defp do_pack(:float64, f), do: <<f::little-float-64>>

  defp do_pack(:string, str) when is_binary(str), do: str

  defp do_pack(:time, {secs, nsecs}),
    do: <<secs::unsigned-little-32, nsecs::unsigned-little-32>>

  defp do_pack(:duration, {secs, nsecs}),
    do: <<secs::signed-little-32, nsecs::signed-little-32>>

  defp do_pack(type, val),
    do: raise(ArgumentError, "Satchel.pack/2 unsupported input: #{inspect(type)}, #{inspect(val)}")
end
