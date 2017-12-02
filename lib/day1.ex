defmodule Day1 do
  def task1(input) do
    list = input |> :erlang.binary_to_list() |> Enum.map(&(&1 - ?0))
    list = list ++ [hd(list)]
    sum_task1(list, 0)
  end

  defp sum_task1([x, x | rest], acc), do: sum_task1([x | rest], acc + x)
  defp sum_task1([_x, y | rest], acc), do: sum_task1([y | rest], acc)
  defp sum_task1([_], acc), do: acc

  def task2(input) do
    input
    |> :erlang.binary_to_list()
    |> Enum.map(&(&1 - ?0))
    |> :array.from_list()
    |> sum_task2()
  end

  defp sum_task2(array) do
    size = :array.size(array)

    Enum.reduce(0..(size - 1), 0, fn index, acc ->
      first = :array.get(index, array)
      second_index = rem(index + div(size, 2), size)
      second = :array.get(second_index, array)

      if first == second do
        acc + first
      else
        acc
      end
    end)
  end
end
