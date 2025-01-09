defmodule Textur.Use do
  defmacro __using__(_) do
    quote do
      alias Textur.Domain, as: D
    end
  end
end
