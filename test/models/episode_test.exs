defmodule EpisodeTest do

  defmodule SimplecastDouble do
    def get("episodes.json") do
      json = ~s([{"title":"Episode 1"},{"title":"Episode 2"}])
      response = %HTTPoison.Response{status_code: 200, body: json}

      {:ok, response}
    end
  end

  use ExUnit.Case, async: true

  # test "can be transformed to JSON" do
  #   assert ~s({"title":"Episode 1","number":"1","long_description":"Long description","id":"asdf-fdsa","episode_id":"1234","description":"Description"})
  #   == Poison.encode!(Podcast.Fixtures.EpisodeFixture.episode_1)
  # end

  test "can be hydrated from JSON" do
    assert %Episode{title: "Episode 1"} == Poison.decode!(~s({"title":"Episode 1"}), as: %Episode{})
  end

  test "all" do
    episodes = Episode.all(SimplecastDouble)

    assert Enum.count(episodes) == 2
  end
end
