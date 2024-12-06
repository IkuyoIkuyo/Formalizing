open BigOperators
open Finset

example {R : Type*} [hR :CommRing R] (a b: R) {ha :∃ (m :ℕ ) ,a ^ m = 0} {hb :∃ (n :ℕ ) ,b ^ n = 0} : ∃ (k :ℕ ), (a + b) ^ k =0 := by
  -- Extract the exponents m and n from the hypotheses
  obtain ⟨m, hm⟩ := ha
  obtain ⟨n, hn⟩ := hb
  -- We will prove that k = m + n - 1 works
  use m + n - 1
  -- Use binomial theorem to expand (a + b)^(m+n-1)
  have expansion : (a + b) ^ (m + n - 1) = ∑ i in range (m + n), choose (m + n - 1) i * a ^ i * b ^ (m + n - 1 - i) := by
    apply add_pow
  -- Now prove that each term in the sum is zero
  simp only [expansion]
  apply sum_eq_zero
  intro i hi
  -- For each i, either i ≥ m (so a^i = 0) or i < m (so b^(m+n-1-i) = 0)
  by_cases h : i ≥ m
  · -- Case i ≥ m
    rw [pow_eq_zero_of_ge hm h]
    simp
  · -- Case i < m
    have : m + n - 1 - i ≥ n := by
      push_neg at h
      linarith
    rw [pow_eq_zero_of_ge hn this]
    simp