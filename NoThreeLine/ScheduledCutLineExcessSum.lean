import NoThreeLine.ScheduledCutLineExcessIntegral
import NoThreeLine.ScheduledUnitPriceCap

/-! Sum the actual cut-density excess integrals through all scheduled
phases, using each phase's actual mask. This is still a current-cut-density
quantity; no future terminal-density identification is presumed. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

def scheduledCutLineExcessTotal {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (L : LineIndex n) (p z : Grid n) (J : ℕ) : ℝ :=
  ∑N∈Finset.range J,scheduledCutLineExcessIntegral cs ε M deadline start hn hB (cs N).mask L p z N

theorem scheduledCutLineExcessTotal_bound {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p z : Grid n) (Γ : Finset ZPoint)
    (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val) (hpz : p≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k J : ℕ) (hBL : B≤(L.val.card:ℝ)) (δ : ℝ) (hδ : 0<δ) :
    0≤scheduledCutLineExcessTotal cs ε M deadline start hn hB L p z J ∧
      scheduledCutLineExcessTotal cs ε M deadline start hn hB L p z J≤
        phaseEndpoint cs 0 J*((phaseEndpoint cs 0 J/n)/(1-ε)^(k+3).choose 2*
          (δ*(L.val.card:ℝ)+(L.val.card:ℝ)/(1+δ)^k+physicalRepeatErrorConstant (k+1)*B/δ^k)) := by
  let A := δ*(L.val.card:ℝ)+(L.val.card:ℝ)/(1+δ)^k+physicalRepeatErrorConstant (k+1)*B/δ^k
  have hB0 : 0≤B := zero_le_one.trans hB
  have hA : 0≤A := by unfold A physicalRepeatErrorConstant; positivity
  have hphase (N : ℕ) : 0≤scheduledCutLineExcessIntegral cs ε M deadline start hn hB (cs N).mask L p z N ∧
      scheduledCutLineExcessIntegral cs ε M deadline start hn hB (cs N).mask L p z N≤
        (cs N).horizon*((((∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)+
          (cs N).horizon*(cs N).mask z)/n)/(1-ε)^(k+3).choose 2*A) :=
    scheduledCutLineExcessIntegral_bound (cs N).mask (fun q=>⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩)
      L p z Γ hL hpL hzL hpz cs ε M deadline start hn hB hΓ hK hε0 hε k N hBL δ hδ
  constructor
  · exact Finset.sum_nonneg (fun N _=>(hphase N).1)
  · calc
      _ ≤ ∑N∈Finset.range J,(cs N).horizon*((phaseEndpoint cs 0 J/n)/(1-ε)^(k+3).choose 2*A) := by
        apply Finset.sum_le_sum
        intro N hN
        apply (hphase N).2.trans
        apply mul_le_mul_of_nonneg_left _ (cs N).horizon.coe_nonneg
        apply mul_le_mul_of_nonneg_right _ hA
        exact div_le_div_of_nonneg_right
          (scheduled_unit_price_le_total cs J N (Finset.mem_range.mp hN) z (cs N).horizon le_rfl)
          (pow_nonneg (sub_nonneg.mpr hε.le) _)
      _ = _ := by rw [←Finset.sum_mul]; simp only [phaseEndpoint,zero_add,NNReal.coe_sum,A]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLineExcessTotal_bound
