defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> split_on_words
    |> extract_acronym_characters
    |> Enum.join
    |> String.upcase
  end

  defp split_on_words(string) do
    String.split(string, ~r{\W})
  end

  defp extract_acronym_characters(word) do
    Enum.map(word, fn w -> extract_characters(w) end)
  end

  defp extract_characters(word) do
    [ extract_first_character(word) |
      extract_embedded_capital_letters(word) ]
  end

  defp extract_embedded_capital_letters(word) do
    word
    |> String.slice(1..-1)
    |> String.split("", trim: :true)
    |> Enum.filter(fn(letter) -> upper_case?(letter) end)
  end

  defp upper_case?(letter) do
    letter == String.upcase(letter)
  end

  defp extract_first_character(word) do
    String.first(word) || ""
  end
end
