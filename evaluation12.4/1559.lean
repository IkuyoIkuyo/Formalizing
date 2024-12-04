/-Exercise_6072-/
example {G : Type*} {p : ℕ} [Group G] [Fintype G] [Fact p.Prime] (P : Sylow p G) (pn : P.toSubgroup.Normal) (φ : G ≃* G) : φ '' P.toSubgroup = P.toSubgroup := by
  -- First, let's show that P is a characteristic subgroup
  -- We'll use the fact that normal Sylow p-subgroups are characteristic
  have h1 : P.toSubgroup.characteristic := by
    -- Apply the theorem that normal Sylow subgroups are characteristic
    exact Subgroup.normalSylow_characteristic P.toSubgroup P.isSylow pn

  -- Then by definition of characteristic subgroup,
  -- for any automorphism φ, φ(P) = P
  exact h1 φ
  have h1 : P.toSubgroup.characteristic := by
    exact Subgroup.normalSylow_characteristic P.toSubgroup P.isSylow pn
  exact h1 φ