defmodule BiggicoPhoenixSimpleWeb.PageController do
  use BiggicoPhoenixSimpleWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
