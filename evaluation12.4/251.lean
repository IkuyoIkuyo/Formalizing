open BigOperators
open Finset

example {R : Type*} [hR :CommRing R] (a b: R) {ha :∃ (m :ℕ ) ,a ^ m = 0} {hb :∃ (n :ℕ ) ,b ^ n = 0} : ∃ (k :ℕ ), (a + b) ^ k =0 :=by
  --1) Since R is a commutative ring, ab = ba
  have :a * b = b * a :=by
    apply CommMonoid.mul_comm a b
  --2) Since a, b are nilpotent, a^m = b^n = 0
  rcases ha with ⟨ m, hm⟩ 
  rcases hb with ⟨ n, hn⟩ 
  --3) We will prove (a+b)^(m+n) = 0
  use m + n
  rw [add_pow]
  --4) By binomial theorem: (a+b)^(m+n) = ∑(Nat.choose m+n k) * a^k * b^(m+n-k)
  refine sum_eq_zero ?h.h
  --5) We'll prove each term (Nat.choose m+n k) * a^k * b^(m+n-k) = 0
  intro k _
  --6) Case 1: if k ≥ m then a^k = 0 so the term is 0
  by_cases h : k ≥ m
  · have : a ^ k = 0 := by
    { apply pow_eq_zero_of_le h hm }
    simp [this]
  --7) Case 2: if k < m then m+n-k > n so b^(m+n-k) = 0
  · have : m + n - k ≥ n := by
    { simp
      omega }
    have : b ^ (m + n - k) = 0 := by
    { apply pow_eq_zero_of_le this hn }
    simp [this]