import NoThreeLine.LongLineMean
import NoThreeLine.ShortStarGeometry

/-! The actual long witness pairs and short stars form disjoint symmetric
parts of the board-pair relation. Both use the same whole-line threshold. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines GridLines MixedConnection FinitePhase
local instance (P : Prop) : Decidable P := Classical.propDecidable P

def longBoardPair {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n) : Prop :=
  longWitnessEligible Γ p H q ∧ boardPair p q z

instance {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    DecidableRel (longBoardPair Γ p H) := fun _ _=>Classical.propDecidable _

theorem longBoardPair_swap {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n) :
    longBoardPair Γ p H q z ↔ longBoardPair Γ p H z q := by
  have hf (q z : Grid n) (h : longBoardPair Γ p H q z) : longBoardPair Γ p H z q := by
    have he := lineThrough_eq_of_mem p q z h.2.1.symm h.2.2.1.symm
      ((mem_lineThrough p q z).mpr h.2.2.2.2)
    refine ⟨⟨h.2.2.1,?_,?_⟩,(boardPair_swap p q z).mp h.2⟩
    · intro hs
      apply h.1.2.1
      apply (specifiedPair_iff_line_mem Γ p q h.2.1.symm).mpr
      rw [he]
      exact (specifiedPair_iff_line_mem Γ p z h.2.2.1.symm).mp hs
    · rw [←he]
      exact h.1.2.2
  exact ⟨hf q z,hf z q⟩

theorem longBoardPair_not_short {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n)
    (hl : longBoardPair Γ p H q z) : ¬ShortStars.Valid Γ p H q z :=
  fun hs=>(not_lt_of_ge hl.1.2.2) hs.2.2.2.2.2

theorem short_valid_boardPair {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) (q z : Grid n)
    (hs : ShortStars.Valid Γ p H q z) : boardPair p q z :=
  ⟨hs.1,hs.2.1,hs.2.2.1,(mem_lineThrough p q z).mp hs.2.2.2.1⟩

theorem pairForm_long_short_le {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (a b : Grid n→ℝ) (ha : ∀q,0≤a q) (hb : ∀q,0≤b q) :
    pairForm (longBoardPair Γ p H) a b+pairForm (ShortStars.Valid Γ p H) a b≤pairForm (boardPair p) a b := by
  classical
  unfold pairForm
  rw [←Finset.sum_add_distrib]
  apply Finset.sum_le_sum
  intro q _
  rw [←Finset.sum_add_distrib]
  apply Finset.sum_le_sum
  intro z _
  by_cases hl : longBoardPair Γ p H q z
  · simp only [if_pos hl,if_neg (longBoardPair_not_short Γ p H q z hl),if_pos hl.2,add_zero,le_refl]
  · by_cases hs : ShortStars.Valid Γ p H q z
    · simp only [if_neg hl,if_pos hs,if_pos (short_valid_boardPair Γ p H q z hs),zero_add,le_refl]
    · simp only [if_neg hl,if_neg hs,zero_add]
      split_ifs
      · exact mul_nonneg (ha q) (hb z)
      · exact le_rfl

theorem longBirthIntegrand_eq_longPair {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset ZPoint) (p : Grid n) (H u : ℝ) :
    (∑z : Grid n,s.rate (fun j=>mask j z) u*longWitnessCost s mask Γ p H z u/n)=
      pairForm (longBoardPair Γ p H) (fun z=>s.rate (fun j=>mask j z) u)
        (fun q=>remainingIntegral (s.rate (fun j=>mask j q)) s.total u)/(n:ℝ)^2 := by
  classical
  unfold pairForm
  rw [Finset.sum_div]
  apply Finset.sum_congr rfl
  intro z _
  by_cases hz : longWitnessEligible Γ p H z
  · have he : (∑q : Grid n,if longBoardPair Γ p H z q then
        s.rate (fun j=>mask j z) u*remainingIntegral (s.rate (fun j=>mask j q)) s.total u else 0)=
        s.rate (fun j=>mask j z) u*
          ∑q∈witnessLeaves p z,remainingIntegral (s.rate (fun j=>mask j q)) s.total u := by
      rw [witnessLeaves_eq_boardPair p z hz.1,Finset.sum_filter,Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro q _
      simp only [longBoardPair,hz,true_and]
      split_ifs <;> simp
    rw [longWitnessCost,if_pos hz,lineFutureCost_sum,he]
    ring
  · simp only [longWitnessCost,if_neg hz,mul_zero,zero_div,longBoardPair,hz,false_and,if_false,Finset.sum_const_zero]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.longBoardPair_swap
#print axioms NoThreeLine.BirthWitness.pairForm_long_short_le
#print axioms NoThreeLine.BirthWitness.longBirthIntegrand_eq_longPair
