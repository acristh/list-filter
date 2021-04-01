defmodule ListFilter do
  def call(list), do: filter(list, 0)

  defp check_integer(value) when value == :error, do: 0

  defp check_integer(value) do
    {number, _remainder} = value
    number
  end

  defp filter([], accumulator), do: accumulator

  defp filter([head | tail], accumulator) do
    result =
      head
      |> Integer.parse()
      |> check_integer()
      |> rem(2)
    accumulator = accumulator + result
    filter(tail, accumulator)
  end
end