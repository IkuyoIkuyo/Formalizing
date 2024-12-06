/-Exercise_6072-/
open Fintype Classical

example {G : Type*} {p : ℕ} [Group G] [Fintype G] [Fact p.Prime] (P : Sylow p G) 
  (pn : P.toSubgroup.Normal) (φ : G ≃* G) : φ '' P.toSubgroup = P.toSubgroup := by
  -- First show that φ(P) is also a p-Sylow subgroup
  let φP : Sylow p G := {
    toSubgroup := φ.toEquiv '' P.toSubgroup
    -- The image is a subgroup because φ is an automorphism
    is_p_group := by
      constructor
      · exact P.is_p_group.1
      · -- Order is preserved under automorphism
        rw [card_image_of_injective φ.toEquiv.injective]
        exact P.is_p_group.2
    -- It's maximal because order is preserved
    is_maximal := by
      intro H hH
      rw [←φ.symm_apply_image P.toSubgroup]
      exact P.is_maximal _ hH
  }
  
  -- Since P is normal, it's the unique p-Sylow subgroup
  -- Therefore φP = P
  exact P.uniqueOfNormal pn φP