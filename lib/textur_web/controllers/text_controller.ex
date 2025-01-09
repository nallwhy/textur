defmodule TexturWeb.TextController do
  use TexturWeb, :controller

  def new(conn, _params) do
    render(conn, :new)
  end
end
