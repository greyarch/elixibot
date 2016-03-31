defmodule Elixibot.Slack do
  use Slack

  @token Application.get_env(:elixibot, __MODULE__)[:token]

  def start_link, do: start_link(@token, [])

  def response(msg) do
    [_, cmd] = msg
    case cmd do
      "mix" -> "What's your poison, sir?"
      _ -> "Hmm, I am not sure I understand..."
    end
  end

  def handle_message(message = %{type: "message", text: text}, slack, state) do
    match = Regex.run ~r/<@#{slack.me.id}>:?\s*(.*)/, text
    if match do
      [_, cmd] = match
      parsed = String.split cmd
      {resp, 0} = System.cmd hd(parsed), tl(parsed)
      Slack.send_message(resp, message.channel, slack)
    end
    {:ok, state}
  end
  def handle_message(_message, _slack, state), do: {:ok, state}
end
