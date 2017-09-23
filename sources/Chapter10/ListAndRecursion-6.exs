defmodule MyList do
  def flatten(list), do: _flatten(list, []) |> Enum.reverse

  defp _flatten(num, result) when not is_list(num), do: [num | result]
  defp _flatten([], result), do: result
  defp _flatten([head|tail], result), do: _flatten(tail, _flatten(head, result))
end

      
    
