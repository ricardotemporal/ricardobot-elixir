defmodule RicardoBot.Command.Cat do
  def handle_cat(content) do
    content |> valid_cat_command() |> get_cat_result()
  end

  defp valid_cat_command(content) do
    case String.downcase(content) do
      "!cat" -> {:ok, nil}
      _ -> :error
    end
  end

  defp get_cat_result({:ok, _}) do
    {:ok, response} = HTTPoison.get("https://meowfacts.herokuapp.com/")
    {:ok, json} = JSON.decode(response.body)
    "🐱 Cat Fact: #{List.first(json["data"])}"
  end

  defp get_cat_result(:error) do
    "Invalid command. Use: **!cat**"
  end
end
