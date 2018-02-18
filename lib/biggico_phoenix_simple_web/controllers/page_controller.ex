defmodule BiggicoPhoenixSimpleWeb.PageController do
  use BiggicoPhoenixSimpleWeb, :controller

#  alias BiggicoPhoenixSimple.Schemas.FormData


  def index(conn, _params) do
    render conn, "index.html"
  end

#  def index(conn, _params) do
#
#    #    render conn, "new.html", changeset: changeset
#    render conn, "index.html", changeset: changeset
#  end

#  def create(conn, _params) do
#    IO.inspect("create----->")
#    changeset = FormData.changeset(%FormData{})
##    render conn, "create.html", changeset: changeset
#    render(conn, "create.html", changeset: changeset)
#  end

  #  def create(conn, _) do
  #    IO.inspect("create---->")
  #    {:ok, body, conn} = Plug.Conn.read_body(conn, length: 1_000_000)
  ##    ordered_params = URI.decode(body)
  #  end
end
