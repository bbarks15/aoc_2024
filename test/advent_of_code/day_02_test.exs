defmodule AdventOfCode.Day02Test do
  use ExUnit.Case

  import AdventOfCode.Day02

  setup do
    [
      input: """
      7 6 4 2 1
      1 2 7 8 9
      9 7 6 2 1
      1 3 2 4 5
      8 6 4 4 1
      1 3 6 7 9
      """
    ]
  end

  test "parse", %{input: input} do
    result = parse(input)

    expected = [ [7, 6, 4, 2, 1],
      [1, 2, 7, 8, 9],
      [9, 7, 6, 2, 1],
      [1, 3, 2, 4, 5],
      [8, 6, 4, 4, 1],
      [1, 3, 6, 7, 9]
    ]

    assert result == expected
  end

  test "part1", %{input: input} do
    result = input |> parse() |> part1()
    expected = 2

    assert result == expected
  end

  test "part2", %{input: input} do
    result = input |> parse() |> part2()
    expected = 4

    assert result == expected
  end
end
