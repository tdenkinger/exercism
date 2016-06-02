defmodule RunLengthEncoder do
  @doc """
  Generates a string where consecutive elements are represented as a data value and count.
  "HORSE" => "1H1O1R1S1E"
  For this example, assume all input are strings, that are all uppercase letters.
  It should also be able to reconstruct the data into its original form.
  "1H1O1R1S1E" => "HORSE"
  """
  @spec encode(String.t) :: String.t
  def encode(""), do: ""

  @spec encode(String.t) :: String.t
  def encode(string) do
    Encode.run(string)
  end

  @spec decode(String.t) :: String.t
  def decode(string) do
    Decode.run(string)
  end

end

defmodule Decode do
  def run(string) do
    string
    |> extract_runs
    |> compile_runs
  end

  defp extract_runs(encoded_string) do
    Regex.scan(~r{((\d+)(\w))}, encoded_string)
  end

  defp compile_runs(runs) do
    runs
    |> Enum.map(fn(run) -> decode_run(run) end)
    |> to_string
  end

  defp decode_run([_, _, count, character]) do
    String.duplicate(character, String.to_integer(count))
  end
end

defmodule Encode do
  def run(string) do
    string
    |> extract_runs
    |> compile_runs
  end

  defp extract_runs(string) do
    Regex.scan(~r{((.)\2*)}, string)
  end

  defp compile_runs(runs) do
    runs
    |> Enum.map(fn(x) -> run_length(x) <> run_value(x) end)
    |> to_string
  end

  defp run_length([run, _, _]) do
    String.length(run)
    |> to_string
  end

  defp run_value([_, _, run_letter]) do
    run_letter
  end
end
