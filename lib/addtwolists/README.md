# AddTwoLists

This Elixir module provides functionality to add two non-negative integers represented as linked lists, where the digits are stored in reverse order. Each node of the linked list contains a single digit. The sum is returned as a linked list in the same reverse order.

## Usage

### Example

Suppose you have two numbers represented by the following lists:

- 342 is represented as `[2, 4, 3]`
- 465 is represented as `[5, 6, 4]`

Adding these two numbers should yield 807, which will be represented as `[7, 0, 8]`.

### Code

Here's how you can use the `AddTwoLists` module:

```elixir
defmodule ListNode do
  defstruct value: nil, next: nil
end

defmodule AddTwoLists do
  @moduledoc """
  Provides functionality to add two lists of single-digit integers where the digits are stored in reverse order.
  Each list represents a non-negative integer. The sum is returned as a new list in the same reverse order.
  """

  @doc """
  Adds two lists of single-digit integers, considering carry-forward values, and returns the sum as a list.

  ## Parameters
    - list_one: The first list of single-digit integers in reverse order.
    - list_two: The second list of single-digit integers in reverse order.

  ## Examples

      iex> AddTwoLists.add_two_lists([2, 4, 3], [5, 6, 4])
      [7, 0, 8]

      iex> AddTwoLists.add_two_lists([9, 9, 9], [1])
      [0, 0, 0, 1]

  """
  def add_two_lists(list_one, list_two) do
    add_two_lists([], list_one, list_two, 0)
    |> Enum.reverse()
  end

  defp add_two_lists(current_list, [], [], 0), do: current_list

  defp add_two_lists(current_list, [], [], carry), do: [carry | current_list]

  defp add_two_lists(current_list, [head_one | tail_one], [head_two | tail_two], carry) do
    sum = head_one + head_two + carry
    new_list = [rem(sum, 10) | current_list]
    add_two_lists(new_list, tail_one, tail_two, div(sum, 10))
  end

  defp add_two_lists(current_list, [head_one | tail_one], [], carry) do
    sum = head_one + carry
    new_list = [rem(sum, 10) | current_list]
    add_two_lists(new_list, tail_one, [], div(sum, 10))
  end

  defp add_two_lists(current_list, [], [head_two | tail_two], carry) do
    sum = head_two + carry
    new_list = [rem(sum, 10) | current_list]
    add_two_lists(new_list, [], tail_two, div(sum, 10))
  end
end

# Example usage in IEx
# AddTwoLists.add_two_lists([2, 4, 3], [5, 6, 4])
```
