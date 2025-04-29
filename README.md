# RicardoBot 

![Elixir](https://img.shields.io/badge/Elixir-4B275F?style=for-the-badge&logo=elixir&logoColor=white)
![Discord](https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)

RicardoBot is a Discord bot built with Elixir that integrates with 7 different APIs to provide various utilities right in your Discord server.

## Features

- 🐱 Random cat facts
- 🐶 HTTP status code dogs 
- ♟️ Chess.com player profiles
- 🌦️ Weather information
- 🔢 Number parity checker
- 🔗 QR code generator
- ➗ Math expression solver

## Available Commands

| Command               | Description                          | Example Usage                  | API Used                  |
|-----------------------|--------------------------------------|--------------------------------|---------------------------|
| `!cat`                | Get a random cat fact                | `!cat`                         | [MeowFacts](https://meowfacts.herokuapp.com/) |
| `!dog <status_code>`  | Show HTTP status code dog image      | `!dog 404`                     | [HTTP.dog](https://http.dog/) |
| `!chess <username>`   | Show Chess.com player profile        | `!chess magnuscarlsen`         | [Chess.com API](https://www.chess.com/news/view/published-data-api) |
| `!weather <city>`     | Get current weather information      | `!weather tokyo`               | [GoWeather](http://goweather.xyz/) |
| `!even <number>`      | Check if a number is even/odd        | `!even 42`                     | [IsEvenAPI](https://isevenapi.xyz/) |
| `!qr <url_or_text>`   | Generate QR code                     | `!qr https://elixir-lang.org`  | [QRTag](https://qrtag.net/api/) |
| `!solve <expression>` | Solve math expressions               | `!solve 2*(3+5)`               | [Newton API](https://newton.vercel.app/) |
