defmodule Textur.Utils.Obfuscator do
  def encode(integer) when is_integer(integer) do
    Hashids.encode(hashids(), integer)
  end

  def decode(obfuscated) do
    case Hashids.decode!(hashids(), obfuscated) do
      [integer] -> {:ok, integer}
      _ -> :error
    end
  end

  def decode!(obfuscated) do
    {:ok, integer} = decode(obfuscated)

    integer
  end

  defp hashids() do
    Hashids.new(salt: salt(), min_len: 16)
  end

  defp salt() do
    Application.fetch_env!(:textur, :obfuscator_salt)
  end
end
