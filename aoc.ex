defmodule Aoc do
  def day1(input) do
    # --- SHARED ---
    choose_number = fn str ->
      String.split(str, "", trim: true)
      |> Enum.filter(fn (ch) -> String.match?(ch, ~r/[0-9]/) end)
    end
    to_int = fn str -> str |> Integer.parse |> elem(0) end
    as_num = fn l -> to_int.(List.first(l)) * 10 + to_int.(List.last(l)) end

    # --- FIRST_PART ---
    first_part = input
    |> String.split
    |> List.foldl(0, fn str, acc ->
      (choose_number.(str) |> as_num.()) + acc
    end)

    # --- SECOND_PART ---
    eng_numbers = ["one", "two", "three", "four", "five", "six", "seven", "eight", "nine"]
    eng_to_int = fn str ->
      Enum.find_index(eng_numbers, fn eng -> str == eng end) + 1
    end
    replace_to_int = fn str ->
      String.replace(str, eng_numbers, fn match ->
        (eng_to_int.(match) |> Integer.to_string) <> String.last(match)
      end)
    end

    second_part = input
    |> String.split
    |> Enum.map(fn str -> str |> replace_to_int.() |> replace_to_int.() end)
    |> List.foldl(0, fn str, acc ->
      (choose_number.(str) |> as_num.()) + acc
    end)

    # --- END ---
    {first_part, second_part}
  end

  def day2(input) do
    # --- SHARED ---
    entries_extract = fn str ->
      str
      |> String.split(",")
      |> Enum.map(fn column ->
        column |> String.split |> List.to_tuple
      end)
      |> Enum.map(fn column ->
        { elem(column, 1), elem(column, 0) |> Integer.parse |> elem(0) }
      end)
      |> Map.new
    end

    # --- FIRST_PART ---
    subject_to = %{"red" => 12, "green" => 13, "blue" => 14}

    get_game_index = fn str ->
      str |> String.replace("Game ", "") |> Integer.parse |> elem(0)
    end
    fit_constraints = fn reveal_list ->
      Enum.all?(reveal_list, fn m ->
        Enum.all?(subject_to, fn {k, v} -> Map.get(m, k, 0) <= v end)
      end)
    end
    game_to_val = fn tup ->
      if fit_constraints.(elem(tup, 1)) do elem(tup, 0)
      else 0
      end
    end

    first_part = input
    |> String.split("\n")
    |> List.pop_at(-1) |> elem(1)
    |> Enum.map(fn i ->
      i
      |> String.split(":") |> List.to_tuple
      |> fn entry ->
        {
          elem(entry, 0) |> get_game_index.(),
          elem(entry, 1) |> String.split(";") |> Enum.map(fn reveal ->
            entries_extract.(reveal)
          end)
        }
        end
      |> game_to_val.()
    end)
    |> Enum.sum

    # --- SECOND_PART ---
    max_of_color = fn list_of_maps, color ->
      list_of_maps
      |> Enum.map(fn j -> Map.get(j, color, 0) end)
      |> Enum.max
    end

    second_part = input
    |> String.split("\n")
    |> List.pop_at(-1) |> elem(1)
    |> Enum.map(fn i ->
      i
      |> String.split(":") |> List.to_tuple
      |> elem(1) |> String.split(";") |> Enum.map(fn reveal ->
        entries_extract.(reveal)
      end)
    end)
    |> Enum.map(fn i ->
      max_of_color.(i, "red") * max_of_color.(i, "green") * max_of_color.(i, "blue")
    end)
    |> Enum.sum

    # --- END ---
    {first_part, second_part}
  end

  def day3(input) do
    # --- SHARED ---

    # --- FIRST_PART ---

    # --- SECOND_PART ---

    # --- END ---
    {first_part, second_part}
  end
end
