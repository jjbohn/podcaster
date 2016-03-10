defmodule Podcast.QuickLinkControllerTest do
  use Podcaster.ConnCase

  test "GET /rss", %{conn: conn} do
    conn = get conn, "/rss"
    assert conn.status == 200
  end
end
