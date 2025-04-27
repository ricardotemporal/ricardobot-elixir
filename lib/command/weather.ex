defmodule RicardoBot.Command.Weather do
  def handle_weather(content) do
    content |> valid_weather_command() |> get_weather_result()
  end

  defp valid_weather_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!weather", city] -> {:ok, city}
      _ -> :error
    end
  end

  defp get_weather_result({:ok, city}) do
    {:ok, response} = HTTPoison.get("http://goweather.xyz/weather/#{city}")
    {:ok, data} = JSON.decode(response.body)

    """
    ⛅ Weather in #{city}:
    Description: #{data["description"]}
    Temperature: #{data["temperature"]}
    Wind: #{data["wind"]}
    """
  end

  defp get_weather_result(:error) do
    "Invalid command. Use: **!weather <city>**"
  end
end
