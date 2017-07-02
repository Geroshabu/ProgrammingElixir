defmodule Chop do
  def guess(actual, range) do
    guess_helper(actual, range)
  end

  def guess_helper(actual, first..last) do
    current = div(first + last, 2)
    IO.puts "Is it #{current}"
    guess_judge(actual, current, first..last)
  end

  def guess_judge(actual, current, _) when actual == current do
    IO.puts current
  end

  def guess_judge(actual, current, _..last) when actual > current do
    guess_helper(actual, (current + 1)..last)
  end
  
  def guess_judge(actual, current, first.._) when actual < current do
    guess_helper(actual, first..(current - 1))
  end 
end
