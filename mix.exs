defmodule Elixibot.Mixfile do
  use Mix.Project

  def project do
    [app: :elixibot,
     version: "0.0.1",
     elixir: "~> 1.2",
     build_embedded: Mix.env == :prod,
     start_permanent: Mix.env == :prod,
     deps: deps]
  end

  def application do
    [applications: [:logger, :slack, :httpotion],
     mod: {Elixibot, []}]
  end

  defp deps do
    [{:slack, "~> 0.4.1"},
     {:httpotion, "~> 2.2.0"},
     {:websocket_client, git: "https://github.com/jeremyong/websocket_client"}]
  end
end
