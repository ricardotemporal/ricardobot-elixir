defmodule RicardoBot do
  use Nostrum.Consumer
  alias RicardoBot.Command.Weather
  alias Nostrum.Api.Message
  alias RicardoBot.Command.Cat
  alias RicardoBot.Command.Dog
  alias RicardoBot.Command.Newton
  alias RicardoBot.Command.Even
  alias RicardoBot.Command.Chess
  alias RicardoBot.Command.QR
  alias RicardoBot.Command.Weather

  def handle_event({:MESSAGE_CREATE, msg, _ws_status}) do
    cond do
      String.starts_with?(msg.content, "!cat") ->
        Message.create(msg.channel_id, Cat.handle_cat(msg.content))

      String.starts_with?(msg.content, "!dog") ->
        Message.create(msg.channel_id, Dog.handle_dog(msg.content))

      String.starts_with?(msg.content, "!solve") ->
        Message.create(msg.channel_id, Newton.handle_simplify(msg.content))

      String.starts_with?(msg.content, "!even") ->
        Message.create(msg.channel_id, Even.handle_even(msg.content))

      String.starts_with?(msg.content, "!chess") ->
        Message.create(msg.channel_id, Chess.handle_chess(msg.content))

      String.starts_with?(msg.content, "!qr") ->
        Message.create(msg.channel_id, QR.handle_qr(msg.content))

      String.starts_with?(msg.content, "!weather") ->
        Message.create(msg.channel_id, Weather.handle_weather(msg.content))

      true ->
        :ignore
    end
  end
end
