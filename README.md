# RicardoBot - A Multifunctional Discord Bot in Elixir

![Elixir](https://img.shields.io/badge/Elixir-4B275F?style=for-the-badge&logo=elixir&logoColor=white)
![Discord](https://img.shields.io/badge/Discord-5865F2?style=for-the-badge&logo=discord&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)

RicardoBot is a feature-rich Discord bot built with Elixir that integrates with 7 different APIs to provide various utilities right in your Discord server.

## ✨ Features

- 🐱 Random cat facts
- 🐶 HTTP status code dogs (http.dog)
- ♟️ Chess.com player profiles
- 🌦️ Weather information
- 🔢 Number parity checker
- 🔗 QR code generator
- ➗ Math expression solver

## 🚀 Getting Started

### Prerequisites

- Docker and Docker Compose
- Discord developer account
- Discord server where you have admin permissions

### Installation

1. **Set up your Discord bot:**
   - Create a new application at [Discord Developer Portal](https://discord.com/developers/applications)
   - Navigate to the "Bot" tab and:
     - Click "Add Bot"
     - Enable "Administrator" permissions
     - Turn on all "Gateway Intents"
     - Copy your bot token

2. **Create config file**
    - Edit config/config.exs with your Discord token:

    ```elixir
    import Config
    
    config :nostrum,
      token: "YOUR_DISCORD_BOT_TOKEN",
      gateway_intents: :all
    ``` 
  
3. **Run with Docker:**

    ```bash
    docker-compose up --build
    ```
4. **Invite the bot to your server:**
    - In Discord Developer Portal, go to OAuth2 → URL Generator
    - Select bot scope
    - Check "Administrator" permission
    - Use the generated URL to invite the bot

## 📜 Available Commands

| Command               | Description                          | Example Usage                  | API Used                  |
|-----------------------|--------------------------------------|--------------------------------|---------------------------|
| `!cat`                | Get a random cat fact                | `!cat`                         | [MeowFacts](https://meowfacts.herokuapp.com/) |
| `!dog <status_code>`  | Show HTTP status code dog image      | `!dog 404`                     | [HTTP.dog](https://http.dog/) |
| `!chess <username>`   | Show Chess.com player profile        | `!chess magnuscarlsen`         | [Chess.com API](https://www.chess.com/news/view/published-data-api) |
| `!weather <city>`     | Get current weather information      | `!weather tokyo`               | [GoWeather](http://goweather.xyz/) |
| `!even <number>`      | Check if a number is even/odd        | `!even 42`                     | [IsEvenAPI](https://isevenapi.xyz/) |
| `!qr <url_or_text>`   | Generate QR code                     | `!qr https://elixir-lang.org`  | [QRTag](https://qrtag.net/api/) |
| `!solve <expression>` | Solve math expressions               | `!solve 2*(3+5)`               | [Newton API](https://newton.vercel.app/) |