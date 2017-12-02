defmodule AocTest do
  use ExUnit.Case

  test "day1 basic" do
    assert Day1.task1("1122") == 3
    assert Day1.task1("1111") == 4
    assert Day1.task1("91212129") == 9
  end

  test "day1 advanced" do
    assert Day1.task2("1212") == 6
    assert Day1.task2("1221") == 0
    assert Day1.task2("123425") == 4
    assert Day1.task2("123123") == 12
    assert Day1.task2("12131415") == 4
  end

  test "day1 challenge" do
    assert Aoc.day1_basic() == 1097
  end
end
