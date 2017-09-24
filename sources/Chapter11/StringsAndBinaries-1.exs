defmodule MyString do
  def is_printable(str), do: Enum.all?(str, fn c -> c >= ?\s and c <= ?~ end)
end
