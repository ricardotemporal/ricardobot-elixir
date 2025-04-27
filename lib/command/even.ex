defmodule RicardoBot.Command.Even do
  def handle_even(content) do
    content |> valid_even_command() |> get_even_result()
  end

  defp valid_even_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!even", number] -> {:ok, number}
      _ -> :error
    end
  end

  defp get_even_result({:ok, number}) do
    {:ok, response} = HTTPoison.get("https://api.isevenapi.xyz/api/iseven/#{number}")
    {:ok, data} = JSON.decode(response.body)

    if data["iseven"],
      do: "✅ #{number} is EVEN",
      else: "❌ #{number} is ODD"
  end

  defp get_even_result(:error) do
    "Invalid command. Use: **!even <number>**"
  end
end
