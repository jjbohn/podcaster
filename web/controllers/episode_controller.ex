defmodule Podcaster.EpisodeController do
  use Podcaster.Web, :controller

  def index(conn, _params) do
    episodes = Episode.all
    featured_episode = Enum.at(episodes, 0)

    render conn, "index.html", %{episodes: episodes,
                                 featured_episode: featured_episode}
  end

  def show(conn, %{"episode_id" => episode_id}) do
    episodes = Episode.all
    featured_episode = Enum.at(episodes, 0)

    episode = Enum.find(episodes, &(&1.number == String.to_integer(episode_id)))

    render conn, "show.html", %{episode: episode,
                                featured_episode: featured_episode}
  end
end
