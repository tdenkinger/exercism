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
  def filter(l, f), do: MyFilter.filter(l, f)

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce(l, acc, f), do: MyReduce.reduce(l, acc, f)

  @spec append(list, list) :: list
  def append(a, b), do: MyAppend.append(a, b, [])

  @spec concat([[any]]) :: [any]
  def concat(ll), do: MyConcat.concat(ll, [])
end

defmodule MyConcat do
  def concat([], list),      do: MyReverse.reverse(list)
  def concat([h | t], list), do: concat(t, subconcat(h, list))

  defp subconcat([], list),      do: list
  defp subconcat([h | t], list), do: subconcat(t, [h | list])
end

defmodule MyAppend do
  def append([], [], list),           do: MyReverse.reverse(list)
  def append([h | t], list_b, list),  do: append(t, list_b, [h | list])
  def append([], [h | t], list),      do: append([], t, [h | list])
end

defmodule MyReduce do
  def reduce([], acc, _),        do: acc
  def reduce([h | t], acc, fun), do: reduce(t, apply_reduce(h, fun, acc), fun)

  def apply_reduce(val, fun, acc), do: fun.(val, acc)
end

defmodule MyFilter do
  def filter(list, fun),          do: filter(list, fun, [])
  def filter([h | t], fun, list), do: filter(t, fun, apply_filter(h, fun, list))
  def filter([], _, list),        do: MyReverse.reverse(list)

  def apply_filter(val, fun, list) do
    case fun.(val) do
      true -> [val | list]
      _    -> list
    end
  end
end

defmodule MyMap do
  def map(list, fun),          do: map(list, fun, [])
  def map([h | t], fun, list), do: map(t, fun, [fun.(h) | list])
  def map([], _, list),        do: MyReverse.reverse(list)
end

defmodule MyReverse do
  def reverse(list),          do: reverse(list, [])
  def reverse([h | t], list), do: reverse(t, [h | list])
  def reverse([], list),      do: list
end

defmodule MyCount do
  def count([], acc),      do: acc
  def count([_ | t], acc), do: count(t, acc + 1)
end
