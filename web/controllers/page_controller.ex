defmodule Podcaster.PageController do
  use Podcaster.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
