defmodule Podcaster.PageControllerTest do
  use Podcaster.ConnCase

  test "GET /", %{conn: conn} do
    conn = get conn, "/"
    assert conn.status == 200
  end

  test "GET /1", %{conn: conn} do
    conn = get conn, "/1"
    assert conn.status == 200
  end
end
