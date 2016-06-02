defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t, [String.t]) :: [String.t]
  def match(base, candidates) do
    matches = []
    base_letters = String.split(base, "", trim: true) |> Enum.sort
    Enum.each(candidates, fn(c) ->
      candidate_letters = String.split(c, "", trim: true) |> Enum.sort
      if candidate_letters == base_letters do
        matches = Enum.into(matches, c)
      end
    end)

    matches
  end
end
