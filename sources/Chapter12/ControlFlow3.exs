defmodule ControlFlow do
  def ok!(tuple) do
    case tuple do
      {:ok, data} -> data
      _ -> raise RuntimeError
    end
  end

  def execute(filename) do
    file = ok! File.open(filename)
    IO.puts "#{IO.read(file, :line)}"
  end
end

ControlFlow.execute "ControlFlow3.exs"
ControlFlow.execute "NotExists.txt"

