defmodule AdventOfCode.Day01Test do
  use ExUnit.Case

  import AdventOfCode.Day01

  setup do
    [
      input: """
      3   4
      4   3
      2   5
      1   3
      3   9
      3   3
      """
    ]
  end

  test "parse", %{input: input} do
    result = parse(input)

    expected = {
      [3, 4, 2, 1, 3, 3],
      [4, 3, 5, 3, 9, 3]
    }

    assert result == expected
  end

  test "part1", %{input: input} do
    result = input |> parse() |> part1()
    expected = 11

    assert result == expected
  end

  test "part2", %{input: input} do
    result = input |> parse() |> part2()
    expected = 31

    assert result == expected
  end

end
