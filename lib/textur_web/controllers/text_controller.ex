defmodule TexturWeb.TextController do
  use TexturWeb, :controller
  use Textur.Use

  def new(conn, _params) do
    form = form_for_create()

    render(conn, :new, form: form)
  end

  def create(conn, %{"form" => params}) do
    form = form_for_create()

    case form |> AshPhoenix.Form.submit(params: params) do
      {:ok, _text} ->
        conn
        |> put_flash(:info, "Text shared successfully!")
        # TODO: change url
        |> redirect(to: ~p"/")

      {:error, form} ->
        conn
        |> render(:new, form: form)
    end
  end

  defp form_for_create() do
    D.Text
    |> AshPhoenix.Form.for_create(:create)
    |> Phoenix.Component.to_form()
  end
end
