import NoThreeLine.AffineBranch
import Mathlib.Algebra.Order.Floor.Ring
import Mathlib.Data.Rat.Floor
import Mathlib.Tactic

set_option autoImplicit false
open MeasureTheory Set
open scoped Interval

namespace NoThreeLine

/-- Executable rational versions of the already proved affine majorant. -/
def qAlpha (a b r s : ℚ) : ℚ :=
  if 0 ≤ b then a + b * (r + s) / (r * s) else a + 2 * b / ((r + s) / 2)

def qBeta (b r s : ℚ) : ℚ :=
  if 0 ≤ b then -b / (r * s) else -b / (((r + s) / 2) ^ 2)

def branchBound (a b r s : ℚ) : ℚ :=
  if r = 0 then s * a^2 else
  min ((s-r) * max ((a+b/r)^2) ((a+b/s)^2))
    ((s-r)/3 * ((qAlpha a b r s + qBeta b r s*r)^2 +
      (qAlpha a b r s + qBeta b r s*r)*(qAlpha a b r s + qBeta b r s*s) +
      (qAlpha a b r s + qBeta b r s*s)^2))

/-- All conditions are decidable rational comparisons, including the zero branch. -/
def BranchValid (a b r s : ℚ) : Prop :=
  0 ≤ r ∧ r < s ∧ (r = 0 → b = 0) ∧ 0 ≤ a+b/r ∧ 0 ≤ a+b/s

instance (a b r s : ℚ) : Decidable (BranchValid a b r s) := inferInstanceAs
  (Decidable (0 ≤ r ∧ r < s ∧ (r = 0 → b = 0) ∧ 0 ≤ a+b/r ∧ 0 ≤ a+b/s))

lemma qAlpha_cast (a b r s : ℚ) :
    (qAlpha a b r s : ℝ) = NoThreeLineSecondFollowup.alpha a b r s := by
  unfold qAlpha NoThreeLineSecondFollowup.alpha
  split_ifs <;> push_cast <;> first | rfl | norm_cast at *

lemma qBeta_cast (b r s : ℚ) :
    (qBeta b r s : ℝ) = NoThreeLineSecondFollowup.beta b r s := by
  unfold qBeta NoThreeLineSecondFollowup.beta
  split_ifs <;> push_cast <;> first | rfl | norm_cast at *

theorem branchBound_sound (a b r s : ℚ) (h : BranchValid a b r s) :
    (∫ u in (r : ℝ)..(s : ℝ), ((a : ℝ)+(b : ℝ)/u)^2) ≤
      (branchBound a b r s : ℝ) := by
  rcases h with ⟨hr, hrs, hz, hvr, hvs⟩
  by_cases hr0 : r = 0
  · have hb := hz hr0
    simp [branchBound, hr0, hb]
  · have hrp : (0 : ℝ) < r := by exact_mod_cast lt_of_le_of_ne hr (Ne.symm hr0)
    have hrs' : (r : ℝ) < s := by exact_mod_cast hrs
    have hv1 : (0 : ℝ) ≤ (a : ℝ)+(b : ℝ)/(r : ℝ) := by exact_mod_cast hvr
    have hv2 : (0 : ℝ) ≤ (a : ℝ)+(b : ℝ)/(s : ℝ) := by exact_mod_cast hvs
    have hi := NoThreeLineSecondFollowup.concrete_branch_integral_soundness
      a b r s hrp hrs' hv1 hv2
    simpa only [branchBound, if_neg hr0, Rat.cast_min, Rat.cast_max,
      Rat.cast_mul, Rat.cast_sub, Rat.cast_add, Rat.cast_div, Rat.cast_pow,
      Rat.cast_ofNat, qAlpha_cast, qBeta_cast] using hi

/-- Upward rounding uses arbitrary precision integers, with no compiler oracle. -/
def roundUp (S : ℕ) (q : ℚ) : ℚ := (⌈(S : ℚ)*q⌉ : ℚ) / S

theorem le_roundUp (S : ℕ) (hS : 0 < S) (q : ℚ) : q ≤ roundUp S q := by
  have hs : (0 : ℚ) < S := by exact_mod_cast hS
  apply (le_div_iff₀ hs).mpr
  simpa [mul_comm] using Int.le_ceil ((S : ℚ)*q)

theorem roundUp_lt (S : ℕ) (hS : 0 < S) (q : ℚ) :
    roundUp S q < q + 1 / S := by
  have hs : (0 : ℚ) < S := by exact_mod_cast hS
  apply (div_lt_iff₀ hs).mpr
  have hi := Int.ceil_lt_add_one ((S : ℚ)*q)
  field_simp
  field_simp at hi
  nlinarith

theorem rounded_branch_sound (S : ℕ) (hS : 0 < S) (a b r s : ℚ)
    (h : BranchValid a b r s) :
    (∫ u in (r : ℝ)..(s : ℝ), ((a : ℝ)+(b : ℝ)/u)^2) ≤
      (roundUp S (branchBound a b r s) : ℝ) :=
  (branchBound_sound a b r s h).trans (by exact_mod_cast le_roundUp S hS _)

/-- Finite additivity over an explicitly supplied ordered chain. -/
theorem integral_chain_bound (f : ℝ → ℝ) (xs : List ℝ) (a b : ℝ)
    (cost : ℝ → ℝ → ℝ)
    (h : List.IsChain (fun x y => IntervalIntegrable f volume x y ∧
      (∫ u in x..y, f u) ≤ cost x y) (a :: xs ++ [b])) :
    IntervalIntegrable f volume a b ∧ (∫ u in a..b, f u) ≤
      (((a :: xs).zip (xs ++ [b])).map (fun p => cost p.1 p.2)).sum := by
  induction xs generalizing a with
  | nil => simpa using h.rel
  | cons x xs ih =>
    have hax := h.rel
    have htail := h.tail
    have hxb := ih x htail
    refine ⟨hax.1.trans hxb.1, ?_⟩
    rw [← intervalIntegral.integral_add_adjacent_intervals hax.1 hxb.1]
    simpa using add_le_add hax.2 hxb.2

/-- The returned positive margin is uniform whenever the same checked budget is used. -/
theorem acceptance_margin {ι : Type*} [Fintype ι]
    (I : ι → ℝ) (bounds : ι → ℚ) (w δ κ : ℚ)
    (hI : ∀ i, I i ≤ (bounds i : ℝ)) (hw : 0 ≤ w) (hκ : 0 < κ)
    (accept : w * ∑ i, bounds i ≤ δ - κ) :
    0 < (κ : ℝ) ∧ (w : ℝ) * ∑ i, I i ≤ (δ : ℝ) - (κ : ℝ) := by
  constructor
  · exact_mod_cast hκ
  · calc
      (w : ℝ) * ∑ i, I i ≤ (w : ℝ) * ∑ i, (bounds i : ℝ) :=
        mul_le_mul_of_nonneg_left (Finset.sum_le_sum fun i _ => hI i) (by exact_mod_cast hw)
      _ ≤ (δ : ℝ) - (κ : ℝ) := by exact_mod_cast accept

end NoThreeLine

#print axioms NoThreeLine.branchBound_sound
#print axioms NoThreeLine.rounded_branch_sound
#print axioms NoThreeLine.integral_chain_bound
#print axioms NoThreeLine.acceptance_margin
