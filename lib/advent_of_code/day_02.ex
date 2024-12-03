defmodule AdventOfCode.Day02 do
  @spec parse(String.t()) :: list(list(integer))
  def parse(input) do
    input
    |> String.split("\n", trim: true)
    |> Enum.map(fn line ->
      line
      |> String.split()
      |> Enum.map(&String.to_integer/1)
    end)
  end

  @spec part1(list(list(integer))) :: integer
  def part1(reports) do
    reports
    |> Enum.filter(&safe_report/1)
    |> Enum.count()
  end

  @spec safe_report(list(integer)) :: boolean
  defp safe_report(report) do
    differences =
      Enum.chunk_every(report, 2, 1, :discard)
      |> Enum.map(fn [a, b] -> b - a end)

    valid_difference = Enum.all?(differences, &(abs(&1) in 1..3))

    increasing = Enum.all?(differences, &(&1 > 0))
    decreasing = Enum.all?(differences, &(&1 < 0))

    valid_difference and (increasing or decreasing)
  end

  @spec part2(list(list(integer))) :: integer
  def part2(reports) do
    reports
    |> Enum.filter(fn report ->
      combinations = generate_subarrays(report)
      dampening = Enum.any?(combinations, &safe_report/1)

      safe_report(report) or dampening
    end)
    |> Enum.count()
  end

  @spec generate_subarrays(list(integer)) :: list(list(integer))
  defp generate_subarrays(arr) when length(arr) < 2 do
    []
  end

  @spec generate_subarrays(list(integer)) :: list(list(integer))
  defp generate_subarrays(arr) do
    n = length(arr)

    for i <- 0..(n - 1) do
      List.delete_at(arr, i)
    end
  end
end
