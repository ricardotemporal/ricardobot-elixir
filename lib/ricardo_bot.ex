defmodule RicardoBot do
  use Nostrum.Consumer
  alias Nostrum.Api.Message
  alias RicardoBot.Command.Gato

  def handle_event({:MESSAGE_CREATE, msg, _ws_status}) do
    cond do
      String.starts_with?(msg.content, "!gato") ->
        Message.create(msg.channel_id, Gato.handle_gato(msg.content))

      true ->
        :ignore
    end
  end
end
