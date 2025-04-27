defmodule RicardoBot.Command.Clima do
  def handle_clima(content) do
    content
    |> valid_clima_command()
    |> get_clima_result()
  end

  defp valid_clima_command(content) do
    command =
      content
      |> String.downcase()
      |> String.split(" ")

    case command do
      ["!clima", city] -> {:ok, city}
      _ -> :error
    end
  end

  defp get_clima_result({:ok, city}) do
    url = "http://goweather.xyz/weather/#{city}"

    case HTTPoison.get(url) do
      {:ok, response} ->
        {:ok, json} = JSON.decode(response.body)
        weather_info = json["description"]
        temperature = json["temperature"]
        wind = json["wind"]

        """
        **Clima em #{String.capitalize(city)}:**
        🌤 **Descrição:** #{weather_info}
        🌡 **Temperatura:** #{temperature}
        💨 **Vento:** #{wind}
        """

      {:error, %HTTPoison.Error{reason: reason}} ->
        "Erro ao acessar a API: #{inspect(reason)}"
    end
  end

  defp get_clima_result(:error) do
    "Comando errado. Use: **!clima <cidade>**"
  end
end
