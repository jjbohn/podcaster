defmodule Podcaster.Rss do
	def fetch do
    {:ok, %{body: body}} = HTTPoison.get("https://simplecast.com/podcasts/1739/rss")

    body
  end
end
