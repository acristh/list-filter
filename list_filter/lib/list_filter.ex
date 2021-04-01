defmodule ListFilter do
  import Integer
  def call(list) do
    list
    |> Enum.filter(fn str -> String.match?(str, ~r/[0-9]+/) end)
    |> Enum.map(fn value -> parse_value(value) end)
    |> Enum.count(&is_odd/1)
  end

  defp parse_value(line) do
    line
    |> String.to_integer()
  end
end

defmodule ListFilter2 do 
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


defmodule ListFilter3 do
  def call(list) do
    Enum.count(list, fn x -> Integer.parse(x) |> is_odd() end)
  end

  defp is_odd({ number, _ }), do: rem(number, 2) !== 0

  defp is_odd(:error), do: false

  defp filter_integers(list) do
    
  end

end
