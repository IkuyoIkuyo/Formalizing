example {R : Type*} [CommRing R] {p : ℕ} [Fact (Nat.Prime p)] (pchar : CharP R p) (x y : R) (k : ℕ) : 
  (x + y) ^ (p ^ k) = x ^ (p ^ k) + y ^ (p ^ k) := by
  -- Prove by induction on k
  induction' k with k ih
  -- Base case: k = 0
  · -- p^0 = 1, so this is trivial
    simp
  
  -- Inductive step
  · -- We need to prove for k + 1
    -- First rewrite p^(k+1) as p^k * p
    rw [Nat.pow_succ']
    
    -- Use the fact that (a + b)^(p^(k+1)) = ((a + b)^(p^k))^p
    rw [pow_mul]
    
    -- Apply inductive hypothesis inside the p-th power
    rw [ih]
    
    -- Use Frobenius homomorphism (Freshman's Dream)
    exact frobenius_add R p pchar _ _