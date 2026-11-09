import NoThreeLine.ActivatedLineProxy
import NoThreeLine.ScheduledRiskProxyComparison
import NoThreeLine.ScheduledLineExcessPath

/-! The deterministic leaf-count main term on the actual activated line,
integrated on the original scheduled cut path. This is not yet identified
with a retained birth-time future cost. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines FiniteDirections

def scheduledLineMainPath {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∫t in (0:ℝ)..(cs N).horizon,selectedLineMain mask L p z
    (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t))

theorem scheduledLineMainPath_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) :
    Measurable (scheduledLineMainPath cs ε M deadline start hn hB mask L p z N) :=
  variable_running_integral_measurable (fun _=>(cs N).horizon) measurable_const
    (fun _=>(cs N).horizon.coe_nonneg) _
    ((selectedLineMain_measurable mask L p z).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N))

theorem scheduledLineMainPath_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q) (L : LineIndex n) (p z : Grid n)
    (N : ℕ) (ω : BoardClockPath n) :
    0≤scheduledLineMainPath cs ε M deadline start hn hB mask L p z N ω ∧
      scheduledLineMainPath cs ε M deadline start hn hB mask L p z N ω≤
        (cs N).horizon*(∑q∈lineLeafSites L p z,mask q) :=
  integral_initial_segment_bounds _ _ (cs N).horizon.coe_nonneg le_rfl _
    (((selectedLineMain_measurable mask L p z).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)).comp
        (measurable_const.prodMk measurable_id)) _
    (Finset.sum_nonneg (fun q _=>hm q))
    (fun t _=>selectedLineMain_bounds mask hm L p z _)

theorem scheduledLineMainPath_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q) (L : LineIndex n) (p z : Grid n)
    (N : ℕ) (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledLineMainPath cs ε M deadline start hn hB mask L p z N) μ :=
  GenericCreditIteration.bounded_nonnegative_integrable μ _
    (scheduledLineMainPath_measurable cs ε M deadline start hn hB mask L p z N) _
    (scheduledLineMainPath_bounds cs ε M deadline start hn hB mask hm L p z N)

private theorem bounded_interval_integrable {Ω : Type*} [MeasurableSpace Ω]
    (H : ℝ) (hH : 0≤H) (f : Ω×ℝ→ℝ) (hf : Measurable f) (C : ℝ)
    (hb : ∀x,0≤f x ∧ f x≤C) (ω : Ω) :
    IntervalIntegrable (fun t=>f (ω,t)) volume 0 H :=
  (intervalIntegrable_iff_integrableOn_Ioo_of_le hH).mpr
    (integrableOn_of_nonneg_bound volume (Ioo 0 H) measurableSet_Ioo _
      (hf.comp (measurable_const.prodMk measurable_id)) C (fun t _=>hb (ω,t)))

theorem scheduledOutsideLineProxyPath_le_main_excess {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (L : LineIndex n) (p : Grid n) (N : ℕ) (ω : BoardClockPath n) :
    scheduledOutsideLineProxyPath cs ε M deadline start hn hB L p N ω ≤
      (∑z∈L.val.erase p,(scheduledLineMainPath cs ε M deadline start hn hB (cs N).mask L p z N ω +
        scheduledLineExcessPath cs ε M deadline start hn hB (cs N).mask L p z N ω))/n := by
  let a := scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) N
  have ha := scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) N
  have hm (q : Grid n) := And.intro ((cs N).mask_nonneg q) ((cs N).mask_le_one q)
  have hmi (z : Grid n) : IntervalIntegrable
      (fun t=>selectedLineMain (cs N).mask L p z (a (ω,t))) volume 0 (cs N).horizon :=
    bounded_interval_integrable _ (cs N).horizon.coe_nonneg _
      ((selectedLineMain_measurable (cs N).mask L p z).comp
        (scheduledCutWitness_measurable cs ε M deadline start _ hn _ N)) _
      (fun x=>selectedLineMain_bounds (cs N).mask (cs N).mask_nonneg L p z (a x)) ω
  have hei (z : Grid n) : IntervalIntegrable
      (fun t=>selectedLineExcess (cs N).mask L p z (a (ω,t))) volume 0 (cs N).horizon :=
    bounded_interval_integrable _ (cs N).horizon.coe_nonneg _
      ((selectedLineExcess_measurable (cs N).mask L p z).comp
        (scheduledCutWitness_measurable cs ε M deadline start _ hn _ N)) _
      (fun x=>selectedLineExcess_bounds (cs N).mask hm L p z (a x) B (zero_le_one.trans hB) (ha x)) ω
  have hpi : IntervalIntegrable
      (fun t=>scheduledOutsideLineProxyRate cs ε M deadline start hn hB L p N (ω,t))
      volume 0 (cs N).horizon :=
    bounded_interval_integrable _ (cs N).horizon.coe_nonneg _
      (scheduledOutsideLineProxyRate_measurable cs ε M deadline start hn hB L p N) _
      (fun x=>⟨(scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N x).1,
        (scheduledOutsideLineProxyRate_bounds cs ε M deadline start hn hB L p N x).2.trans
        (scheduledOutsideLineRiskRate_bounds cs ε M deadline start hn hB L p N x).2⟩) ω
  have hsi : IntervalIntegrable (fun t=>∑z∈L.val.erase p,
      (selectedLineMain (cs N).mask L p z (a (ω,t))+
       selectedLineExcess (cs N).mask L p z (a (ω,t)))) volume 0 (cs N).horizon := by
    apply bounded_interval_integrable _ (cs N).horizon.coe_nonneg
      (fun x=>∑z∈L.val.erase p,(selectedLineMain (cs N).mask L p z (a x)+
        selectedLineExcess (cs N).mask L p z (a x)))
    · exact Finset.measurable_sum _ (fun z _=>
        ((selectedLineMain_measurable (cs N).mask L p z).comp
          (scheduledCutWitness_measurable cs ε M deadline start _ hn _ N)).add
        ((selectedLineExcess_measurable (cs N).mask L p z).comp
          (scheduledCutWitness_measurable cs ε M deadline start _ hn _ N)))
    · intro x
      have hmz (z : Grid n) := selectedLineMain_bounds (cs N).mask (cs N).mask_nonneg L p z (a x)
      have hez (z : Grid n) := selectedLineExcess_bounds (cs N).mask hm L p z (a x) B (zero_le_one.trans hB) (ha x)
      exact ⟨Finset.sum_nonneg (fun z _=>add_nonneg (hmz z).1 (hez z).1),
        Finset.sum_le_sum (fun z _=>add_le_add (hmz z).2 (hez z).2)⟩
  calc
    _ ≤ ∫t in (0:ℝ)..(cs N).horizon,
        (∑z∈L.val.erase p,(selectedLineMain (cs N).mask L p z (a (ω,t))+
          selectedLineExcess (cs N).mask L p z (a (ω,t))))/n := by
      apply intervalIntegral.integral_mono_on (cs N).horizon.coe_nonneg hpi
        (hsi.div_const n)
      intro t _
      exact physicalOutsideLineProxy_le_main_excess (cs N).mask hm _ B (zero_le_one.trans hB) (ha (ω,t)) L p
    _ = _ := by
      simp only [div_eq_mul_inv,intervalIntegral.integral_mul_const]
      congr 1
      rw [intervalIntegral.integral_finsetSum (fun z _=>(hmi z).add (hei z))]
      exact Finset.sum_congr rfl (fun z _=>intervalIntegral.integral_add (hmi z) (hei z))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledLineMainPath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledOutsideLineProxyPath_le_main_excess
