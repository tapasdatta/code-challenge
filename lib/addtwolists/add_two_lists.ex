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
    # Recursive function call with initial carry value 0
    add_two_lists([], list_one, list_two, 0)
    |> Enum.reverse()
  end

  # Base case: When both lists and carry are empty/zero
  defp add_two_lists(current_list, [], [], 0), do: current_list

  # Base case: When both lists are empty but there's a carry
  defp add_two_lists(current_list, [], [], carry), do: [carry | current_list]

  # Recursive case: Adding elements from both lists with carry
  defp add_two_lists(current_list, [head_one | tail_one], [head_two | tail_two], carry) do
    sum = head_one + head_two + carry
    new_list = [rem(sum, 10) | current_list]
    add_two_lists(new_list, tail_one, tail_two, div(sum, 10))
  end

  # Recursive case: Adding elements from list_one and carry when list_two is empty
  defp add_two_lists(current_list, [head_one | tail_one], [], carry) do
    sum = head_one + carry
    new_list = [rem(sum, 10) | current_list]
    add_two_lists(new_list, tail_one, [], div(sum, 10))
  end

  # Recursive case: Adding elements from list_two and carry when list_one is empty
  defp add_two_lists(current_list, [], [head_two | tail_two], carry) do
    sum = head_two + carry
    new_list = [rem(sum, 10) | current_list]
    add_two_lists(new_list, [], tail_two, div(sum, 10))
  end
end

# Example usage in IEx
# AddTwoLists.add_two_lists([2, 4, 3], [5, 6, 4])
