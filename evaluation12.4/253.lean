import Mathlib.RingTheory.Ideal.QuotientOperations
import Mathlib.RingTheory.Localization.Basic
import Mathlib.RingTheory.DedekindDomain.Ideal
import Mathlib.Analysis.Complex.Polynomial
import Mathlib.Data.ZMod.Quotient
import MIL.Common

example {R : Type*} [Ring R] {x y z: R} (h1 : x * y = 1) (h2 : z * x = 1): y = z := by
  -- Focus on z * x = 1, multiply both sides by y
  have ha : z * x * y = y := by
    -- Use z * x = 1 from h2
    rw [h2]
    -- Simplify 1 * y = y
    rw [one_mul]

  -- Use x * y = 1 from h1
  calc z = z * (x * y) := by rw [h1]; rw [mul_one]
    _ = (z * x) * y := by rw [mul_assoc]
    _ = 1 * y := by rw [h2]
    _ = y := by rw [one_mul]
have ha : z * x * y = y := by
  rw [h2]
  rw [one_mul]
calc z = z * (x * y) := by rw [h1]; rw [mul_one]
  _ = (z * x) * y := by rw [mul_assoc]
  _ = 1 * y := by rw [h2]
  _ = y := by rw [one_mul]