defmodule Textur.Utils.Obfuscator do
  def encode(integer) when is_integer(integer) do
    Hashids.encode(hashids(), integer)
  end

  def decode!(obfuscated) do
    [integer] = Hashids.decode!(hashids(), obfuscated)

    integer
  end

  defp hashids() do
    Hashids.new(salt: salt(), min_len: 8)
  end

  defp salt() do
    Application.fetch_env!(:textur, :obfuscator_salt)
  end
end
