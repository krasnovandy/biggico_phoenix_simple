defmodule BiggicoPhoenixSimpleWeb.FormDataControllerTest do
  use BiggicoPhoenixSimpleWeb.ConnCase

  test "GET /form_datas", %{conn: conn} do
    conn = get conn, "/form_datas"
    assert html_response(conn, 200)
  end

  test "GET /form_datas/new", %{conn: conn} do
    conn = get conn, "/form_datas/new"
    assert html_response(conn, 200)
  end
end
