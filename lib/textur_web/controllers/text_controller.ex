defmodule TexturWeb.TextController do
  use TexturWeb, :controller
  use Textur.Use

  def new(conn, _params) do
    form = form_for_create()

    conn
    |> render(:new, form: form)
  end

  def show(conn, %{"text_id" => text_obf_id}) do
    with {:ok, text_id} <- U.Obfuscator.decode(text_obf_id),
         {:ok, text} <- D.get_text_by_id(text_id) do
      conn
      |> render(:show, text: text)
    else
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
        text = text |> Ash.load!([:obf_id])

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
