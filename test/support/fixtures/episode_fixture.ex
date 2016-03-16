defmodule Podcast.Fixtures.EpisodeFixture do
  def episode_1 do
    %Episode{
      id: "a8d69f15-bec9-46f1-a03e-74514002636b",
      description: "<p>The description of episode 1</p>",
      episode_id: "a8d69f15-bec9-46f1-a03e-74514002636b",
      long_description: "<p>The long description of episode 1</p>",
      number: "1",
      title: "Episode 1",
      publish_at: Timex.datetime({2015, 5, 9})
    }
  end
end
