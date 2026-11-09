import NoThreeLine.ClockRestartBase

/-! A deterministic pre-arrival restart of the actual waiting sequence:
subtract elapsed time from wait0 and retain every later wait and mark. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.DeterministicClockRestart
open ClockRestartBase

def joinHeadTail (z : ℝ × ClockPath) : ClockPath := fun k => Nat.casesOn k z.1 z.2

theorem joinHeadTail_measurable : Measurable joinHeadTail := by
  apply measurable_pi_lambda
  intro k
  cases k with
  | zero => exact measurable_fst
  | succ k => exact (measurable_pi_apply k).comp measurable_snd

@[simp] theorem joinHeadTail_headTail (ω : ClockPath) : joinHeadTail (headTail ω) = ω := by
  funext k
  cases k <;> rfl

theorem clock_joinHeadTail_map (rate : ℝ) (hr : 0 < rate) :
    ((expMeasure rate).prod (clockMeasure rate)).map joinHeadTail = clockMeasure rate := by
  rw [← clock_headTail_map rate hr, Measure.map_map joinHeadTail_measurable headTail_measurable]
  have he : joinHeadTail ∘ headTail = id := by funext ω; exact joinHeadTail_headTail ω
  rw [he, Measure.map_id]

def residual (t : ℝ) (ω : ClockPath) : ClockPath := joinHeadTail (ω 0 - t, tail ω)

@[simp] theorem residual_zero (t : ℝ) (ω : ClockPath) : residual t ω 0 = ω 0 - t := rfl
@[simp] theorem residual_succ (t : ℝ) (ω : ClockPath) (k : ℕ) :
    residual t ω (k+1) = ω (k+1) := rfl

theorem residual_measurable (t : ℝ) : Measurable (residual t) :=
  joinHeadTail_measurable.comp (((measurable_pi_apply 0).sub_const t).prodMk tail_measurable)

theorem clock_headTail_restrict (rate t : ℝ) (hr : 0 < rate) :
    ((clockMeasure rate).restrict {ω | t < ω 0}).map headTail =
      ((expMeasure rate).restrict (Ioi t)).prod (clockMeasure rate) := by
  letI := clockMeasure_probability rate hr
  letI := isProbabilityMeasure_expMeasure hr
  have hs : headTail ⁻¹' (Ioi t ×ˢ (univ : Set ClockPath)) = {ω : ClockPath | t < ω 0} := by
    ext ω
    simp [headTail]
  rw [← hs, ← Measure.restrict_map headTail_measurable (measurableSet_Ioi.prod MeasurableSet.univ),
    clock_headTail_map rate hr, ← Measure.restrict_prod_eq_prod_univ]

theorem clock_residual_restrict_map (rate t : ℝ) (hr : 0 < rate) (ht : 0 ≤ t) :
    ((clockMeasure rate).restrict {ω | t < ω 0}).map (residual t) =
      (ENNReal.ofReal (Real.exp (-(rate*t)))) • clockMeasure rate := by
  letI := clockMeasure_probability rate hr
  letI := isProbabilityMeasure_expMeasure hr
  have hsub : Measurable (fun x : ℝ => x-t) := by fun_prop
  have hmap : ((clockMeasure rate).restrict {ω | t < ω 0}).map (residual t) =
      ((((clockMeasure rate).restrict {ω | t < ω 0}).map headTail).map
        (Prod.map (fun x : ℝ => x-t) id)).map joinHeadTail := by
    rw [Measure.map_map joinHeadTail_measurable (hsub.prodMap measurable_id),
      Measure.map_map (joinHeadTail_measurable.comp (hsub.prodMap measurable_id)) headTail_measurable]
    rfl
  rw [hmap, clock_headTail_restrict rate t hr,
    ← Measure.map_prod_map _ _ hsub measurable_id, Measure.map_id,
    exp_residual_restrict_map rate t hr ht, Measure.prod_smul_left, Measure.map_smul,
    clock_joinHeadTail_map rate hr]

def residualMarked (t : ℝ) (ω : MarkedClockPath) : MarkedClockPath :=
  (residual t ω.1, ω.2)

theorem residualMarked_measurable (t : ℝ) : Measurable (residualMarked t) :=
  (residual_measurable t).prodMap measurable_id

theorem marked_residual_restrict_map (rate t : ℝ) (hr : 0 < rate) (ht : 0 ≤ t) :
    ((markedClockMeasure rate).restrict {ω | t < ω.1 0}).map (residualMarked t) =
      (ENNReal.ofReal (Real.exp (-(rate*t)))) • markedClockMeasure rate := by
  letI := clockMeasure_probability rate hr
  have hs : {ω : MarkedClockPath | t < ω.1 0} =
      {ω : ClockPath | t < ω 0} ×ˢ (univ : Set ClockPath) := by ext ω; simp
  rw [markedClockMeasure, hs, ← Measure.restrict_prod_eq_prod_univ]
  change (((clockMeasure rate).restrict {ω | t < ω 0}).prod markSequenceMeasure).map
    (Prod.map (residual t) id) = _
  rw [← Measure.map_prod_map _ _ (residual_measurable t) measurable_id,
    clock_residual_restrict_map rate t hr ht, Measure.map_id, Measure.prod_smul_left]

end NoThreeLine.DeterministicClockRestart

#print axioms NoThreeLine.DeterministicClockRestart.clock_residual_restrict_map
#print axioms NoThreeLine.DeterministicClockRestart.marked_residual_restrict_map
