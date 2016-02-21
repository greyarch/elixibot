defmodule Elixibot do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec, warn: false

    children = [
      worker(Elixibot.Slack, [])
    ]

    opts = [strategy: :one_for_one, name: Elixibot.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
