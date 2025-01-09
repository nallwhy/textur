defmodule TexturWeb.TextController do
  use TexturWeb, :controller
  use Textur.Use

  def new(conn, _params) do
    form = form_for_create()

    conn
    |> render(:new, form: form)
  end

  def show(conn, %{"text_id" => text_id}) do
    case D.get_text_by_id(text_id) do
      {:ok, text} ->
        conn
        |> render(:show, text: text)

      {:error, _} ->
        conn
        |> put_flash(:error, "No text")
        |> redirect(to: ~p"/")
    end
  end

  def create(conn, %{"form" => params}) do
    form = form_for_create()

    case form |> AshPhoenix.Form.submit(params: params) do
      {:ok, text} ->
        conn
        |> put_flash(:info, "Text shared successfully!")
        |> redirect(to: ~p"/#{text}")

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
