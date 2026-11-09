import NoThreeLine.AugmentedClockRestart

/-! The actual residual board is independent of any measurable observation
of the capped event, provided no future candidate data is exposed after
the cap or when the initial state is already frozen. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open CappedClockRestart BoardFirstCandidate WinnerMarkLaw

theorem capped_evaluation_restart_map {n : ℕ} {X : Type*} [MeasurableSpace X]
    (hn : 0 < n) (rate T : ℝ) (hr : 0 < rate) (hT : 0 ≤ T)
    (f : Event n → X) (hf : Measurable f)
    (hlate : ∀ z z' : Event n, T < z.1.1 → T < z'.1.1 → f z = f z') :
    (boardClockMeasure n rate).map (fun ω => (f (firstMarkedRace hn ω),residualBoard hn T ω)) =
      ((boardClockMeasure n rate).map (fun ω => f (firstMarkedRace hn ω))).prod (boardClockMeasure n rate) := by
  let zlate : Event n := ((T+1,(⟨0,hn⟩,⟨0,hn⟩)),0)
  have hobs : observe hn T f (f zlate) = fun ω => f (firstMarkedRace hn ω) := by
    funext ω
    unfold observe
    split_ifs with ht
    · rfl
    · exact (hlate (firstMarkedRace hn ω) zlate (lt_of_not_ge ht) (by dsimp [zlate]; linarith)).symm
  have h := capped_restart_map hn rate T hr hT f (f zlate) hf
  rw [hobs] at h
  exact h

theorem aug_observation_restart_map {n : ℕ} {X : Type*} [MeasurableSpace X]
    (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (rate : ℝ) (hr : 0 < rate)
    (s : AugTimedState cfg) (f : Event n → X) (hf : Measurable f)
    (hdone : s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true → ∀ z z', f z = f z')
    (hlate : ∀ z z' : Event n,
      augGuardTime cfg ε M (augTimedInput cfg s) < z.1.1 →
      augGuardTime cfg ε M (augTimedInput cfg s) < z'.1.1 → f z = f z') :
    (boardClockMeasure n rate).map (fun ω => (f (firstMarkedRace hn ω),augResidualBoard cfg ε M hn (s,ω))) =
      ((boardClockMeasure n rate).map (fun ω => f (firstMarkedRace hn ω))).prod (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  by_cases hs : s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true
  · let z0 : Event n := ((0,(⟨0,hn⟩,⟨0,hn⟩)),0)
    have he : (fun ω : BoardClockPath n => f (firstMarkedRace hn ω)) = fun _ => f z0 :=
      funext (fun ω => hdone hs _ _)
    have hp : (fun ω => (f (firstMarkedRace hn ω),augResidualBoard cfg ε M hn (s,ω))) =
        fun ω => (f z0,ω) := by
      funext ω
      rw [hdone hs _ z0]
      simp only [augResidualBoard,if_pos hs]
    rw [hp,he]
    have hm0 : Measurable (fun ω : BoardClockPath n => (f z0,ω)) :=
      measurable_const.prodMk measurable_id
    have hc0 : Measurable (fun _ : BoardClockPath n => f z0) := measurable_const
    apply Measure.ext_prod
    intro A D hA hD
    rw [Measure.map_apply hm0 (hA.prod hD),Measure.prod_prod,Measure.map_apply hc0 hA]
    by_cases ha : f z0 ∈ A <;> simp [ha]
  · have he : (fun ω => (f (firstMarkedRace hn ω),augResidualBoard cfg ε M hn (s,ω))) =
        fun ω => (f (firstMarkedRace hn ω),residualBoard hn (augGuardTime cfg ε M (augTimedInput cfg s)) ω) := by
      funext ω
      simp only [augResidualBoard,if_neg hs]
    rw [he]
    exact capped_evaluation_restart_map hn rate _ hr
      (augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1).1 f hf hlate

end NoThreeLine

#print axioms NoThreeLine.capped_evaluation_restart_map
#print axioms NoThreeLine.aug_observation_restart_map
