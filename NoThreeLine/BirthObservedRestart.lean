import NoThreeLine.AugmentedObservedRestart
import NoThreeLine.BirthObservationIteration

/-! The actual observed birth timestamps and updated augmented state are
jointly independent of the actual residual original clock board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

theorem observedStep_late_eq {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (s : TimedObservation cfg) (z z' : CandidateData n)
    (hz : augGuardTime cfg ε M (augTimedInput cfg s.1) < z.1.1)
    (hz' : augGuardTime cfg ε M (augTimedInput cfg s.1) < z'.1.1) :
    observedStep cfg ε M start (s,z) = observedStep cfg ε M start (s,z') := by
  apply Prod.ext
  · exact augTimedStep_late_eq cfg ε M s.1 z z' hz hz'
  · rw [observedStep_record_no_birth cfg ε M start (s,z) (fun h => (not_le_of_gt hz) h.2.1.2),
      observedStep_record_no_birth cfg ε M start (s,z') (fun h => (not_le_of_gt hz') h.2.1.2)]

def observedRestartStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : TimedObservation cfg × BoardClockPath n) : TimedObservation cfg × BoardClockPath n :=
  (observedClockStep cfg ε M start hn x,augResidualBoard cfg ε M hn (x.1.1,x.2))

theorem observedRestartStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n) :
    Measurable (observedRestartStep cfg ε M start hn) :=
  (observedClockStep_measurable cfg ε M start hn).prodMk
    ((augResidualBoard_measurable cfg ε M hn).comp (measurable_fst.fst.prodMk measurable_snd))

theorem observedRestartStep_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : TimedObservation cfg × BoardClockPath n) :
    ((observedRestartStep cfg ε M start hn x).1.1,(observedRestartStep cfg ε M start hn x).2) =
      augRestartStep cfg ε M hn (x.1.1,x.2) := rfl

theorem observedRestartStep_done {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (hs : AugTimedDone cfg s.1) (ω : BoardClockPath n) :
    observedRestartStep cfg ε M start hn (s,ω) = (s,ω) := by
  have hd : s.1.val.2 ≤ 0 ∨ s.1.val.1.physical.process.stopped = true := hs.imp (fun h => h.le) id
  unfold observedRestartStep observedClockStep
  rw [observedStep_frozen cfg ε M start _ hd]
  simp only [augResidualBoard,if_pos hd]

theorem observedRestartStep_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (s : TimedObservation cfg) :
    (boardClockMeasure n rate).map (fun ω => observedRestartStep cfg ε M start hn (s,ω)) =
      ((boardClockMeasure n rate).map (fun ω => observedClockStep cfg ε M start hn (s,ω))).prod
        (boardClockMeasure n rate) := by
  apply aug_observation_restart_map cfg ε M hn rate hr s.1
    (fun z => observedStep cfg ε M start (s,z))
    ((observedStep_measurable cfg ε M start).comp (measurable_const.prodMk measurable_id))
  · intro hs z z'
    rw [observedStep_frozen cfg ε M start _ hs,observedStep_frozen cfg ε M start _ hs]
  · exact observedStep_late_eq cfg ε M start s

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedStep_late_eq
#print axioms NoThreeLine.BirthWitness.observedRestartStep_map
#print axioms NoThreeLine.BirthWitness.observedRestartStep_base
