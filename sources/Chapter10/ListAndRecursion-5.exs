defmodule MyList do
  def all?(enumerable, fun \\ fn x -> x end), do: _all?(enumerable, fun) == true
  defp _all?([], _), do: true
  defp _all?([head|tail], fun), do: fun.(head) && all?(tail, fun)

  def each([], _), do: :ok
  def each([head|tail], fun) do
    fun.(head)
    each(tail, fun)
  end

  def filter([], _), do: []
  def filter([head|tail], fun) do
    if fun.(head) do
      [head | filter(tail, fun)]
    else
      filter(tail, fun)
    end
  end

  def split(enumerable, count) when count >= 0, do: [take(enumerable, count), drop(enumerable, count)]
  def split(enumerable, count), do: [drop(enumerable, count), take(enumerable, count)]

  defp _reverse([]), do: []
  defp _reverse([head|tail]), do: _reverse(tail) ++ [head]

  def take(enumerable, count) when count >= 0, do: _take(enumerable, count)
  def take(enumerable, count), do: _reverse(enumerable) |> _take(-1*count) |> _reverse
  defp _take([], _), do: []
  defp _take(_, count) when count <= 0, do: []
  defp _take([head|tail], count), do: [head | _take(tail, count-1)]

  def drop(enumerable, count) when count >= 0, do: _drop(enumerable, count)
  def drop(enumerable, count), do: _reverse(enumerable) |> _drop(-1*count) |> _reverse
  defp _drop([], _), do: []
  defp _drop(enumerable, count) when count <= 0, do: enumerable
  defp _drop([_|tail], count), do: _drop(tail, count-1)
end
