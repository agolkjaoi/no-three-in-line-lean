import NoThreeLine.FinitePairRestriction
import NoThreeLine.ScheduledCutShortStarSum

/-! Actual root-line-distinct tuples with a specified bad pair of slots.
The finite pair relation remains explicit; only cardinalities are enlarged. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines FiniteTuplePattern

def pairExceptionTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (m : ℕ) (P : Finset ((Grid n×Grid n)×(Grid n×Grid n))) :
    Finset (Fin m→↥(shortStars Γ p H)) := by
  classical
  exact (rootDistinctTuples Γ p H m).filter
    (fun f=>∃i j : Fin m,i≠j ∧ ((f i).val,(f j).val)∈P)

theorem pairExceptionTuples_subset {n m : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (P : Finset ((Grid n×Grid n)×(Grid n×Grid n))) :
    pairExceptionTuples Γ p H m P⊆rootDistinctTuples Γ p H m := Finset.filter_subset _ _

theorem pairExceptionTuples_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (m : ℕ) (P : Finset ((Grid n×Grid n)×(Grid n×Grid n))) :
    (pairExceptionTuples Γ p H m P).card≤m*(m-1)*(P.card*(shortStars Γ p H).card^(m-2)) := by
  classical
  have hs : pairExceptionTuples Γ p H m P⊆somePairRestricted m
      (Subtype.val : ↥(shortStars Γ p H)→Grid n×Grid n) P := by
    intro f hf
    exact (mem_somePairRestricted m _ P f).mpr (Finset.mem_filter.mp hf).2
  exact (Finset.card_le_card hs).trans (by
    simpa only [Fintype.card_coe] using somePairRestricted_card_le m
      (Subtype.val : ↥(shortStars Γ p H)→Grid n×Grid n) Subtype.val_injective P)

def longExceptionTuples {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ) (m : ℕ) :=
  pairExceptionTuples Γ p H m (longLeafPairs Γ p H R)

theorem mem_longExceptionTuples {n m : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (f : Fin m→↥(shortStars Γ p H)) :
    f∈longExceptionTuples Γ p H R m ↔ RootLinePairwise f ∧ ¬NoLongLeafPairException f R := by
  classical
  simp [longExceptionTuples,pairExceptionTuples,NoLongLeafPairException]

theorem longExceptionTuples_card_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H R : ℝ)
    (hH : 0≤H) (hR : 0<R) (m : ℕ) :
    ((longExceptionTuples Γ p H R m).card : ℝ)≤
      ((m*(m-1) : ℕ) : ℝ)*(((shortStars Γ p H).card : ℝ)*(16*H*(n : ℝ)^2/R)*
        ((shortStars Γ p H).card : ℝ)^(m-2)) := by
  have hcount : ((longExceptionTuples Γ p H R m).card : ℝ)≤
      ((m*(m-1) : ℕ) : ℝ)*((longLeafPairs Γ p H R).card*
        ((shortStars Γ p H).card : ℝ)^(m-2)) := by
    exact_mod_cast pairExceptionTuples_card_le Γ p H m (longLeafPairs Γ p H R)
  exact hcount.trans (mul_le_mul_of_nonneg_left
    (mul_le_mul_of_nonneg_right (longLeafPairs_card_le Γ p H R hH hR) (by positivity))
    (Nat.cast_nonneg _))

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.pairExceptionTuples_card_le
#print axioms NoThreeLine.ShortStars.mem_longExceptionTuples
#print axioms NoThreeLine.ShortStars.longExceptionTuples_card_le
