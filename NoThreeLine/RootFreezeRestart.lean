import NoThreeLine.RootFreezeStep
import NoThreeLine.ObservedRecycledProcess

/-! The full frozen snapshot is a legitimate observation of the first
capped race. The actual unconsumed clock board stays independent of it. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

theorem rawStepSaved_late_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (s : TimedObservation cfg) (z z' : CandidateData n)
    (hz : augGuardTime cfg ε M (augTimedInput cfg s.1)<z.1.1)
    (hz' : augGuardTime cfg ε M (augTimedInput cfg s.1)<z'.1.1) :
    rawStepSaved cfg ε M start (s,z)=rawStepSaved cfg ε M start (s,z') := by
  by_cases hd : observationDone cfg s
  · rw [rawStepSaved_done cfg ε M start (s,z) hd,rawStepSaved_done cfg ε M start (s,z') hd]
  · have hcap := (augGuardTime_mem cfg ε M (augTimedInput cfg s.1) s.1.property.1.1).1
    have ha (u : CandidateData n) (hu : augGuardTime cfg ε M (augTimedInput cfg s.1)<u.1.1) :
        augAdvance cfg ε M (augTimedInput cfg s.1,u.1.1)=augGuardTime cfg ε M (augTimedInput cfg s.1) := by
      change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s.1)) u.1.1)=_
      rw [min_eq_left hu.le,max_eq_right hcap]
    simp only [rawStepSaved,if_neg hd]
    apply Prod.ext
    · simp only [augRawOutcome,not_le_of_gt hz,not_le_of_gt hz',and_false,if_false]
      change AugmentedState.mk (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
          augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1)))
        (selectedEtaCurve cfg ((augTimedInput cfg s.1).1,augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1)))=
        AugmentedState.mk (selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,
          augAdvance cfg ε M (augTimedInput cfg s.1,z'.1.1)))
        (selectedEtaCurve cfg ((augTimedInput cfg s.1).1,augAdvance cfg ε M (augTimedInput cfg s.1,z'.1.1)))
      rw [ha z hz,ha z' hz']
    · change (observedStep cfg ε M start (s,z)).2=(observedStep cfg ε M start (s,z')).2
      exact congrArg (fun a : TimedObservation cfg=>a.2) (observedStep_late_eq cfg ε M start s z z' hz hz')

theorem rootObserverStep_done_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (hd : observationDone cfg s.1) (z z' : CandidateData n) :
    rootObserverStep cfg ε M start p (s,z)=rootObserverStep cfg ε M start p (s,z') := by
  simp only [rootObserverStep,observedStep_frozen cfg ε M start (s.1,z) hd,
    observedStep_frozen cfg ε M start (s.1,z') hd,
    rawStepSaved_done cfg ε M start (s.1,z) hd,rawStepSaved_done cfg ε M start (s.1,z') hd]

theorem rootObserverStep_late_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (z z' : CandidateData n)
    (hz : augGuardTime cfg ε M (augTimedInput cfg s.1.1)<z.1.1)
    (hz' : augGuardTime cfg ε M (augTimedInput cfg s.1.1)<z'.1.1) :
    rootObserverStep cfg ε M start p (s,z)=rootObserverStep cfg ε M start p (s,z') := by
  simp only [rootObserverStep,observedStep_late_eq cfg ε M start s.1 z z' hz hz',
    rawStepSaved_late_eq cfg ε M start s.1 z z' hz hz']

def rootObserverClockStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : RootObservation cfg × BoardClockPath n) : RootObservation cfg :=
  rootObserverStep cfg ε M start p (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem rootObserverClockStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) : Measurable (rootObserverClockStep cfg ε M start p hn) :=
  (rootObserverStep_measurable cfg ε M start p).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

def rootObserverRestartStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : RootObservation cfg × BoardClockPath n) : RootObservation cfg × BoardClockPath n :=
  (rootObserverClockStep cfg ε M start p hn x,augResidualBoard cfg ε M hn (x.1.1.1,x.2))

theorem rootObserverRestartStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) : Measurable (rootObserverRestartStep cfg ε M start p hn) :=
  (rootObserverClockStep_measurable cfg ε M start p hn).prodMk
    ((augResidualBoard_measurable cfg ε M hn).comp (measurable_fst.fst.fst.prodMk measurable_snd))

theorem rootObserverRestartStep_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : RootObservation cfg × BoardClockPath n) :
    ((rootObserverRestartStep cfg ε M start p hn x).1.1,(rootObserverRestartStep cfg ε M start p hn x).2)=
      observedRestartStep cfg ε M start hn (x.1.1,x.2) := by
  apply Prod.ext
  · exact rootObserverStep_projection cfg ε M start p _
  · rfl

theorem rootObserverRestartStep_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (rate : ℝ) (hr : 0<rate) (s : RootObservation cfg) :
    (boardClockMeasure n rate).map (fun ω=>rootObserverRestartStep cfg ε M start p hn (s,ω))=
      ((boardClockMeasure n rate).map (fun ω=>rootObserverClockStep cfg ε M start p hn (s,ω))).prod
        (boardClockMeasure n rate) := by
  apply aug_observation_restart_map cfg ε M hn rate hr s.1.1
    (fun z=>rootObserverStep cfg ε M start p (s,z))
    ((rootObserverStep_measurable cfg ε M start p).comp (measurable_const.prodMk measurable_id))
  · exact rootObserverStep_done_eq cfg ε M start p s
  · exact rootObserverStep_late_eq cfg ε M start p s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rawStepSaved_late_eq
#print axioms NoThreeLine.BirthWitness.rootObserverRestartStep_projection
#print axioms NoThreeLine.BirthWitness.rootObserverRestartStep_map
