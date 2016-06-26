defmodule PolynomialTest do
  use ExUnit.Case
  doctest Polynomial

  test "Create new Polynomial" do
    coeffs = [1, 2, 3]
    assert Polynomial.new(coeffs) == %Polynomial{coefficients: coeffs}
  end

  test "Sum of two Polynomials" do
    a = Polynomial.new([1, 2, 3])
    b = Polynomial.new([4, 5, 6, 7])
    assert Polynomial.add(a, b) == Polynomial.new([5, 7, 9, 7])
  end

  test "Scale Polynomial" do
    a = Polynomial.new([1, 2, 3])
    assert Polynomial.scale(a, 2) == Polynomial.new([2, 4, 6])
  end

  test "Pow Polynomial" do
    a = Polynomial.new([1, 2, 3])
    assert Polynomial.pow(a, 2) == Polynomial.mul(a, a)
  end

  test "Mul two Polynomials" do
    a = Polynomial.new([1, 2])
    b = Polynomial.new([3, 4])
    assert Polynomial.mul(a, b) == Polynomial.new([3, 10, 8])
  end

  test "Deg of Polynomial" do
    a = Polynomial.new([0, 1, 2, 3, 0])
    assert Polynomial.deg(a) == 4
  end

  test "Sub two Polynomials" do
    a = Polynomial.new([4, 5, 6, 7])
    b = Polynomial.new([1, 2, 3])
    assert Polynomial.sub(a, b) == Polynomial.new([3, 3, 3, 7])
  end
end
