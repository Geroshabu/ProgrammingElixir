defmodule MyString do
  def anagram?(word1, word2), do: _equal?(Enum.sort(word1), Enum.sort(word2))

  defp _equal?([], []), do: true
  defp _equal?([head1|tail1], [head2|tail2]) when head1 == head2, do: _equal?(tail1, tail2)
  defp _equal?(_, _), do: false
end
