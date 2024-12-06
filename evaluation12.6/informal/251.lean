**Informal proof:**
Let me prove this step by step.

1) Since a and b are nilpotent, there exist positive integers m and n such that a^m = 0 and b^n = 0.

2) Consider (a + b)^k where k = m + n - 1.

3) By the binomial theorem, we can expand (a + b)^k as:
   (a + b)^k = Σ(i=0 to k) C(k,i) * a^i * b^(k-i)
   where C(k,i) represents the binomial coefficient.

4) In each term C(k,i) * a^i * b^(k-i) of this sum:
   - If i ≥ m, then a^i = 0 (since a^m = 0)
   - If k-i ≥ n, then b^(k-i) = 0 (since b^n = 0)

5) For any i in the sum, either:
   - i ≥ m, or
   - i < m, which means k-i = (m+n-1)-i ≥ n
   Because if i < m, then k-i = (m+n-1)-i > n-1, so k-i ≥ n

6) Therefore, every term in the expansion is zero, making (a + b)^k = 0.

7) Thus, a + b is nilpotent with nilpotency degree at most m + n - 1.

Therefore, we have proven that the sum of two nilpotent elements in a commutative ring is nilpotent.