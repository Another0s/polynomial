# Polynomial

 *Simple Elixir module for arithmetic operations with polynomials.*

**Create a polynomial:**
```Elixir
Polynomial.new([1, 2, 3])  # 1 + 2x + 3x^2
```
**Add of two polynomial:**
```Elixir
a = Polynomial.new([1, 2, 3])
b = Polynomial.new([4, 5, 6, 7]) 
Polynomial.add(a, b) # Polynomial.new([5, 7, 9, 7])
```
**Sub of two polynomial:**
```Elixir
a = Polynomial.new([4, 5, 6, 7])
b = Polynomial.new([1, 2, 3])
assert Polynomial.sub(a, b) == Polynomial.new([3, 3, 3, 7])
```

**Multiply by the degree of the polynomial:**
```Elixir
a = Polynomial.new([1, 2, 3])
Polynomial.shift(a, 2) # Polynomial.new([0, 0, 1, 2, 3])
```
**Multiply by the number of polynomial:**
```Elixir
a = Polynomial.new([1, 2, 3])
Polynomial.scale(a, 2) # Polynomial.new([2, 4, 6])
```
**Multiply of two polynomials:**
```Elixir
a = Polynomial.new([1, 2])
b = Polynomial.new([3, 4])
Polynomial.mul(a, b) # Polynomial.new([3, 10, 8])
```

**Exponentiation polynomial:**
```Elixir
a = Polynomial.new([1, 2, 3])
Polynomial.pow(a, 2) # Polynomial.new([1, 4, 10, 12, 9])
```
**The degree of the polynomial:**
```Elixir
a = Polynomial.new([1, 2, 3, 0])
Polynomial.deg(a) # 3
```
**TODO:** Improve, add new operators.

