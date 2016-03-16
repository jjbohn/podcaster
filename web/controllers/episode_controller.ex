defmodule Podcaster.EpisodeController do
  use Podcaster.Web, :controller

  def index(conn, _params) do
    episodes = Episode.all
    featured_episode = Enum.at(episodes, 0)

    render conn, "index.html", %{episodes: episodes,
                                 featured_episode: featured_episode,
                                 title: "State of Development Podcast with John Bohn | Software Development | Programming | News",
                                 description: "Need to know what's going on in the world of software development? Join John as he takes you through the week's programming/software development news."}
  end

  def show(conn, %{"episode_id" => episode_id}) do
    episodes = Episode.all
    featured_episode = Enum.at(episodes, 0)

    episode = Enum.find(episodes, &(&1.number == String.to_integer(episode_id)))

    render conn, "show.html", %{episode: episode,
                                featured_episode: featured_episode,
                                title: episode.title,
                                description: episode.description}
  end
end
