defmodule StringCalculator do
  @operators %{
    ?+ => &+/2,
    ?- => &-/2,
    ?* => &*/2,
    ?/ => &//2
  }

  def calculate(str), do: push(str, [], []) |> pop_and_calc

  defp push([], operator_stack, operand_stack), do: { operator_stack, operand_stack}
  defp push([head|tail], operator_stack, operand_stack) when head == ?\s do
    push(tail, operator_stack, operand_stack)
  end
  defp push(str = [head|_], operator_stack, operand_stack) when head >= ?0 and head <= ?9 do
    push(
      Enum.drop_while(str, &number?/1),
      operator_stack,
      push_operand(Enum.take_while(str, &number?/1), operand_stack)
    )
  end
  defp push([head|tail], operator_stack, operand_stack) do
    push(tail, push_operator(head, operator_stack), operand_stack)
  end

  defp push_operator(operator, stack), do: [@operators[operator] | stack]
  defp push_operand(operand, stack), do: [to_number(operand) | stack]
  
  defp to_number(str), do: _to_number(str, 0)
  defp _to_number([], current), do: current
  defp _to_number([head|tail], current), do: _to_number(tail, current * 10 + (head - ?0))

  defp number?(c), do: c >= ?0 and c <= ?9

  defp pop_and_calc({[], [head|[]]}), do: head
  defp pop_and_calc({[operator1 | tail1], [operand2, operand1 | tail2]}) do
    pop_and_calc({tail1, [operator1.(operand1, operand2)|tail2]})
  end
end
