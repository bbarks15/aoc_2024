defmodule AdventOfCode.Day03 do
  @spec parse(String.t()) :: String.t()
  def parse(input) do
    input
  end

  @spec part1(String.t()) :: integer()
  def part1(input) do
    Regex.scan(~r{mul\((\d+),(\d+)\)}, input)
    |> Enum.map(fn [_, x, y] ->
      String.to_integer(x) * String.to_integer(y)
    end)
    |> Enum.sum()
  end

  @spec part2(String.t()) :: integer()
  def part2(input) do
    String.split(input, ~r{(don't|do)}, include_captures: true)
    |> Enum.reduce({0, true}, fn
      "don't", {sum, _} -> {sum, false}
      "do", {sum, _} -> {sum, true}
      x, {sum, true} -> {sum + part1(x), true}
      _, acc -> acc
    end)
    |> elem(0)
  end
end
