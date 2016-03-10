defmodule Podcaster.QuickLinkController do
  use Podcaster.Web, :controller

  def itunes(conn, _params) do
    redirect conn, external: "https://itunes.apple.com/us/podcast/state-development-podcast/id1089601796?mt=2"
  end

  def rss(conn, _params) do
    {:ok, response} = HTTPoison.get("https://simplecast.com/podcasts/1739/rss")
    conn
    |> put_resp_content_type("text/xml")
    |> text(response.body)
  end

  def stitcher(conn, _params) do
    redirect conn, external: "http://www.stitcher.com/podcast/state-of-development-with-john-bohn/state-of-development-podcast-with-john-bohn"
  end

  def twitter(conn, _params) do
    redirect conn, external: "http://twitter.com/jjbohn"
  end

  def facebook(conn, _params) do
    redirect conn, external: "https://www.facebook.com/stateofdevelopmentpodcast"
  end
end
