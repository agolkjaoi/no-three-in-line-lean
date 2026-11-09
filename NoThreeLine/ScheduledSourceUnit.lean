import NoThreeLine.ScheduledCutProduct
import NoThreeLine.RootFreezeUnitHierarchy

/-! The actual calendar source on the recycled original board is bounded
by the solved scheduled cut hierarchy, with the full unit price. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines

theorem scheduledCalendarSource_mean_le_unit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j : ℕ) (hK : (cs j).K<2)
    (hCD : Disjoint C D) (hsep : SeparatedLabels (cs j).directions (C∪D))
    (t : ℝ) (ht : t≤(cs j).horizon) :
    (∫ω,scheduledCalendarSource cs ε M deadline start e C D L hn s j (ω,t) ∂boardClockMeasure n (B/n))≤
      ∑q∈D,phaseUnitCoefficient (cs j).config (phaseEndpoint cs start j) e q t*
        scheduledCutMean cs ε M deadline start e (insert q C) (D.erase q) L hn s j t := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s j
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s j
  let f : GoodPhaseObservation n B×BoardClockPath n→ℝ := fun x=>
    phaseCalendarSource (cs j).config ε M (phaseEndpoint cs start j) e C D L hn (x,t)
  have hf : Measurable f := (phaseCalendarSource_measurable (cs j).config ε M _ e C D L hn).comp
    (measurable_id.prodMk measurable_const)
  have hi : Integrable f (μ.prod ν) := GenericCreditIteration.bounded_nonnegative_integrable _ _ hf
    (sourceCap (cs j).directions C D B (cs j).K)
    (fun x=>terminalCalendarSource_bounds (cs j).config ε M (phaseEndpoint cs start j) e C D L hn
      (goodPhaseStart (cs j).config ε M x.1) (cs j).mask_le_one hK (x.2,t))
  have harg : Measurable (fun a : GoodPhaseObservation n B=>(a,t)) :=
    measurable_id.prodMk measurable_const
  have hgm : Measurable (fun a : GoodPhaseObservation n B=>unitHierarchyMean (cs j).config ε M (phaseEndpoint cs start j) e C D L hn
      (goodPhaseStart (cs j).config ε M a) t) := by
    convert (phaseUnitHierarchy_joint_measurable (cs j).config ε M (phaseEndpoint cs start j) e C D L hn hB).comp harg using 1
    rfl
  have hg : Integrable (fun a : GoodPhaseObservation n B=>unitHierarchyMean (cs j).config ε M (phaseEndpoint cs start j) e C D L hn
      (goodPhaseStart (cs j).config ε M a) t) μ :=
    GenericCreditIteration.bounded_nonnegative_integrable μ _ hgm (unitSourceCap C D B)
      (fun a=>unitHierarchyMean_bounds (cs j).config ε M (phaseEndpoint cs start j) e C D L hn hB
        (goodPhaseStart (cs j).config ε M a) (cs j).mask_le_one t)
  have hp (a : GoodPhaseObservation n B) : (∫w,f (a,w) ∂ν)≤
      unitHierarchyMean (cs j).config ε M (phaseEndpoint cs start j) e C D L hn
        (goodPhaseStart (cs j).config ε M a) t := by
    change calendarMeanSource (cs j).config ε M (phaseEndpoint cs start j) e C D L hn
      (goodPhaseStart (cs j).config ε M a) t≤_
    exact calendarMeanSource_le_unitHierarchyMean (cs j).config ε M _ e C D L hn hB
      (goodPhaseStart (cs j).config ε M a) (cs j).mask_le_one hK hCD hsep t ht
  change (∫ω,f (goodPhases cs ε M deadline start hn s j ω) ∂ν)≤_
  rw [←integral_map_of_stronglyMeasurable (goodPhases_measurable cs ε M deadline start hn s j) hf.stronglyMeasurable,
    goodPhases_residual_product cs ε M deadline start hn hB s j]
  change (∫x,f x ∂μ.prod ν)≤_
  rw [integral_prod _ hi]
  apply (integral_mono hi.integral_prod_left hg hp).trans_eq
  rw [phaseUnitHierarchy_mean (cs j).config ε M (phaseEndpoint cs start j) e C D L hn hB μ t]
  simp only [scheduledCutMean_eq_kernel cs ε M deadline start e _ _ L hn hB s j,μ]

theorem scheduledSourceIncrement_mean_le_unit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (e : Retention n) (C D L : Finset (Grid n))
    (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B) (j : ℕ) (hK : (cs j).K<2)
    (hCD : Disjoint C D) (hsep : SeparatedLabels (cs j).directions (C∪D)) :
    (∫ω,scheduledSourceIncrement cs ε M deadline start e C D L hn s j ω ∂boardClockMeasure n (B/n))≤
      ∫t in (0:ℝ)..(cs j).horizon,∑q∈D,phaseUnitCoefficient (cs j).config (phaseEndpoint cs start j) e q t*
        scheduledCutMean cs ε M deadline start e (insert q C) (D.erase q) L hn s j t := by
  let ν := boardClockMeasure n (B/n)
  let μ := goodPhaseStateLaw cs ε M deadline start hn s j
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  letI : IsProbabilityMeasure μ := goodPhaseStateLaw_probability cs ε M deadline start hn hB s j
  have hm : Measurable (fun t=>∫ω,scheduledCalendarSource cs ε M deadline start e C D L hn s j (ω,t) ∂ν) :=
    ((scheduledCalendarSource_measurable cs ε M deadline start e C D L hn s j).comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable
  have hb (t : ℝ) : 0≤(∫ω,scheduledCalendarSource cs ε M deadline start e C D L hn s j (ω,t) ∂ν) ∧
      (∫ω,scheduledCalendarSource cs ε M deadline start e C D L hn s j (ω,t) ∂ν)≤sourceCap (cs j).directions C D B (cs j).K := by
    have hi := GenericCreditIteration.bounded_nonnegative_integrable ν _
      ((scheduledCalendarSource_measurable cs ε M deadline start e C D L hn s j).comp (measurable_id.prodMk measurable_const)) _
      (fun ω=>scheduledCalendarSource_bounds cs ε M deadline start e C D L hn s j hK (ω,t))
    exact ⟨integral_nonneg (fun ω=>(scheduledCalendarSource_bounds cs ε M deadline start e C D L hn s j hK (ω,t)).1),
      (integral_mono hi (integrable_const _) (fun ω=>(scheduledCalendarSource_bounds cs ε M deadline start e C D L hn s j hK (ω,t)).2)).trans_eq (by simp [ν])⟩
  have hi : IntervalIntegrable (fun t=>∫ω,scheduledCalendarSource cs ε M deadline start e C D L hn s j (ω,t) ∂ν)
      volume 0 (cs j).horizon :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le (cs j).horizon.coe_nonneg).mpr
      (integrableOn_of_nonneg_bound volume _ measurableSet_Ioo _ hm _ (fun t _=>hb t))
  have hj : IntervalIntegrable (fun t=>∑q∈D,phaseUnitCoefficient (cs j).config (phaseEndpoint cs start j) e q t*
      scheduledCutMean cs ε M deadline start e (insert q C) (D.erase q) L hn s j t) volume 0 (cs j).horizon := by
    simp only [scheduledCutMean_eq_kernel cs ε M deadline start e _ _ L hn hB s j]
    simpa only [Finset.sum_fn] using IntervalIntegrable.sum D (fun q _=>phaseKernelHierarchyTerm_intervalIntegrable (cs j).config ε M (phaseEndpoint cs start j) e
      (insert q C) (D.erase q) L hn hB μ (cs j).mask_le_one q 0 (cs j).horizon)
  rw [scheduledSourceIncrement_mean_calendar cs ε M deadline start e C D L hn hB s j hK]
  exact intervalIntegral.integral_mono_on (cs j).horizon.coe_nonneg hi hj
    (fun t ht=>scheduledCalendarSource_mean_le_unit cs ε M deadline start e C D L hn hB s j hK hCD hsep t ht.2)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCalendarSource_mean_le_unit
#print axioms NoThreeLine.BirthWitness.scheduledSourceIncrement_mean_le_unit
