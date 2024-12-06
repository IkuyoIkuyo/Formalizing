**Informal proof:**
Let me provide a clear proof by contradiction that an algebraically closed field must be infinite.

1) Assume, for the sake of contradiction, that F is a finite algebraically closed field.

2) Since F is finite, it has a finite number of elements, say n elements.

3) Consider the polynomial p(x) = ∑(i from 0 to n) x^i = x^n + x^(n-1) + ... + x + 1 in F[x].

4) As F is algebraically closed, p(x) must have a root in F, let's call it a.

5) This means p(a) = a^n + a^(n-1) + ... + a + 1 = 0

6) Now, since F is finite with n elements, by Lagrange's theorem:
   - For any nonzero element a in F, we have a^n = a
   - This is because the multiplicative group of nonzero elements in F has order n-1 or less

7) Therefore, for any a ≠ 0 in F:
   p(a) = a^n + a^(n-1) + ... + a + 1
   = a + a + ... + a + 1 (n+1 terms)
   = (n+1)⋅1 = 1 ≠ 0

8) And if a = 0:
   p(0) = 0^n + 0^(n-1) + ... + 0 + 1 = 1 ≠ 0

9) This contradicts the fact that p(x) must have a root in F.

Therefore, our assumption that F is finite must be false. Thus, an algebraically closed field must be infinite.

The key insight of this proof is constructing a polynomial that would have no roots in a finite field, which contradicts the definition of algebraic closure.