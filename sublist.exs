defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, b) when a === b, do: :equal
  def compare(a, b) when length(a) > length(b), do: if test_lists(a, b), do: :superlist, else: :unequal
  def compare(a, b) when length(a) < length(b), do: if test_lists(b, a), do: :sublist, else: :unequal
  def compare(_, _), do: :unequal

  defp test_lists([], _), do: false
  defp test_lists(big, little) when length(big) < length(little), do: false
  defp test_lists(big = [_head | tail], little) do
    if little === Enum.slice(big, 0, length(little)) do
      true
    else
      test_lists(tail, little)
    end
  end
end
