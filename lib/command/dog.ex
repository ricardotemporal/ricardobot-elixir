defmodule RicardoBot.Command.Dog do
  def handle_dog(content) do
    content |> valid_dog_command() |> get_dog_result()
  end

  defp valid_dog_command(content) do
    command =
      content
      |> String.split(" ")

    case command do
      ["!dog", code] -> {:ok, code}
      _ -> :error
    end
  end

  defp get_dog_result({:ok, code}) do
    "🐶 Status Code #{code}: https://http.dog/#{code}.jpg"
  end

  defp get_dog_result(:error) do
    "Invalid command. Use: **!dog <status_code>**"
  end
end
