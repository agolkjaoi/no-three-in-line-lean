import Mathlib.Data.Real.Basic
import Mathlib.Data.Finset.Card
import Mathlib.Algebra.Order.BigOperators.Group.Finset
import Mathlib.Algebra.BigOperators.Ring.Finset
import Mathlib.Tactic.Linarith
import Mathlib.Tactic.NormNum

/-!
The target below is copied, with namespace changed only, from the frozen
CompensationCore.lean. It is a definition, not an established theorem.
The theorems here extract a large legal output from an explicitly supplied
finite weighted ensemble. No stochastic construction or asymptotic estimate
is asserted by this module.
-/

set_option autoImplicit false

namespace NoThreeLine

abbrev Grid (n : ℕ) := Fin n × Fin n

def orientedArea {n : ℕ} (p q r : Grid n) : ℤ :=
  ((q.1.val : ℤ) - p.1.val) * ((r.2.val : ℤ) - p.2.val) -
    ((q.2.val : ℤ) - p.2.val) * ((r.1.val : ℤ) - p.1.val)

def NoThree {n : ℕ} (s : Finset (Grid n)) : Prop :=
  ∀ p ∈ s, ∀ q ∈ s, ∀ r ∈ s,
    p ≠ q → p ≠ r → q ≠ r → orientedArea p q r ≠ 0

/-- Fixed 1.501 lower bound for every sufficiently large integer board. -/
def Target : Prop :=
  ∃ n₀ : ℕ, ∀ n : ℕ, n₀ ≤ n →
    ∃ s : Finset (Grid n), NoThree s ∧ 1501 * n ≤ 1000 * s.card

/-- Finite expectation above a threshold forces one supported output above it. -/
theorem finite_weighted_exists_gt {ι : Type*} (outcomes : Finset ι)
    (weight value : ι → ℝ) (threshold : ℝ)
    (hweight : ∀ i ∈ outcomes, 0 ≤ weight i)
    (hmass : ∑ i ∈ outcomes, weight i = 1)
    (hmean : threshold < ∑ i ∈ outcomes, weight i * value i) :
    ∃ i ∈ outcomes, threshold < value i := by
  classical
  by_contra h
  have hbound : ∀ i ∈ outcomes, value i ≤ threshold := by
    intro i hi
    by_contra hle
    exact h ⟨i, hi, lt_of_not_ge hle⟩
  have hsum : (∑ i ∈ outcomes, weight i * value i) ≤
      ∑ i ∈ outcomes, weight i * threshold := by
    exact Finset.sum_le_sum (fun i hi => mul_le_mul_of_nonneg_left (hbound i hi) (hweight i hi))
  rw [← Finset.sum_mul, hmass, one_mul] at hsum
  exact (not_lt_of_ge hsum) hmean

/-- Last finite extraction step, retaining the exact integer target inequality. -/
theorem exists_legal_of_finite_weighted_card {ι : Type*} (n : ℕ)
    (outcomes : Finset ι) (weight : ι → ℝ) (output : ι → Finset (Grid n))
    (hweight : ∀ i ∈ outcomes, 0 ≤ weight i)
    (hmass : ∑ i ∈ outcomes, weight i = 1)
    (hlegal : ∀ i ∈ outcomes, NoThree (output i))
    (hmean : (1501 : ℝ) * n / 1000 <
      ∑ i ∈ outcomes, weight i * ((output i).card : ℝ)) :
    ∃ s : Finset (Grid n), NoThree s ∧ 1501 * n ≤ 1000 * s.card := by
  obtain ⟨i, hi, hcard⟩ := finite_weighted_exists_gt outcomes weight
    (fun i => ((output i).card : ℝ)) ((1501 : ℝ) * n / 1000) hweight hmass hmean
  refine ⟨output i, hlegal i hi, ?_⟩
  have hreal : (1501 : ℝ) * n ≤ 1000 * ((output i).card : ℝ) := by linarith
  exact_mod_cast hreal

end NoThreeLine

#print axioms NoThreeLine.finite_weighted_exists_gt
#print axioms NoThreeLine.exists_legal_of_finite_weighted_card
