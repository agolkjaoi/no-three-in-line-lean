import NoThreeLine.CappedClockRestart
import NoThreeLine.AugmentedGuardReachability

/-! Actual remaining board after one capped augmented update. This keeps
the original infinite clock arrays, consuming the winning head on a candidate
and subtracting the cap from all first waits when no candidate has arrived. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine
open BoardFirstCandidate CappedClockRestart

def augResidualBoard {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (x : AugTimedState cfg × BoardClockPath n) : BoardClockPath n :=
  if x.1.val.2 ≤ 0 ∨ x.1.val.1.physical.process.stopped = true then x.2
  else CappedClockRestart.residualBoard hn (augGuardTime cfg ε M (augTimedInput cfg x.1)) x.2

def augRestartStep {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (x : AugTimedState cfg × BoardClockPath n) : AugTimedState cfg × BoardClockPath n :=
  (augTimedClockStep cfg ε M hn x,augResidualBoard cfg ε M hn x)

theorem augResidualBoard_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (augResidualBoard cfg ε M hn) := by
  have hT : Measurable (fun x : AugTimedState cfg × BoardClockPath n =>
      augGuardTime cfg ε M (augTimedInput cfg x.1)) :=
    (augGuardTime_measurable cfg ε M).comp ((augTimedInput_measurable cfg).comp measurable_fst)
  unfold augResidualBoard
  apply Measurable.ite
  · exact (measurableSet_le (measurable_subtype_coe.snd.comp measurable_fst) measurable_const).union
      (measurableSet_eq_fun ((ProcessState.measurable_stopped n).comp
        ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
          (measurable_subtype_coe.fst.comp measurable_fst)))) measurable_const)
  · exact measurable_snd
  · unfold CappedClockRestart.residualBoard
    apply Measurable.ite (measurableSet_le ((firstTime_measurable hn).comp measurable_snd) hT)
    · exact (ActualClockRestart.restartedBoard_measurable hn).comp measurable_snd
    · exact (VariableResidualSection.residualFamily_joint_measurable (Grid n)).comp (hT.prodMk measurable_snd)

theorem augRestartStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (augRestartStep cfg ε M hn) :=
  (augTimedClockStep_measurable cfg ε M hn).prodMk (augResidualBoard_measurable cfg ε M hn)

theorem augTimedStep_late_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (s : AugTimedState cfg)
    (z z' : CappedClockRestart.Event n)
    (hz : augGuardTime cfg ε M (augTimedInput cfg s) < z.1.1)
    (hz' : augGuardTime cfg ε M (augTimedInput cfg s) < z'.1.1) :
    augTimedStep cfg ε M (s,z) = augTimedStep cfg ε M (s,z') := by
  have hcap := (augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1).1
  have ha (u : CappedClockRestart.Event n) (hu : augGuardTime cfg ε M (augTimedInput cfg s) < u.1.1) :
      augAdvance cfg ε M (augTimedInput cfg s,u.1.1) = augGuardTime cfg ε M (augTimedInput cfg s) := by
    change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) u.1.1) = _
    rw [min_eq_left hu.le,max_eq_right hcap]
  have hp : augPreState cfg ε M (augTimedInput cfg s,z) = augPreState cfg ε M (augTimedInput cfg s,z') := by
    change AugmentedState.mk (selectedTrajectory cfg ((augTimedInput cfg s).1.1,
        augAdvance cfg ε M (augTimedInput cfg s,z.1.1)))
      (selectedEtaCurve cfg ((augTimedInput cfg s).1,augAdvance cfg ε M (augTimedInput cfg s,z.1.1))) =
      AugmentedState.mk (selectedTrajectory cfg ((augTimedInput cfg s).1.1,
        augAdvance cfg ε M (augTimedInput cfg s,z'.1.1)))
      (selectedEtaCurve cfg ((augTimedInput cfg s).1,augAdvance cfg ε M (augTimedInput cfg s,z'.1.1)))
    rw [ha z hz,ha z' hz']
  apply Subtype.ext
  simp only [augTimedStep,augTimedStepPair]
  split_ifs
  · rfl
  · simp only [augOutcome,augRawOutcome,not_le_of_gt hz,not_le_of_gt hz',and_false,if_false,
      hp,ha z hz,ha z' hz']

theorem augRestartStep_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : AugTimedState cfg) :
    (boardClockMeasure n rate).map (fun ω => augRestartStep cfg ε M hn (s,ω)) =
      ((boardClockMeasure n rate).map (fun ω => augTimedClockStep cfg ε M hn (s,ω))).prod
        (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  by_cases hs : s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true
  · have hm : Measurable (fun ω : BoardClockPath n => (s,ω)) := measurable_const.prodMk measurable_id
    have he : (fun ω => augRestartStep cfg ε M hn (s,ω)) = (fun ω => (s,ω)) := by
      funext ω
      simp only [augRestartStep,augResidualBoard,augTimedClockStep,augTimedStep,augTimedStepPair,if_pos hs]
    have hc : (fun ω => augTimedClockStep cfg ε M hn (s,ω)) = (fun _ => s) := by
      funext ω
      apply Subtype.ext
      simp only [augTimedClockStep,augTimedStep,augTimedStepPair,if_pos hs]
    rw [he,hc]
    apply Measure.ext_prod
    intro A D hA hD
    rw [Measure.map_apply hm (hA.prod hD),Measure.prod_prod,Measure.map_apply measurable_const hA]
    by_cases ha : s ∈ A <;> simp [ha]
  · let T := augGuardTime cfg ε M (augTimedInput cfg s)
    let f := fun z : CappedClockRestart.Event n => augTimedStep cfg ε M (s,z)
    let zlate : CappedClockRestart.Event n := ((T+1,(⟨0,hn⟩,⟨0,hn⟩)),0)
    let b := f zlate
    have hf : Measurable f := (augTimedStep_measurable cfg ε M).comp (measurable_const.prodMk measurable_id)
    have hobs : observe hn T f b = fun ω => augTimedClockStep cfg ε M hn (s,ω) := by
      funext ω
      unfold observe
      split_ifs with ht
      · rfl
      · exact (augTimedStep_late_eq cfg ε M s (WinnerMarkLaw.firstMarkedRace hn ω) zlate
          (lt_of_not_ge ht) (by dsimp [zlate,T]; linarith)).symm
    have he : (fun ω => augRestartStep cfg ε M hn (s,ω)) =
        fun ω => (observe hn T f b ω,CappedClockRestart.residualBoard hn T ω) := by
      funext ω
      rw [hobs]
      simp only [augRestartStep,augResidualBoard,if_neg hs]
      rfl
    rw [he]
    have ht := (augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1).1
    rw [capped_restart_map hn rate T hr ht f b hf,hobs]

end NoThreeLine

#print axioms NoThreeLine.augRestartStep_measurable
#print axioms NoThreeLine.augTimedStep_late_eq
#print axioms NoThreeLine.augRestartStep_map
