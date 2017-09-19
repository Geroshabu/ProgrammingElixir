defmodule MyList do
  def caesar([], _), do: []
  def caesar([head|tail], n) do
    [lotate_if_need(head+n) | caesar(tail, n)]
  end

  @alphabet_num 26
  defp lotate_if_need(n) when [n] > 'z', do: lotate n
  defp lotate_if_need(n) when [n] >= 'a', do: n
  defp lotate(n), do: n - @alphabet_num
end
