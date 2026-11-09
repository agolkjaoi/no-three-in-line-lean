import NoThreeLine.ScheduledCutLineExcessMean
import NoThreeLine.ScheduledCutLineOvershoot
import NoThreeLine.CalendarIntegralFubini

/-! Integrate actual cut-law line excess through one inherited phase.
The resulting quantity uses the time-varying actual cut density. A later
terminal-density tower is a separate obligation. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteWitnessMoments

def scheduledCutLineExcessIntegral {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) : ℝ :=
  ∫t in (0:ℝ)..(cs N).horizon,scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N t

theorem scheduledCutLineExcessMean_intervalIntegrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n) (N : ℕ) :
    IntervalIntegrable (scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N)
      volume 0 (cs N).horizon := by
  apply (intervalIntegrable_iff_integrableOn_Ioo_of_le (cs N).horizon.coe_nonneg).mpr
  exact integrableOn_of_nonneg_bound volume (Ioo (0:ℝ) (cs N).horizon) measurableSet_Ioo _
    (scheduledCutLineExcessMean_measurable cs ε M deadline start hn hB mask L p z N)
    (B*(B*(L.val.card:ℝ))) (fun t _=>scheduledCutLineExcessMean_bounds cs ε M deadline start hn hB mask hm L p z N t)

theorem scheduledCutLineExcessIntegral_eq_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n) (N : ℕ) :
    scheduledCutLineExcessIntegral cs ε M deadline start hn hB mask L p z N=
      ∫ω,(∫t in (0:ℝ)..(cs N).horizon,scheduledCutLineExcessWeighted cs ε M deadline start hn hB mask L p z N (ω,t))
        ∂boardClockMeasure n (B/n) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos (lt_of_lt_of_le zero_lt_one hB) (by exact_mod_cast hn))
  exact (CalendarIntegral.expected_interval_integral_swap _ (cs N).horizon (cs N).horizon.coe_nonneg
    (scheduledCutLineExcessWeighted cs ε M deadline start hn hB mask L p z N)
    (scheduledCutLineExcessWeighted_measurable cs ε M deadline start hn hB mask L p z N)
    (B*(B*(L.val.card:ℝ)))
    (scheduledCutLineExcessWeighted_bounds cs ε M deadline start hn hB mask hm L p z N)).symm

theorem scheduledCutLineExcessIntegral_bound {n : ℕ} {B : ℝ}
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (Γ : Finset ZPoint) (hL : ¬specified Γ L) (hpL : p∈L.val) (hzL : z∈L.val) (hpz : p≠z)
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K<2)
    (hε0 : 0≤ε) (hε : ε<1) (k N : ℕ) (hBL : B≤(L.val.card:ℝ)) (δ : ℝ) (hδ : 0<δ) :
    0≤scheduledCutLineExcessIntegral cs ε M deadline start hn hB mask L p z N ∧
      scheduledCutLineExcessIntegral cs ε M deadline start hn hB mask L p z N≤
        (cs N).horizon*((((∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)+
          (cs N).horizon*(cs N).mask z)/n)/(1-ε)^(k+3).choose 2*
          (δ*(L.val.card:ℝ)+(L.val.card:ℝ)/(1+δ)^k+physicalRepeatErrorConstant (k+1)*B/δ^k)) := by
  let P := (((∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)+
    (cs N).horizon*(cs N).mask z)/n)/(1-ε)^(k+3).choose 2
  let A := δ*(L.val.card:ℝ)+(L.val.card:ℝ)/(1+δ)^k+physicalRepeatErrorConstant (k+1)*B/δ^k
  have hB0 : 0≤B := zero_le_one.trans hB
  have hP : 0≤P := by
    apply div_nonneg
    · apply div_nonneg
      · exact add_nonneg (Finset.sum_nonneg (fun j _=>mul_nonneg (cs j).horizon.coe_nonneg ((cs j).mask_nonneg z)))
          (mul_nonneg (cs N).horizon.coe_nonneg ((cs N).mask_nonneg z))
      · exact Nat.cast_nonneg n
    · exact pow_nonneg (sub_nonneg.mpr hε.le) _
  have hA : 0≤A := by unfold A physicalRepeatErrorConstant; positivity
  have hb (t : ℝ) (ht : t∈Ioo (0:ℝ) (cs N).horizon) :
      0≤scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N t ∧
        scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N t≤P*A := by
    refine ⟨(scheduledCutLineExcessMean_bounds cs ε M deadline start hn hB mask hm L p z N t).1,?_⟩
    have hh := initial_scheduledCutPoint_line_overshoot_bound mask hm L p z Γ hL hpL hzL hpz
      cs ε M deadline start hn hB hΓ hK hε0 hε k N t ⟨ht.1.le,ht.2.le⟩ hBL δ hδ
    change (∫ω,selectedLineExcess mask L p z
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
        ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t)≤_ at hh
    rw [←scheduledCutLineExcessMean_eq_point] at hh
    apply hh.trans
    apply mul_le_mul_of_nonneg_right _ hA
    apply div_le_div_of_nonneg_right _ (pow_nonneg (sub_nonneg.mpr hε.le) _)
    apply div_le_div_of_nonneg_right _ (Nat.cast_nonneg n)
    exact add_le_add le_rfl (mul_le_mul_of_nonneg_right ht.2.le ((cs N).mask_nonneg z))
  exact integral_initial_segment_bounds (cs N).horizon (cs N).horizon (cs N).horizon.coe_nonneg le_rfl
    (scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N)
    (scheduledCutLineExcessMean_measurable cs ε M deadline start hn hB mask L p z N)
    (P*A) (mul_nonneg hP hA) hb

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLineExcessIntegral_eq_mean
#print axioms NoThreeLine.BirthWitness.scheduledCutLineExcessIntegral_bound
