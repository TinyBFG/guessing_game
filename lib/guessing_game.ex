defmodule GuessingGame do
  @moduledoc """
  Documentation for `GuessingGame`.
  """
  # call level 1


  def guess(low, high) do
    answer = IO.gets "Are you thinking of #{mid(low, high)}\n"
    answer = String.trim(answer)
    response(answer, low, high)
  end


  #call level 2


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
    answer = IO.gets "I knew I could guess your number!  Care to play again?\n"
    answer = String.trim(answer)
    maybe_play_again(answer)
  end
  def response(_answer, low, high) do
    answer = IO.gets "That was not a correct response, try again\n"
    answer = String.trim(answer)
    response(answer, low, high)
  end


  #call level 3


  def bigger(low, high) do
    new_low = min(high, mid(low, high) + 1)
    guess(new_low, high)
  end

  def smaller(low, high) do
    new_high = max(low, mid(low, high) - 1)
    guess(low, new_high)
  end

  def maybe_play_again("yes") do
    answer = IO.gets "Wonderful!\n Give me 2 more numbers\n"
    number_list = String.split(answer, ",")
                  |> Enum.map(fn x -> String.trim(x) end)
                  |> Enum.map(fn x -> String.to_integer(x) end)
    low = List.first(number_list)
    high = List.last(number_list)
    guess(low, high)
  end
  def maybe_play_again("no") do
    IO.puts("Thanks for playing, goodbye.\n")
  end
end
