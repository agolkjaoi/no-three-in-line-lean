import NoThreeLine.ScheduledCutLineWitnessSum
import NoThreeLine.LongLineExcessBudget

/-! The actual cut-density long-line excess, summed over every scheduled
phase, actual root line and selected witness, has the explicit logarithmic
bound. The full terminal-density transfer remains a separate theorem. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments FiniteDirections

def scheduledCutLongExcess {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (p : Grid n) (J : ℕ) (ℓ : ℝ) : ℝ :=
  ∑L∈longRootBoardLines Γ p (B*ℓ),scheduledCutLineWitnessSum cs ε M deadline start hn hB L.val p J

theorem scheduledCutLongExcess_bound {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k J : ℕ) (δ ℓ : ℝ) (hδ : 0<δ) (hℓ : 1≤ℓ) :
    0≤scheduledCutLongExcess cs ε M deadline start hn hB Γ p J ℓ ∧
      scheduledCutLongExcess cs ε M deadline start hn hB Γ p J ℓ≤
        16*(phaseEndpoint cs 0 J)^2/(1-ε)^(k+3).choose 2*(1+Real.log (n:ℝ))*
          lineExcessFactor (physicalRepeatErrorConstant (k+1)) δ ℓ k := by
  let Q := (phaseEndpoint cs 0 J/n)^2/(1-ε)^(k+3).choose 2
  let C := physicalRepeatErrorConstant (k+1)
  have hB0 : 0≤B := zero_le_one.trans hB
  have hC : 0≤C := by unfold C physicalRepeatErrorConstant; positivity
  have hℓ0 : 0<ℓ := zero_lt_one.trans_le hℓ
  have hQ : 0≤Q := div_nonneg (sq_nonneg _) (pow_nonneg (sub_nonneg.mpr hε.le) _)
  have hline (L : RootBoardLineIndex p) (hL : L∈longRootBoardLines Γ p (B*ℓ)) :
      0≤scheduledCutLineWitnessSum cs ε M deadline start hn hB L.val p J ∧
        scheduledCutLineWitnessSum cs ε M deadline start hn hB L.val p J≤
          Q*((L.val.val.card:ℝ)*(δ*(L.val.val.card:ℝ)+(L.val.val.card:ℝ)/(1+δ)^k+C*B/δ^k)) := by
    have hh := (mem_longRootBoardLines Γ p (B*ℓ) L).mp hL
    have hBL : B≤(L.val.val.card:ℝ) := by
      calc B=B*1 := (mul_one B).symm
           _≤B*ℓ := mul_le_mul_of_nonneg_left hℓ hB0
           _≤_ := hh.2
    exact scheduledCutLineWitnessSum_bound L.val p Γ hh.1 L.property cs ε M deadline start
      hn hB hΓ hK hε0 hε k J hBL δ hδ
  constructor
  · exact Finset.sum_nonneg (fun L hL=>(hline L hL).1)
  · calc
      _ ≤ ∑L∈longRootBoardLines Γ p (B*ℓ),
          Q*((L.val.val.card:ℝ)*(δ*(L.val.val.card:ℝ)+(L.val.val.card:ℝ)/(1+δ)^k+C*B/δ^k)) :=
        Finset.sum_le_sum (fun L hL=>(hline L hL).2)
      _ = Q*∑L∈longRootBoardLines Γ p (B*ℓ),
          (L.val.val.card:ℝ)*(δ*(L.val.val.card:ℝ)+(L.val.val.card:ℝ)/(1+δ)^k+C*B/δ^k) :=
        (Finset.mul_sum _ _ _).symm
      _ ≤ Q*(lineExcessFactor C δ ℓ k*(16*(n:ℝ)^2*(1+Real.log (n:ℝ)))) :=
        mul_le_mul_of_nonneg_left (longRootBoardLine_excess_sum_bound Γ p B C δ ℓ k hC hδ hℓ0) hQ
      _ = _ := by
        have hn0 : (n:ℝ)≠0 := ne_of_gt (by exact_mod_cast hn)
        unfold Q C
        field_simp
        <;> ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLongExcess_bound
