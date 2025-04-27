defmodule RicardoBotTest do
  use ExUnit.Case
  doctest RicardoBot

  test "greets the world" do
    assert RicardoBot.hello() == :world
  end
end
