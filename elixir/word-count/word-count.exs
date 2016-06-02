defmodule Words do
  def count phrase  do
    count_occurs normalize phrase
  end

  defp count_occurs(words), do: _occurs(words, HashDict.new)

  defp _occurs([], totals), do: totals
  defp _occurs([ head | tail ], totals), do: _occurs(tail, Dict.update(totals, head, 1, fn(val) -> val+1 end))

  defp normalize phrase do
    String.downcase(phrase) |> scan_phrase |> List.flatten
  end

  defp scan_phrase phrase do
    Regex.scan %r/\w+/, phrase
  end

end