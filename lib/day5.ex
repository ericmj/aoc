defmodule Day5 do
  def task1(input) do
    input
    |> String.split([" ", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> :array.from_list()
    |> step(0, 0)
  end

  defp step(array, position, count) do
    if position < 0 or position >= :array.size(array) do
      count
    else
      offset = :array.get(position, array)
      array = :array.set(position, offset + 1, array)
      step(array, position + offset, count + 1)
    end
  end

  def task2(input) do
    input
    |> String.split([" ", "\n"], trim: true)
    |> Enum.map(&String.to_integer/1)
    |> :array.from_list()
    |> step2(0, 0)
  end

  defp step2(array, position, count) do
    if position < 0 or position >= :array.size(array) do
      count
    else
      offset = :array.get(position, array)
      new_offset = if offset >= 3, do: offset - 1, else: offset + 1
      array = :array.set(position, new_offset, array)
      step2(array, position + offset, count + 1)
    end
  end
end
