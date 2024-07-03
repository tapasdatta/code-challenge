defmodule AddTwoLinkedLists do
  @moduledoc """
  A module for adding two lists of numbers element-wise.
  """

  @doc """
  Adds two linked lists of single-digit integers, considering carry-forward values, and returns the sum as a linked list.

  ## Parameters
    - l1: The first linked list of single-digit integers in reverse order.
    - l2: The second linked list of single-digit integers in reverse order.

  ## Examples

      iex> l1 = %ListNode{value: 2, next: %ListNode{value: 4, next: %ListNode{value: 3, next: nil}}}
      iex> l2 = %ListNode{value: 5, next: %ListNode{value: 6, next: %ListNode{value: 4, next: nil}}}
      iex> AddTwoNumbers.add_two_numbers(l1, l2)
      %ListNode{value: 7, next: %ListNode{value: 0, next: %ListNode{value: 8, next: nil}}}

      iex> l1 = %ListNode{value: 9, next: %ListNode{value: 9, next: %ListNode{value: 9, next: nil}}}
      iex> l2 = %ListNode{value: 1, next: nil}
      iex> AddTwoNumbers.add_two_numbers(l1, l2)
      %ListNode{value: 0, next: %ListNode{value: 0, next: %ListNode{value: 0, next: %ListNode{value: 1, next: nil}}}}
  """

  alias ListNode

  def add_two_numbers(l1, l2) do
    add_two_numbers(l1, l2, 0)
  end

  defp add_two_numbers(nil, nil, 0) do
    nil
  end

  defp add_two_numbers(nil, nil, carry) do
    %ListNode{value: carry, next: nil}
  end

  defp add_two_numbers(l1, nil, carry) do
    sum = l1.value + carry
    %ListNode{value: rem(sum, 10), next: add_two_numbers(l1.next, nil, div(sum, 10))}
  end

  defp add_two_numbers(nil, l2, carry) do
    sum = l2.value + carry
    %ListNode{value: rem(sum, 10), next: add_two_numbers(nil, l2.next, div(sum, 10))}
  end

  defp add_two_numbers(l1, l2, carry) do
    sum = l1.value + l2.value + carry
    %ListNode{value: rem(sum, 10), next: add_two_numbers(l1.next, l2.next, div(sum, 10))}
  end
end

# Example usage:
# Construct linked lists for numbers 342 and 465 (representing as [2, 4, 3] and [5, 6, 4] in reverse)
l1 = %ListNode{value: 2, next: %ListNode{value: 4, next: %ListNode{value: 3, next: nil}}}
l2 = %ListNode{value: 5, next: %ListNode{value: 6, next: %ListNode{value: 4, next: nil}}}

# Calculate the sum of the two numbers represented by linked lists
result = AddTwoLinkedLists.add_two_numbers(l1, l2)

# Print the result (should be [7, 0, 8] representing 807)
IO.inspect(result)
