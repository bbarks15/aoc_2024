defmodule AdventOfCode.Day03Test do
  use ExUnit.Case

  import AdventOfCode.Day03

  setup do
    [
      input: "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"
    ]
  end

  test "parse", %{input: input} do
    result = parse(input)

    expected = "xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5))"

    assert result == expected
  end

  test "part1", %{input: input} do
    result = input |> parse() |> part1()
    expected = 161

    assert result == expected
  end

  #
  test "part2" do
    input = "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"
    result = input |> parse() |> part2()
    expected = 48

    assert result == expected
  end
end
