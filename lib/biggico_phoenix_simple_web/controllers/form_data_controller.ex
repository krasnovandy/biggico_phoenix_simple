defmodule BiggicoPhoenixSimpleWeb.FormDataController do
  use BiggicoPhoenixSimpleWeb, :controller

  alias BiggicoPhoenixSimple.Schemas.FormData
  alias BiggicoPhoenixSimple.Repo
  alias Phoenix.HTML.Format

  def index(conn, _params) do
    records = Repo.all(FormData)
    render(conn, "index.html", records: records)
  end

  def show(conn, %{"id" => id}) do
    form = Repo.get!(FormData, id)
    |> map_to_form
    render(conn, "show.html", form: form)
  end

  def new(conn, _params) do
    changeset = FormData.changeset(%FormData{})
    render conn, "new.html", changeset: changeset
  end

  def create(conn, %{"data" => data}) do
    json_data = Map.new(data, fn {k, v} -> {String.to_atom(k), v} end)
    changeset = %FormData{} |> FormData.changeset()
    |> Ecto.Changeset.put_change(:data, json_data)
    case Repo.insert(changeset) do
      {:ok, form_data} ->
        conn
        |> put_flash(:info, "#record created!")
        |> redirect(to: form_data_path(conn, :show, form_data))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  defp map_to_form(%{data: nil}) do
    Format.text_to_html("")
    |> Phoenix.HTML.safe_to_string
  end
  defp map_to_form(%{data: data}) do
    #тут мы разворачиваем data в html
    opts = [wrapper_tag: :h3]
    Map.to_list(data)
    |> Enum.reduce( "", fn({name, value}, acc) ->
        acc<>
        (Format.text_to_html(name<>" "<>value, opts)
         |> Phoenix.HTML.safe_to_string)
      end)
  end
end
