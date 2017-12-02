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
    assert Aoc.day1_advanced() == 1188
  end

  test "day2 basic" do
    assert Day2.task1("""
           5 1 9 5
           7 5 3
           2 4 6 8
           """) == 18
  end

  test "day2 advanced" do
    assert Day2.task2("""
           5 9 2 8
           9 4 7 3
           3 8 6 5
           """) == 9
  end

  test "day2 challenge" do
    assert Aoc.day2_basic() == 51833
    assert Aoc.day2_advanced() == 288
  end
end
