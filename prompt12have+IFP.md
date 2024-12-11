# Prompt for algebra translator

Suppose you are an expert mathematician and an expert in Lean4 and Mathlib.

Your task is to generate a formal proof sketch in Lean4 to prove the given formal theorem in Lean4 step by step using the help of natrual language proofs. You must use Lean4. You must translate subgoals inside the informal proof into `have` or `let` declarations in the formal proof. You can fill the proof of the `have` subgoals using `sorry`. You will be provided with auxiliary information to improve the generation. Make sure you follow the principles of formal proving when you generate formal proofs.

## Auxiliary Helpful Information

There are three parts of information to assist in improving the generation.

* The formal theorem, which is the goal of the entire proof. It is written in Lean.
* The informal theorem. It is the explanation of the formal theorem in natural language.
* The informal proof. It is the proof of the theorem in natural language.

## Principles of Formal Proofs

1. You should write a step of informal proof written in natural language, then write a step of formal proof wriiten in Lean4 corresponding to the informal guidance above.
  Example:
  DO NOT write
  ```lean
    have h1 : a * b * a = b * a⁻¹ * a := by exact mul_right_cancel_iff.mpr h
    rw [inv_mul_cancel_right] at h1
  ```
  Write
  ```lean
    -- introduce a new hypothesis h1 by multiply a on both sides
    have h1 : a * b * a = b * a⁻¹ * a := by exact mul_right_cancel_iff.mpr h
    -- then simplify h1
    rw [inv_mul_cancel_right] at h1
  ``` instead.

2. Using the guidance of informal proof, leave the `sorry` as small as possible. You may write some tactic before `sorry`. Make sure your non-`sorry` tactics works.
  Example:
  DO NOT write 
  ```lean
  -- Multiply by \(a\) on the right hand side of \(a * b = b * a^{-1}\) to get \(a * b * a = b * a^{-1} * a = b\).
  have h1 : a * b * a = b := by sorry
  ```
  Write
  ```lean
  -- Multiply by \(a\) on the right hand side of \(a * b = b * a^{-1}\) to get \(a * b * a = b * a^{-1} * a = b\).
  have h1 : a * b * a = b := by
    calc
      a * b * a = b * a⁻¹ * a := by sorry
      _ = b := by sorry
  ```
  instead.

3. If you need to use theorems that you are not completly sure about its formal name, leave the relevant tactic as `sorry`, write down comments suggest the meaning of the theorem you are searching for.
  Example:
  DO NOT guess the theorem name `Sylow.is_p_group` that does not exist and write
  ```lean
  -- this is because the sylow subgroup P is a p-group thus every element g in P has order p^n
  exact Sylow.is_p_group P g
  ```
  Write
  ```lean
  -- this is because the sylow subgroup P is a p-group thus every element g in P has order p^n
  sorry
  ```
  instead.

4. Be careful about direction of the equations, direction of theorems and type differences that is ignored in natural language. Make sure in the formal proof, there are extra steps for these direction changes or coercions. 
  Example:
  a. If the goal is "a = b", DO NOT write 
  ```lean
  calc
    b = foo := by sorry
    _ = a := by sorry
  ```
  add a tactic `symm` or reverse the order of the chain equality.

  b. The type of `g^2` and `g * g` are different in Lean. use `rw` to convert between them, even it is not written in natural language proof.


5. Only the small proofs (e.g. in `have`, `suffices`) can use `sorry`. DO NOT use `sorry` inside `let` or anywhere to omit data. DO NOT use `sorry` in the statements of `have`. You may add additional `have`s if the there are some proof needed in other tactics.
  Example:
  DO NOT write
  ```
  let N : Subgroup G := sorry
  ```
  You must fill in all necessary data for structures.


6. Make sure you copy the formal statement exactly in your output, including imports. You may add `open SomeNamespace` before the statement, DO NOT add any imports.

**Warning: The following examples are only used to demonstrate the format; their exact meaning is irrelevant.**

## Input1:

**Informal theorem:**
Suppose that $G$ is a group and $a, b \\in G$ satisfy $a * b=b * a^{-1}$ where as usual, $a^{-1}$ is the inverse for $a$. Prove that $b * a=a^{-1} * b$.

**Informal proof:**
(1) Multiply by \(a\) on the right hand side of \(a * b = b * a^{-1}\) to get \(a * b * a = b * a^{-1} * a = b\).

(2) Multiply by \(a^{-1}\) on the left hand side of the previous equation \(a * b * a = b\) to get \(a^{-1} * (a * b * a) = a^{-1} * b\). Simplify it we get the final result \(b * a = a^{-1} * b\).

**Formal theorem:**
import Mathlib

theorem exercise_mul_eq_inv_mul {G : Type*} [Group G] (a b : G) (h : a * b = b * a⁻¹) : b * a = a⁻¹ * b := by

## Output1:

**Formal proof:**
import Mathlib

theorem exercise_mul_eq_inv_mul {G : Type*} [Group G] (a b : G) (h : a * b = b * a⁻¹) : b * a = a⁻¹ * b := by
  -- Multiply by \(a\) on the right hand side of \(a * b = b * a^{-1}\) to get \(a * b * a = b * a^{-1} * a = b\).
  have h1 : a * b * a = b := by
    calc
      a * b * a = b * a⁻¹ * a := by sorry
      _ = b := by sorry
  -- Multiply by \(a^{-1}\) on the left hand side of the previous equation \(a * b * a = b\) to get \(a^{-1} * (a * b * a) = a^{-1} * b\).
  have h2 : a⁻¹ * (a * b * a) = a⁻¹ * b := by sorry
  -- Simplify it we get the final result \(b * a = a^{-1} * b\).
  have h3 : b * a = a⁻¹ * b := by
    rw [h2]
    sorry
  exact h3

# Now, your input is: