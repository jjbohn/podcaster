defmodule Podcaster.Router do
  use Podcaster.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Podcaster do
    pipe_through :browser # Use the default browser stack

    get "/", EpisodeController, :index

    get "/itunes", QuickLinkController, :itunes
    get "/rss", QuickLinkController, :rss
    get "/stitcher", QuickLinkController, :stitcher
    get "/twitter", QuickLinkController, :twitter
    get "/facebook", QuickLinkController, :facebook

    get "/:episode_id", EpisodeController, :show
  end

  # Other scopes may use custom stacks.
  # scope "/api", Podcaster do
  #   pipe_through :api
  # end
end
