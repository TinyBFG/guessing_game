defmodule GuessingGame do
  @moduledoc """
  Documentation for `GuessingGame`.
  """

  # call level 1

  def intro() do
    name = IO.gets("Hello, what's your name?\n")
    name = String.trim(name)
    name_response(name)
  end

  # call level 2

  def name_response("Ian") do
    yes_or_no =
      IO.gets("That's awesome!  My creator is an Ian!  Would you like to play a game?\n")

    yes_or_no = String.trim(yes_or_no)
    maybe_play_game(yes_or_no)
  end

  def name_response(name) do
    yes_or_no = IO.gets("Nice to meet you #{name}!  Want to play a guessing game?\n ")
    yes_or_no = String.trim(yes_or_no)
    maybe_play_game(yes_or_no)
  end

  # call level 3

  def maybe_play_game("yes") do
    answer = IO.gets("Wonderful!\n Give me 2 more numbers\n")

    number_list =
      String.split(answer, ",")
      |> Enum.map(fn x -> String.trim(x) end)
      |> Enum.map(fn x -> String.to_integer(x) end)

    low = List.first(number_list)
    high = List.last(number_list)
    guess(low, high)
  end

  def maybe_play_game("no") do
    IO.puts("Thanks for coming, goodbye!\n")
  end

  # call level 4

  def guess(low, high) when low > high, do: guess(high, low)

  def guess(low, high) do
    answer = IO.gets("Are you thinking of #{mid(low, high)}\n")
    answer = String.trim(answer)
    response(answer, low, high)
  end

  # call level 5

  def mid(low, high) do
    div(low + high, 2)
  end

  def response("bigger", low, high) do
    bigger(low, high)
  end

  def response("smaller", low, high) do
    smaller(low, high)
  end

  def response("yes", _low, _high) do
    answer = IO.gets("I knew I could guess your number!  Care to play again?\n")
    answer = String.trim(answer)
    maybe_play_game(answer)
  end

  def response(_answer, low, high) do
    answer =
      IO.gets("That was not a correct response, use bigger, smaller, or yes and try again! :)\n")

    answer = String.trim(answer)
    response(answer, low, high)
  end

  # call level 6

  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end
end
