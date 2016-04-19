use Mix.Config

config :elixibot, Elixibot.Slack,
  token: System.get_env("SLACK_AUTH_TOKEN")
