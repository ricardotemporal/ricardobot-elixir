defmodule RicardoBot.Command.QR do
  def handle_qr(msg_content) do
    case String.split(msg_content, " ", parts: 2) do
      ["!qr", url] ->
        qr_url = "https://qrtag.net/api/qr.png?url=#{URI.encode(url)}"

        %{
          embed: %{
            title: "🔗 QR Code Gerado",
            description: "Este QR code leva para:\n`#{url}`",
            image: %{url: qr_url}
          }
        }

      _ ->
        "Use o comando assim: `!qr https://exemplo.com`"
    end
  end
end
