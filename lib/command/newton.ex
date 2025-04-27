defmodule RicardoBot.Command.Newton do
  def handle_simplify(msg_content) do
    case String.split(msg_content, " ", parts: 2) do
      ["!resolva", expression] ->
        encoded_expression = URI.encode(expression)
        url = "https://newton.vercel.app/api/v2/simplify/#{encoded_expression}"

        case HTTPoison.get(url) do
          {:ok, %{status_code: 200, body: body}} ->
            case JSON.decode(body) do
              {:ok, data} ->
                %{
                  embed: %{
                    title: "🧮 Resolve Problemas",
                    description: """
                    📥 Expressão: `#{data["expression"]}`
                    📤 Resultado: `#{data["result"]}`
                    """,
                    color: 0x5DADE2
                  }
                }

              {:error, _reason} ->
                "⚠️ Erro ao decodificar a resposta."
            end

          {:ok, %{status_code: 404}} ->
            "❌ Expressão inválida ou não encontrada."

          {:error, _reason} ->
            "⚠️ Erro ao consultar a expressão."
        end

      _ ->
        "❌ Use o comando assim: `!resolva <expressão>`"
    end
  end
end
