function = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, x -> x
end

IO.puts function.(0, 0, 0)    # => FizzBuzz
IO.puts function.(42, 0, 0)   # => Buzz
IO.puts function.(0, 42, 0)   # => Fizz
IO.puts function.(0, 0, 42)   # => FizzBuzz
IO.puts function.(42, 43, 0)  # => 0
IO.puts function.(42, 0, 43)  # => Buzz
IO.puts function.(0, 42, 43)  # => Fizz
IO.puts function.(42, 43, 44) # => 44
