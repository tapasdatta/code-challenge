defmodule ListNode do
  @moduledoc """
  A module representing a single node in a singly linked list.

  Each node contains a value and a reference to the next node in the list. This is used to represent numbers where each node
  holds a single digit, and the digits are stored in reverse order.

  ## Attributes

    - value: The integer value held by the node (typically a single digit).
    - next: A reference to the next node in the list or `nil` if it is the last node.

  ## Examples

      iex> node1 = %ListNode{value: 2, next: nil}
      iex> node2 = %ListNode{value: 4, next: node1}
      iex> node3 = %ListNode{value: 3, next: node2}
  """

  defstruct value: nil, next: nil
end
