function = fn
  0, 0, _ -> "FizzBuzz"
  0, _, _ -> "Fizz"
  _, 0, _ -> "Buzz"
  _, _, x -> x
end

fizz_buzz_test = fn
  n -> function.(rem(n, 3), rem(n, 5), n)
end

IO.puts fizz_buzz_test.(10)
IO.puts fizz_buzz_test.(11)
IO.puts fizz_buzz_test.(12)
IO.puts fizz_buzz_test.(13)
IO.puts fizz_buzz_test.(14)
IO.puts fizz_buzz_test.(15)
IO.puts fizz_buzz_test.(16)
