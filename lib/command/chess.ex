defmodule RicardoBot.Command.Chess do
  def handle_chess(content) do
    content |> valid_chess_command() |> get_chess_result()
  end

  defp valid_chess_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!chess", username] -> {:ok, username}
      _ -> :error
    end
  end

  defp get_chess_result({:ok, username}) do
    {:ok, response} = HTTPoison.get("https://api.chess.com/pub/player/#{username}")
    {:ok, data} = JSON.decode(response.body)

    """
    ♟️ Chess Profile: #{data["username"]}
    Title: #{data["title"] || "N/A"}
    Followers: #{data["followers"]}
    Profile: #{data["url"]}
    """
  end

  defp get_chess_result(:error) do
    "Invalid command. Use: **!chess <username>**"
  end
end
