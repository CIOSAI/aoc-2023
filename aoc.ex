defmodule Aoc.Day1 do
  def first_part(input) do
    choose_number = fn str ->
      String.split(str, "", trim: true)
      |> Enum.filter(fn (ch) -> String.match?(ch, ~r/[0-9]/) end)
    end
    to_int = fn str -> str |> Integer.parse |> elem(0) end
    as_num = fn l -> to_int.(List.first(l)) * 10 + to_int.(List.last(l)) end

    input
    |> String.split
    |> List.foldl(0, fn str, acc ->
      (choose_number.(str) |> as_num.()) + acc
    end)
  end

  def second_part(input) do
    choose_number = fn str ->
      String.split(str, "", trim: true)
      |> Enum.filter(fn (ch) -> String.match?(ch, ~r/[0-9]/) end)
    end
    to_int = fn str -> str |> Integer.parse |> elem(0) end
    as_num = fn l -> to_int.(List.first(l)) * 10 + to_int.(List.last(l)) end

    # addition
    eng_numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    eng_to_int = fn str ->
      Enum.find_index(eng_numbers, fn eng -> str == eng end) + 1
    end
    replace_to_int = fn str ->
      String.replace(str, eng_numbers, fn match ->
        (eng_to_int.(match) |> Integer.to_string) <> String.last(match)
      end)
    end
    # addition

    input
    |> String.split
    # addition
    |> Enum.map(fn str -> str |> replace_to_int.() |> replace_to_int.() end)
    # addition
    |> List.foldl(0, fn str, acc ->
      (choose_number.(str) |> as_num.()) + acc
    end)
  end
end
