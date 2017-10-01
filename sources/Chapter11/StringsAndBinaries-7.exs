defmodule FeeCalculator2 do
  import FeeCalculator, only: [append_total_amount: 2]

  def calc_from_file(path) do
    File.stream!(path)
    |> Stream.drop(1)
    |> Stream.map(&String.strip/1)
    |> Stream.map(&parse_line/1)
    |> Enum.to_list
    |> append_total_amount([ NC: 0.075, TX: 0.08 ])
  end

  defp parse_line(<< id::bitstring-size(24), ",:", ship_to::bitstring-size(16), ",", net_amount::bitstring>>) do
    [id: String.to_integer(id), ship_to: String.to_atom(ship_to), net_amount: String.to_float(net_amount)]
  end
end
