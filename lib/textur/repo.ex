defmodule Textur.Repo do
  use Ecto.Repo,
    otp_app: :textur,
    adapter: Ecto.Adapters.SQLite3
end
