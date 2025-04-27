defmodule RicardoBot.Command.Xadrez do
  def handle_xadrez(msg_content) do
    case String.split(msg_content, " ", parts: 2) do
      ["!xadrez", username] ->
        url = "https://api.chess.com/pub/player/#{String.downcase(username)}"

        case HTTPoison.get(url) do
          {:ok, %{status_code: 200, body: body}} ->
            {:ok, data} = JSON.decode(body)

            embed = %{
              title: "♟️ Perfil de #{data["username"]}",
              description: """
              🏷️ Título: #{Map.get(data, "title", "N/A")}
              📌 Status: #{Map.get(data, "status", "N/A")}
              🌍 Localização: #{Map.get(data, "location", "N/A")}
              👥 Seguidores: #{Map.get(data, "followers", "N/A")}
              🔗 Perfil: [Abrir no Chess.com](#{data["url"]})
              """,
              thumbnail: %{
                url: Map.get(data, "avatar", "https://www.chess.com/bundles/web/images/noavatar_l.84a92436.gif")
              }
            }

            %{embed: embed}

          {:ok, %{status_code: 404}} ->
            "Usuário não encontrado no Chess.com."
        end

      _ ->
        "Use o comando assim: `!xadrez <nome_do_usuario>`"
    end
  end
end
