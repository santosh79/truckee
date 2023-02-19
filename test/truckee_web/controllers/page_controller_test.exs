defmodule TruckeeWeb.PageControllerTest do
  use TruckeeWeb.ConnCase

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "Trucks"
  end
end
