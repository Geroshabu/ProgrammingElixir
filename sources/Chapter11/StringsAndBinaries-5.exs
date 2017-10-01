defmodule MyString do
  def centering(list) do
    max = list
    |> Enum.map(&String.length/1)
    |> Enum.max

    list
    |> Stream.map(&({&1, String.length(&1)}))
    |> Stream.map(fn {value, len} -> {value, len + div((max - len), 2)} end)
    |> Stream.map(fn {value, len} -> String.rjust(value, len) end)
    |> Enum.each(&IO.puts/1)
  end
end

