defmodule Episode do
  defstruct [
    :id,
    :description,
    :episode_id,
    :long_description,
    :number,
    :title,
  ]

  def all(api \\ Simplecast) do
    {:ok, response} = api.get("episodes.json")
    {:ok, episodes} = Poison.decode(response.body, as: [%Episode{}])

    episodes
  end
end
