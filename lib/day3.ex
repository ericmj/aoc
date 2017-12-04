defmodule Day3 do
  require Integer

  def task1(input) do
    number = String.to_integer(input)
    {x, y} = step_to(state(), number)
    abs(x) + abs(y)
  end

  defp step_to(%{count: number, position: position}, number) do
    position
  end

  defp step_to(state, number) do
    state
    |> bump_boundaries()
    |> new_direction()
    |> new_position()
    |> bump_count()
    |> step_to(number)
  end

  defp state() do
    %{
      count: 1,
      position: {0, 0},
      boundaries: {0, 0, 0, 0},
      direction: :right
    }
  end

  defp bump_count(state), do: %{state | count: state.count + 1}

  defp new_direction(state) do
    if continue_direction?(state.direction, state.position, state.boundaries) do
      state
    else
      %{state | direction: next_direction(state.direction)}
    end
  end

  defp next_direction(:right), do: :up
  defp next_direction(:up), do: :left
  defp next_direction(:left), do: :down
  defp next_direction(:down), do: :right

  defp continue_direction?(:right, {x, _y}, {_x1, _y1, x2, _y2}), do: x < x2
  defp continue_direction?(:up, {_x, y}, {_x1, y1, _x2, _y2}), do: y > y1
  defp continue_direction?(:left, {x, _y}, {x1, _y1, _x2, _y2}), do: x > x1
  defp continue_direction?(:down, {_x, y}, {_x1, _y1, _x2, y2}), do: y < y2

  defp new_position(state),
    do: %{state | position: next_position(state.direction, state.position)}

  defp next_position(:right, {x, y}), do: {x + 1, y}
  defp next_position(:up, {x, y}), do: {x, y - 1}
  defp next_position(:left, {x, y}), do: {x - 1, y}
  defp next_position(:down, {x, y}), do: {x, y + 1}

  defp bump_boundaries(%{count: count, boundaries: boundaries} = state) do
    if increase_boundaries?(count) do
      %{state | boundaries: increase_boundaries(boundaries)}
    else
      state
    end
  end

  defp increase_boundaries({x1, y1, x2, y2}), do: {x1 - 1, y1 - 1, x2 + 1, y2 + 1}

  defp increase_boundaries?(count) do
    sqrt = :math.sqrt(count)
    int = trunc(sqrt)
    int == sqrt and Integer.is_odd(int)
  end

  def task2(input) do
    number = String.to_integer(input)
    step_to2(state2(), number)
  end

  defp step_to2(%{value: value}, number) when value > number do
    value
  end

  defp step_to2(state, number) do
    state
    |> bump_boundaries()
    |> new_direction()
    |> new_position()
    |> bump_count()
    |> new_value()
    |> store_position()
    |> step_to2(number)
  end

  defp state2() do
    %{
      value: 1,
      count: 1,
      position: {0, 0},
      boundaries: {0, 0, 0, 0},
      direction: :right,
      board: %{{0, 0} => 1}
    }
  end

  defp store_position(state) do
    put_in(state.board[state.position], state.value)
  end

  defp new_value(state) do
    %{state | value: calc_value(state)}
  end

  @adjacent_positions [{1, 0}, {1, -1}, {0, -1}, {-1, -1}, {-1, 0}, {-1, 1}, {0, 1}, {1, 1}]

  defp calc_value(%{board: board, position: {x1, y1}}) do
    Enum.reduce(@adjacent_positions, 0, fn {x2, y2}, value ->
      value + Map.get(board, {x1 + x2, y1 + y2}, 0)
    end)
  end
end
