defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: MyCount.count(l, 0)

  @spec reverse(list) :: list
  def reverse(l), do: MyReverse.reverse(l)

  @spec map(list, (any -> any)) :: list
  def map(l, f), do: MyMap.map(l, f)

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter(l, f) do

  end

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f) do

  end

  @spec append(list, list) :: list
  def append(a, b) do

  end

  @spec concat([[any]]) :: [any]
  def concat(ll) do

  end
end

defmodule MyMap do
  def map([], _), do: []
  def map(list, fun), do: map(list, fun, [])
  def map([h | t], fun, list), do: map(t, fun, [fun.(h) | list])
  def map([], _, list), do: MyReverse.reverse(list)
end

defmodule MyReverse do
  def reverse([]),            do: []
  def reverse(list),          do: reverse(list, [])
  def reverse([h | t], list), do: reverse(t, [h | list])
  def reverse([], list),      do: list
end

defmodule MyCount do
  def count([], acc),      do: acc
  def count([h | t], acc), do: count(t, acc + 1)
end
