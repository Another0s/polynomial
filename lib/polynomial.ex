defmodule Polynomial do

  defstruct coefficients: [0] 

  def new(coefficients) do
    %Polynomial{coefficients: coefficients}
  end

  def add(%Polynomial{} = a, %Polynomial{} = b) do
    a.coefficients
      |> Enum.zip(b.coefficients)
      |> Enum.reduce([], fn ({x, y}, acc) -> [x + y | acc] end)
      |> Enum.reverse
      |> Enum.concat(supplement(a.coefficients, b.coefficients))
      |> new
  end

  def scale(%Polynomial{} = a, n) do
    a.coefficients
      |> Enum.map(fn x -> n * x end)
      |> new
  end

  def pow(%Polynomial{} = a, n) do
    List.duplicate(0, n)
      |> Enum.concat(a.coefficients)
      |> new
  end

  def mul(%Polynomial{} = a, %Polynomial{} = b) do
    a.coefficients
      |> Enum.with_index
      |> Enum.reduce(new([0]), fn ({e, i}, acc) -> b |> pow(i) |> scale(e) |> add(acc) end)
  end

  defp supplement(a, b) do
    distance = length(a) - length(b)
    if distance > 0, do: take_last(a, distance), else: take_last(b, -distance)
  end

  defp take_last(a, n) do
    Enum.slice(a, length(a) - n, n)
  end
end
