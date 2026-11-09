import NoThreeLine.ScheduledTerminalWitnessMoment
import NoThreeLine.RootBoardLineBudget

/-! All non-specified root lines, all actual selected witnesses, and all
phase times are summed under the same terminal point law. The first moment
is retained with its B self-rate coefficient. This is a C11 budget, not yet
a bound on the C13 two-time credit-removal error. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def nonSpecifiedRootBoardLines {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) :
    Finset (RootBoardLineIndex p) := by
  classical
  exact Finset.univ.filter (fun L => ¬specified Γ L.val)

def scheduledTerminalRootMoment {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (mask : ℕ → Grid n → ℝ) (Γ : Finset ZPoint)
    (p : Grid n) (J : ℕ) : ℝ :=
  (∑ L ∈ nonSpecifiedRootBoardLines Γ p,
    scheduledTerminalWitnessMoment cs ε M deadline start hn hB mask L.val p J)/(n : ℝ)^2

theorem scheduledTerminalRootMoment_bound {n : ℕ} {B : ℝ}
    (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (Γ : Finset ZPoint) (p : Grid n)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    0 ≤ scheduledTerminalRootMoment cs ε M deadline start hn hB mask Γ p J ∧
    scheduledTerminalRootMoment cs ε M deadline start hn hB mask Γ p J ≤
      (2*(phaseEndpoint cs 0 J)^2/(1-ε)^6)*rootBoardLineErrorBudget p B := by
  classical
  let T := phaseEndpoint cs 0 J
  let C := T^2/(n*(1-ε)^6)
  have hB0 : 0 ≤ B := zero_le_one.trans hB
  have hη : 0 < 1-ε := sub_pos.mpr hε
  have hC : 0 ≤ C := div_nonneg (sq_nonneg _) (mul_nonneg (Nat.cast_nonneg _) (pow_nonneg hη.le 6))
  let Q := fun L : RootBoardLineIndex p => (L.val.val.card : ℝ)^3+B*(L.val.val.card : ℝ)^2
  have hQ (L : RootBoardLineIndex p) : 0 ≤ Q L := by unfold Q; positivity
  have hb (L : RootBoardLineIndex p) (hL : L ∈ nonSpecifiedRootBoardLines Γ p) :=
    scheduledTerminalWitnessMoment_bound mask hm L.val p Γ (Finset.mem_filter.mp hL).2 L.property
      cs ε M deadline start hn hB hΓ hK hε0 hε J
  constructor
  · exact div_nonneg (Finset.sum_nonneg (fun L hL => (hb L hL).1)) (sq_nonneg _)
  · calc
      _ ≤ (∑ L ∈ nonSpecifiedRootBoardLines Γ p, 2*C*Q L)/(n : ℝ)^2 := by
        apply div_le_div_of_nonneg_right _ (sq_nonneg _)
        apply Finset.sum_le_sum
        intro L hL
        apply (hb L hL).2.trans
        change C*((L.val.val.card : ℝ)^3+2*B*(L.val.val.card : ℝ)^2) ≤ 2*C*Q L
        have hcube : 0 ≤ C*(L.val.val.card : ℝ)^3 := mul_nonneg hC (by positivity)
        unfold Q
        nlinarith only [hcube]
      _ ≤ (∑ L : RootBoardLineIndex p, 2*C*Q L)/(n : ℝ)^2 := by
        apply div_le_div_of_nonneg_right _ (sq_nonneg _)
        exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.subset_univ _)
          (fun L _ _ => mul_nonneg (mul_nonneg (by norm_num) hC) (hQ L))
      _ = _ := by
        rw [←Finset.mul_sum]
        change (2*(T^2/(n*(1-ε)^6))*(∑ L : RootBoardLineIndex p, Q L))/(n : ℝ)^2 =
          (2*T^2/(1-ε)^6)*((∑ L : RootBoardLineIndex p, Q L)/(n : ℝ)^3)
        field_simp
        <;> ring

theorem scheduledTerminalRootMoment_envelope {n : ℕ} {B : ℝ}
    (mask : ℕ → Grid n → ℝ) (hm : ∀ N q, 0 ≤ mask N q ∧ mask N q ≤ 1)
    (Γ : Finset ZPoint) (p : Grid n)
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (hΓ : ∀ j, (cs j).directions=Γ) (hK : ∀ j, (cs j).K < 2)
    (hε0 : 0 ≤ ε) (hε : ε < 1) (J : ℕ) :
    scheduledTerminalRootMoment cs ε M deadline start hn hB mask Γ p J ≤
      (2*(phaseEndpoint cs 0 J)^2/(1-ε)^6)*(64+16*(B/n)*(1+Real.log (n : ℝ))) :=
  (scheduledTerminalRootMoment_bound mask hm Γ p cs ε M deadline start hn hB hΓ hK hε0 hε J).2.trans
    (mul_le_mul_of_nonneg_left (rootBoardLineErrorBudget_bound p B (zero_le_one.trans hB))
      (by positivity))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledTerminalRootMoment_bound
#print axioms NoThreeLine.BirthWitness.scheduledTerminalRootMoment_envelope
