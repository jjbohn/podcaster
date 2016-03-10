defmodule Podcaster.RssTest do
  use ExUnit.Case, async: true

  test "output matches simplecast" do
    {:ok, response} = HTTPoison.get("https://simplecast.com/podcasts/1739/rss")

    assert response.body == Podcaster.Rss.fetch
  end
end
