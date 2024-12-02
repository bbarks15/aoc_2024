defmodule AdventOfCode.Day01 do
  @spec parse(String.t()) :: {list(integer), list(integer)}
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
      |> List.to_tuple()
    end)
    |> Enum.unzip()
  end

  @spec part1({list(integer), list(integer)}) :: integer
  def part1({left, right}) do
    left
    |> Enum.sort()
    |> Enum.zip(Enum.sort(right))
    |> Enum.reduce(
      0,
      fn {l, r}, acc -> acc + abs(r - l) end
    )
  end

  @spec part2({list(integer), list(integer)}) :: integer
  def part2({left, right}) do
    right_counts = Enum.frequencies(right)

    left
    |> Enum.reduce(
      0,
      fn value, acc ->
        acc + value * Map.get(right_counts, value, 0)
      end
    )
  end
end
