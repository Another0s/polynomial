# Polynomial
-------------------------
 *Simple Elixir module for arithmetic operations with polynomials.*

**Create a polynomial:**
```Elixir
Polynomial.new([1, 2, 3])  # 1 + 2x + 3x^2
```
**Add two polynomial:**
```Elixir
a = Polynomial.new([1, 2, 3])
b = Polynomial.new([4, 5, 6, 7]) 
Polynomial.add(a, b) # Polynomial.new([5, 7, 9, 7])
```

**Raised to the power polynomial:**
```Elixir
a = Polynomial.new([1, 2, 3])
Polynomial.pow(a, 2) # Polynomial.new([0, 0, 1, 2, 3])
```
**Multiply by the number of polynomial:**
```Elixir
a = Polynomial.new([1, 2, 3])
Polynomial.scale(a, 2) # Polynomial.new([2, 4, 6])
```
**Multiply two polynomials:**
```Elixir
a = Polynomial.new([1, 2])
b = Polynomial.new([3, 4])
Polynomial.mul(a, b) # Polynomial.new([3, 10, 8])
```

**TODO: Improve, add new operators.**

