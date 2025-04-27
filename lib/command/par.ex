defmodule RicardoBot.Command.Par do
  def handle_par(msg_content) do
    case String.split(msg_content, " ", parts: 2) do
      ["!par", number] ->
        url = "https://api.isevenapi.xyz/api/iseven/#{number}"

        case HTTPoison.get(url) do
          {:ok, %{status_code: 200, body: body}} ->
            case JSON.decode(body) do
              {:ok, data} ->
                result = if data["iseven"], do: "✅ É par!", else: "❌ Não é par."
                build_embed(number, result)

              {:error, _reason} ->
                "⚠️ Erro ao decodificar a resposta."
            end

          {:ok, %{status_code: 404}} ->
            "❌ Número inválido ou não encontrado."

          {:error, _reason} ->
            "⚠️ Erro ao consultar o número."
        end

      _ ->
        "❌ Use o comando assim: `!par <número>`"
    end
  end

  defp build_embed(number, result) do
    %{
      embed: %{
        title: "🔢 Verificação de Paridade",
        description: """
        Número: **#{number}**
        Resultado: **#{result}**
        """,
        color: 0x58D68D
      }
    }
  end
end
