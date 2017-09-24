defmodule MyList2 do
  import MyList, only: [span: 2]

  def prime(n) when n >= 2 do
    divs = for x <- span(2, n), y <- span(2, x), rem(x, y) == 0, do: x
    for x <- divs, Enum.count(divs, fn y -> y == x end) == 1, do: x
  end
end
