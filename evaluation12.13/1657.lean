example {R : Type*} [CommRing R] {p : ℕ} [Fact (Nat.Prime p)] (pchar : CharP R p) (x y : R) (k : ℕ) : 
    (x + y) ^ (p ^ k) = x ^ (p ^ k) + y ^ (p ^ k) := by
  -- Let's prove this by induction on k
  induction' k with k ih
  
  -- Base case (k = 0)
  · -- In this case p^0 = 1, so it's trivial
    simp
    
  -- Inductive step: assume true for k, prove for k+1
  · -- First convert p^(k+1) to (p^k)^p
    have h1 : p^(k+1) = p^k * p := by
      simp [pow_succ]
    
    -- Rewrite the goal using h1
    rw [h1]
    
    -- Consider (x + y)^(p^(k+1)) = ((x + y)^(p^k))^p
    have h2 : (x + y)^(p^k * p) = ((x + y)^(p^k))^p := by
      -- This follows from power multiplication laws
      sorry

    -- Apply inductive hypothesis inside the p-th power
    have h3 : ((x + y)^(p^k))^p = (x^(p^k) + y^(p^k))^p := by
      -- Use the inductive hypothesis
      rw [ih]

    -- Use the characteristic p property to split the p-th power of sum
    have h4 : (x^(p^k) + y^(p^k))^p = x^(p^k * p) + y^(p^k * p) := by
      -- This uses the fundamental property in characteristic p fields
      sorry

    -- Chain all equalities together
    calc
      (x + y)^(p^k * p) = ((x + y)^(p^k))^p := by exact h2
      _ = (x^(p^k) + y^(p^k))^p := by exact h3
      _ = x^(p^k * p) + y^(p^k * p) := by exact h4