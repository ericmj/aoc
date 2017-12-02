defmodule Day2 do
  def task1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_row/1)
    |> Enum.map(&row_diff/1)
    |> Enum.sum()
  end

  defp parse_row(line) do
    line
    |> String.split([" ", "\t"], trim: true)
    |> Enum.map(&String.to_integer/1)
  end

  defp row_diff(numbers) do
    {min, max} = Enum.min_max(numbers)
    max - min
  end

  def task2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(&parse_row/1)
    |> Enum.map(&divider/1)
    |> Enum.sum()
  end

  defp divider(numbers) do
    [divider, divider] =
      for x <- numbers,
          y <- numbers,
          x != y,
          max = max(x, y),
          min = min(x, y),
          div = div(max, min),
          div * min == max do
        div
      end

    divider
  end
end
