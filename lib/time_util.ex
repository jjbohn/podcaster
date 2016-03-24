defmodule TimeUtil do
  def duration_hms(seconds) do
    hours = div(seconds, 3600)
    minutes = div(rem(seconds, 3600), 60)
    seconds = seconds - ((hours * 3600) + (minutes * 60))

    Enum.map_join([hours, minutes, seconds], ":", &justify/1)
  end

  defp justify(int) do
    int
    |> Integer.to_string
    |> String.rjust(2, ?0)
  end
end
