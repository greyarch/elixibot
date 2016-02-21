defmodule Elixibot.Slack do
  use Slack

  @token Application.get_env(:elixibot, __MODULE__)[:token]

  def start_link, do: start_link(@token, [])

  def handle_message(message = %{type: "message", text: text}, slack, state) do
    if text == "<@#{slack.me.id}>: mix" do
      Slack.send_message("What's your poison, sir!", message.channel, slack)
    end

    {:ok, state}
  end
  def handle_message(_message, _slack, state), do: {:ok, state}
end
