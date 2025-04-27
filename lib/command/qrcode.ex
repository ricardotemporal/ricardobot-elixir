defmodule RicardoBot.Command.QR do
  def handle_qr(content) do
    content |> valid_qr_command() |> get_qr_result()
  end

  defp valid_qr_command(content) do
    command =
      content
      |> String.split(" ")

    case command do
      ["!qr", url] -> {:ok, url}
      _ -> :error
    end
  end

  defp get_qr_result({:ok, url}) do
    "https://qrtag.net/api/qr.png?url=#{URI.encode(url)}"
  end

  defp get_qr_result(:error) do
    "Invalid command. Use: **!qr <url>**"
  end
end
