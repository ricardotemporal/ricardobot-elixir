defmodule RicardoBot.Command.Cachorro do
  def handle_cachorro(content) do
    case String.split(content, " ", parts: 2) do
      ["!cachorro", code] ->
        get_cachorro_embed(code)
      _ ->
        "❌ Use o comando assim: `!cachorro <status_code>`"
    end
  end

  defp get_cachorro_embed(code) do
    %{
      embed: %{
        title: "🐶 Cachorro do Status Code #{code}",
        image: %{url: "https://http.dog/#{code}.jpg"},
        color: 0xFFD700
      }
    }
  end
end
