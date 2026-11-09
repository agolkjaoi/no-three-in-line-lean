import NoThreeLine.ScheduledCutLineExcessSum

/-! Sum actual selected-witness excess along one physical line, including
the risk factor 1/n. The root is excluded from the witness set. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

def scheduledCutLineWitnessSum {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (L : LineIndex n) (p : Grid n) (J : ℕ) : ℝ :=
  (∑z∈L.val.erase p,scheduledCutLineExcessTotal cs ε M deadline start hn hB L p z J)/n

theorem scheduledCutLineWitnessSum_bound {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k J : ℕ) (hBL : B≤(L.val.card:ℝ)) (δ : ℝ) (hδ : 0<δ) :
    0≤scheduledCutLineWitnessSum cs ε M deadline start hn hB L p J ∧
      scheduledCutLineWitnessSum cs ε M deadline start hn hB L p J≤
        ((phaseEndpoint cs 0 J/n)^2/(1-ε)^(k+3).choose 2)*
          ((L.val.card:ℝ)*(δ*(L.val.card:ℝ)+(L.val.card:ℝ)/(1+δ)^k+physicalRepeatErrorConstant (k+1)*B/δ^k)) := by
  let A := δ*(L.val.card:ℝ)+(L.val.card:ℝ)/(1+δ)^k+physicalRepeatErrorConstant (k+1)*B/δ^k
  let Q := (phaseEndpoint cs 0 J/n)^2/(1-ε)^(k+3).choose 2
  have hB0 : 0≤B := zero_le_one.trans hB
  have hA : 0≤A := by unfold A physicalRepeatErrorConstant; positivity
  have hQ : 0≤Q := div_nonneg (sq_nonneg _) (pow_nonneg (sub_nonneg.mpr hε.le) _)
  have hzbound (z : Grid n) (hz : z∈L.val.erase p) :
      0≤scheduledCutLineExcessTotal cs ε M deadline start hn hB L p z J/n ∧
        scheduledCutLineExcessTotal cs ε M deadline start hn hB L p z J/n≤Q*A := by
    have hz' := Finset.mem_erase.mp hz
    have hh := scheduledCutLineExcessTotal_bound L p z Γ hL hpL hz'.2 hz'.1.symm
      cs ε M deadline start hn hB hΓ hK hε0 hε k J hBL δ hδ
    refine ⟨div_nonneg hh.1 (Nat.cast_nonneg n),?_⟩
    calc
      _ ≤ (phaseEndpoint cs 0 J*((phaseEndpoint cs 0 J/n)/(1-ε)^(k+3).choose 2*A))/n :=
        div_le_div_of_nonneg_right hh.2 (Nat.cast_nonneg n)
      _ = Q*A := by unfold Q; ring
  unfold scheduledCutLineWitnessSum
  rw [Finset.sum_div]
  constructor
  · exact Finset.sum_nonneg (fun z hz=>(hzbound z hz).1)
  · calc
      _ ≤ ∑_z∈L.val.erase p,Q*A := Finset.sum_le_sum (fun z hz=>(hzbound z hz).2)
      _ = ((L.val.erase p).card:ℝ)*(Q*A) := by simp only [Finset.sum_const,nsmul_eq_mul]
      _ ≤ (L.val.card:ℝ)*(Q*A) :=
        mul_le_mul_of_nonneg_right (by exact_mod_cast Finset.card_erase_le) (mul_nonneg hQ hA)
      _ = Q*((L.val.card:ℝ)*A) := by ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLineWitnessSum_bound
