import NoThreeLine.WitnessMeanBounds

/-! The actual S7 source sum, its measurability, and finite domination.
The source retains the individual shared-line prices exactly. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines

def sourceSum {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n→ℝ) : ℝ :=
  ∑q∈D,(mask q*retention q/n)*sourcePrice a.augmented.physical Γ C q*
    mixed Γ (insert q C) (D.erase q) L a

def sourceCap {n : ℕ} (Γ : Finset ZPoint) (C D : Finset (Grid n)) (B K : ℝ) : ℝ :=
  ∑q∈D,((1:ℝ)/n)*max 1 (protection 1 K)^Γ.card*mixedCap (insert q C) B

theorem sourceSum_measurable {n : ℕ} {X : Type*} [MeasurableSpace X]
    (a : X→WitnessState n) (ha : Measurable a) (ret : X→Grid n→ℝ) (hr : Measurable ret)
    (Γ : Finset ZPoint) (C D L : Finset (Grid n)) (mask : Grid n→ℝ) :
    Measurable (fun x=>sourceSum (a x) Γ C D L mask (ret x)) := by
  apply Finset.measurable_sum
  intro q _
  exact ((((measurable_pi_apply q).comp hr).const_mul (mask q)).div_const _ |>.mul
    ((sourcePrice_measurable Γ C q).comp ((AugmentedState.measurable_physical n).comp
      ((WitnessState.measurable_augmented n).comp ha)))).mul
        ((mixed_measurable Γ (insert q C) (D.erase q) L).comp ha)

theorem sourceSum_bounds {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (mask retention : Grid n→ℝ) (B K : ℝ)
    (ha : a.Valid B) (hm : ∀q,0≤mask q ∧ mask q≤1) (hr : ∀q,0≤retention q ∧ retention q≤1)
    (hK : K<2)
    (hk : ∀q∈D,∀J,sharedLine C q J→specified Γ J→a.augmented.physical.clocks J≤K) :
    0≤sourceSum a Γ C D L mask retention ∧ sourceSum a Γ C D L mask retention≤sourceCap Γ C D B K := by
  have hc0 (q : Grid n) : 0≤mask q*retention q/n := div_nonneg
    (mul_nonneg (hm q).1 (hr q).1) (Nat.cast_nonneg n)
  have hc1 (q : Grid n) : mask q*retention q/n≤1/n := by
    apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
    nlinarith [(hm q).1,(hm q).2,(hr q).1,(hr q).2]
  constructor
  · exact Finset.sum_nonneg (fun q _=>mul_nonneg
      (mul_nonneg (hc0 q) (sourcePrice_nonneg _ Γ C q B ha.1.1))
      (mixed_nonneg a Γ (insert q C) (D.erase q) L B ha))
  · apply Finset.sum_le_sum
    intro q hq
    apply mul_le_mul
    · exact mul_le_mul (hc1 q) (sourcePrice_le _ Γ C q K hK (hk q hq))
        (sourcePrice_nonneg _ Γ C q B ha.1.1) (div_nonneg zero_le_one (Nat.cast_nonneg n))
    · exact mixed_le_cap a Γ (insert q C) (D.erase q) L B ha
    · exact mixed_nonneg a Γ (insert q C) (D.erase q) L B ha
    · exact mul_nonneg (div_nonneg zero_le_one (Nat.cast_nonneg n))
        (pow_nonneg (le_trans zero_le_one (le_max_left _ _)) _)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sourceSum_measurable
#print axioms NoThreeLine.BirthWitness.sourceSum_bounds
