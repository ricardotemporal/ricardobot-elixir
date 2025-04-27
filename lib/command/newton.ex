defmodule RicardoBot.Command.Newton do
  def handle_simplify(content) do
    content |> valid_simplify_command() |> get_simplify_result()
  end

  defp valid_simplify_command(content) do
    command =
      content
      |> String.split(" ")

    case command do
      ["!solve", expression] -> {:ok, expression}
      _ -> :error
    end
  end

  defp get_simplify_result({:ok, expression}) do
    {:ok, response} = HTTPoison.get("https://newton.vercel.app/api/v2/simplify/#{URI.encode(expression)}")
    {:ok, data} = JSON.decode(response.body)

    """
    🧮 Expression: #{data["expression"]}
    🔍 Result: #{data["result"]}
    """
  end

  defp get_simplify_result(:error) do
    "Invalid command. Use: **!solve <expression>**"
  end
end
