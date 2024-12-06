**Informal proof:**
Let's prove this by induction on n.

1) Base case (n = 1):
   - When n = 1, m = p
   - In a field of characteristic p, we know that $(a+b)^p = a^p + b^p$ (this is a fundamental property in fields of characteristic p)

2) Inductive step:
   - Assume the statement is true for some k ≥ 1, i.e., $(a+b)^{p^k} = a^{p^k} + b^{p^k}$
   - We need to prove it for k+1, i.e., $(a+b)^{p^{k+1}} = a^{p^{k+1}} + b^{p^{k+1}}$

3) Consider $(a+b)^{p^{k+1}}$:
   - This equals $((a+b)^{p^k})^p$ by laws of exponents
   - By inductive hypothesis, this equals $(a^{p^k} + b^{p^k})^p$
   - Again, by the characteristic p property, this equals $(a^{p^k})^p + (b^{p^k})^p$
   - By laws of exponents, this equals $a^{p^{k+1}} + b^{p^{k+1}}$

4) Therefore, by mathematical induction, $(a+b)^{p^n} = a^{p^n} + b^{p^n}$ holds for all positive integers n.

This proves that for any field F of characteristic p ≠ 0, $(a+b)^m = a^m + b^m$ where m = p^n, for all a, b in F and any positive integer n.