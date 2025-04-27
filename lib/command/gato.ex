defmodule RicardoBot.Command.Gato do
  def handle_gato(_content) do
    case HTTPoison.get("https://meowfacts.herokuapp.com/?lang=por") do
      {:ok, %{body: body}} ->
        {:ok, json} = JSON.decode(body)
        fato = List.first(json["data"])

        %{
          embed: %{
            title: "🐱 Fato Aleatório sobre Gatos",
            description: fato,
            color: 0xFFC0CB
          }
        }

      {:error, _reason} ->
        "Não consegui buscar um fato felino agora. Tente novamente mais tarde. 😿"
    end
  end
end
