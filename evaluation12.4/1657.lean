example {R : Type*} [CommRing R] {p : ℕ} [Fact (Nat.Prime p)] (pchar : CharP R p) (x y : R) (k : ℕ) : 
    (x + y) ^ (p ^ k) = x ^ (p ^ k) + y ^ (p ^ k) := by
  -- We use induction on k
  induction' k with d hd
  
  -- Base case: k = 0
  · -- When k = 0, p^0 = 1
    simp only [pow_zero, pow_one]
    -- Therefore (x + y)^1 = x^1 + y^1
    rfl
  
  -- Inductive step
  · -- We need to prove for d + 1
    -- First, rewrite p^(d+1) as p * p^d
    have h1 : p ^ (d + 1) = p * p ^ d := by 
      simp only [pow_succ]
    
    -- Rewrite the left side using h1
    rw [h1]
    -- Rewrite power of product as nested power
    rw [pow_mul]
    
    -- Apply induction hypothesis to the inner power
    rw [hd]
    
    -- Now we need to show (x^(p^d) + y^(p^d))^p = x^(p^(d+1)) + y^(p^(d+1))
    -- Use the freshman's dream theorem (frobenius endomorphism)
    rw [ring_char_p.frobenius_add pchar]
    
    -- Simplify the powers
    rw [←pow_mul, ←pow_mul]
    -- Rewrite back using h1
    rw [←h1, ←h1]