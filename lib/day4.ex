defmodule Day4 do
  def task1(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.count(&valid?/1)
  end

  defp valid?(line) do
    list = String.split(line, " ", trim: true)
    set = MapSet.new(list)
    length(list) == MapSet.size(set)
  end

  def task2(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.count(&valid2?/1)
  end

  defp valid2?(line) do
    list = String.split(line, " ", trim: true)

    set =
      list
      |> Enum.map(&(&1 |> :erlang.binary_to_list() |> Enum.sort()))
      |> MapSet.new()

    length(list) == MapSet.size(set)
  end
end
