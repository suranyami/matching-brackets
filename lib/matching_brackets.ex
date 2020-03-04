defmodule MatchingBrackets do

  @doc """
  Checks that all the brackets and braces in the string are matched correctly, and nested correctly
  """
  @spec check_brackets(String.t()) :: boolean
  def check_brackets(""), do: true

  def check_brackets(str) do
    str
    |> String.to_charlist()
    |> balanced()
  end
  def balanced(''), do: true
  def balanced([]), do: true
  def balanced([?{ | tail]), do: balanced(tail) && closes_with(tail, ?})
  def balanced([?[ | tail]), do: balanced(tail) && closes_with(tail, ?])
  def balanced([?( | tail]), do: balanced(tail) && closes_with(tail, ?))
  def balanced(_), do: true

  def closes_with(str, close_char) do
    balanced(str) &&
    str
    |> String.reverse()
    |> closes_with(close_char)
  end

  def closes_with([?]], ?]), do: true
  def closes_with([?}], ?}), do: true
  def closes_with([?)], ?)), do: true

  def closes_with([?] | _], ?]), do: true
  def closes_with([?} | _], ?}), do: true
  def closes_with([?) | _], ?)), do: true
end
