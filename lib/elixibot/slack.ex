defmodule Elixibot.Slack do
  use Slack

  def start_link, do: start_link(System.get_env("SLACK_AUTH_TOKEN"), [])

  def handle_message(message = %{type: "message", text: text}, slack, state) do
    match = Regex.run ~r/(<@#{slack.me.id}>|@#{slack.me.name}):?\s*(.*)/, text
    if match do
      [_, _, cmd] = match
      [_, target, _] = Regex.run ~r/target=<?((https?):\/\/[^\s\/$.?#].[^\s|>]*)>?/, cmd
      HTTPotion.get target
      Slack.send_message "Sent a GET request to #{target}", message.channel, slack
    end
    {:ok, state}
  end
  def handle_message(_message, _slack, state), do: {:ok, state}
end
