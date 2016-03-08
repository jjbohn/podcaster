defmodule Simplecast do
	use HTTPoison.Base

  def process_url(url) do
    "https://api.simplecast.com/v1/podcasts/1739/" <> url
  end

  def process_respone_body(body) do
    body |> Poison.decode!
  end

  def process_request_headers(headers) do
    Enum.into(headers, [{"X-API-KEY", "sc_JU4CN6wNSNTmtLfVdEnkYA"}])
  end
end
