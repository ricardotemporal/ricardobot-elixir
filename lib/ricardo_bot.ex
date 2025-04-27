defmodule RicardoBot do
  use Nostrum.Consumer
  alias Nostrum.Api.Message
  alias RicardoBot.Command.Gato
  alias RicardoBot.Command.Cachorro
  alias RicardoBot.Command.Newton
  alias RicardoBot.Command.Par

  def handle_event({:MESSAGE_CREATE, msg, _ws_status}) do
    cond do
      String.starts_with?(msg.content, "!gato") ->
        Message.create(msg.channel_id, Gato.handle_gato(msg.content))

      String.starts_with?(msg.content, "!cachorro") ->
        Message.create(msg.channel_id, Cachorro.handle_cachorro(msg.content))

      String.starts_with?(msg.content, "!resolva") ->
        Message.create(msg.channel_id, Newton.handle_simplify(msg.content))

      String.starts_with?(msg.content, "!par") ->
        Message.create(msg.channel_id, Par.handle_par(msg.content))

      true ->
        :ignore
    end
  end
end
