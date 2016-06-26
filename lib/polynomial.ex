defmodule Polynomial do

  defstruct coefficients: [0] 

  @doc """
  Create a new polynomial struct
  """
  def new(coefficients) do
    %Polynomial{coefficients: coefficients}
  end

  @doc """
  Sum of two polynomials
  """
  def add(%Polynomial{} = a, %Polynomial{} = b) do
    a.coefficients
      |> Enum.zip(b.coefficients)
      |> Enum.reduce([], fn ({x, y}, acc) -> [x + y | acc] end)
      |> Enum.reverse
      |> Enum.concat(supplement(a.coefficients, b.coefficients))
      |> new
  end

  @doc """
  Sub of two polynomials
  """
  def sub(%Polynomial{} = a, %Polynomial{} = b) do
    b |> scale(-1) |> add(a)
  end

  @doc """
  Multiplied by the number of polynomial
  """
  def scale(%Polynomial{} = a, n) do
    a.coefficients
      |> Enum.map(fn x -> n * x end)
      |> new
  end

  @doc """
  Multiplied by the degree of the polynomial
  """
  def shift(%Polynomial{} = a, n) do
    List.duplicate(0, n)
      |> Enum.concat(a.coefficients)
      |> new
  end

  @doc """
  Multiplication of two polynomials
  """
  def mul(%Polynomial{} = a, %Polynomial{} = b) do
    a.coefficients
      |> Enum.with_index
      |> Enum.reduce(new([0]), fn ({e, i}, acc) -> b |> shift(i) |> scale(e) |> add(acc) end)
  end

  @doc """
  Exponentiation polynomial
  """
  def pow(%Polynomial{} = a, n) do
    (2..n)
      |> Enum.reduce(a, fn (_, acc) -> mul(acc, a) end)
  end

  @doc """
  The degree of the polynomial
  """
  def deg(%Polynomial{} = a) do
    a.coefficients
      |> Enum.reverse
      |> Enum.drop_while(&(&1 == 0))
      |> Enum.count
  end

  defp supplement(a, b) do
    distance = length(a) - length(b)
    if distance > 0, do: take_last(a, distance), else: take_last(b, -distance)
  end

  defp take_last(a, n) do
    Enum.slice(a, length(a) - n, n)
  end
end
