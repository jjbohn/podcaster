defmodule Podcaster.Mixfile do
  use Mix.Project

  def project do
    [app: :podcaster,
     version: "0.0.1",
     elixir: "~> 1.0",
     elixirc_paths: elixirc_paths(Mix.env),
     compilers: [:phoenix, :gettext] ++ Mix.compilers,
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     aliases: aliases,
     deps: deps]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [mod: {Podcaster, []},
     applications: [:phoenix, :phoenix_html, :phoenix_ecto, :cowboy, :logger,
                    :gettext, :postgrex, :httpoison, :timex]]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "web", "test/support"]
  defp elixirc_paths(_),     do: ["lib", "web"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [{:phoenix, "~> 1.1.4"},
     {:postgrex, ">= 0.0.0"},
     {:phoenix_html, "~> 2.4"},
     {:phoenix_ecto, "~> 2.0"},
     {:phoenix_live_reload, "~> 1.0", only: :dev},
     {:gettext, "~> 0.9"},
     {:cowboy, "~> 1.0"},
     {:httpoison, "~> 0.8.1"},
     {:poison, "~> 1.5"},
     {:earmark, "~> 0.2.0"},
     {:timex, "~> 2.1.1"},
     {:guardian, "~> 0.10.1"}]
  end

  defp aliases do
    ["ecto.setup": ["ecto.create", "ecto.migrate", "run priv/repo/seeds.exs"],
     "ecto.reset": ["ecto.drop", "ecto.setup"]]
  end
end
