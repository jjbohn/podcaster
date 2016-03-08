defmodule Episodes do
  def all do
    {:ok, response} = Simplecast.get("episodes.json")
    {:ok, episodes} = Poison.decode(response.body)

    episodes
  end

  def find(id) do
    {:ok, response} = Simplecast.get("episode/#{id}.json")
    {:ok, episode} = Poison.decode(response.body)

    episode
  end
end
