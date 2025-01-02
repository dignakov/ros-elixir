defmodule ROS.BinaryPacker do
  @moduledoc """
  Binary packing implementation for ROS protocol serialization.
  """

  def pack(value, :uint32), do: <<value::unsigned-little-integer-size(32)>>
  def pack(value, :int32), do: <<value::signed-little-integer-size(32)>>
  def pack(value, :uint16), do: <<value::unsigned-little-integer-size(16)>>
  def pack(value, :int16), do: <<value::signed-little-integer-size(16)>>
  def pack(value, :uint8), do: <<value::unsigned-little-integer-size(8)>>
  def pack(value, :int8), do: <<value::signed-little-integer-size(8)>>
  def pack(value, :float32), do: <<value::little-float-size(32)>>
  def pack(value, :float64), do: <<value::little-float-size(64)>>
  def pack(true, :bool), do: <<1::unsigned-little-integer-size(8)>>
  def pack(false, :bool), do: <<0::unsigned-little-integer-size(8)>>
  def pack({secs, nsecs}, :time) do
    <<secs::unsigned-little-integer-size(32), nsecs::unsigned-little-integer-size(32)>>
  end
  def unpack_take(<<value::unsigned-little-integer-size(32), rest::binary>>, :uint32), do: {value, rest}
  def unpack_take(<<value::signed-little-integer-size(32), rest::binary>>, :int32), do: {value, rest}
  def unpack_take(<<value::unsigned-little-integer-size(16), rest::binary>>, :uint16), do: {value, rest}
  def unpack_take(<<value::signed-little-integer-size(16), rest::binary>>, :int16), do: {value, rest}
  def unpack_take(<<value::unsigned-little-integer-size(8), rest::binary>>, :uint8), do: {value, rest}
  def unpack_take(<<value::signed-little-integer-size(8), rest::binary>>, :int8), do: {value, rest}
  def unpack_take(<<value::little-float-size(32), rest::binary>>, :float32), do: {value, rest}
  def unpack_take(<<value::little-float-size(64), rest::binary>>, :float64), do: {value, rest}
  def unpack_take(<<value::unsigned-little-integer-size(8), rest::binary>>, :bool), do: {value != 0, rest}
  def unpack_take(<<secs::unsigned-little-integer-size(32), nsecs::unsigned-little-integer-size(32), rest::binary>>, :time) do
    {{secs, nsecs}, rest}
  end
  def unpack(binary, type) do
    {value, _rest} = unpack_take(binary, type)
    value
  end
end
