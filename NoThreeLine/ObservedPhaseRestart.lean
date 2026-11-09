import NoThreeLine.ObservedTerminalLaw
import NoThreeLine.BirthObservationPhases

/-! An observed phase returns the actual remaining original board while
preserving birth timestamps. Its law is the existing iid observed phase law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def observedTimedProjection {n : ℕ} (cfg : FlowConfig n) (s : TimedObservation cfg) : PhaseObservation n cfg.B :=
  (augTimedStateProjection cfg s.1,s.2)

theorem observedTimedProjection_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (observedTimedProjection cfg) :=
  ((augTimedStateProjection_measurable cfg).comp measurable_fst).prodMk measurable_snd

theorem observedTerminal_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : PhaseObservation n cfg.B) (ω : PhaseNoise n) :
    observedTimedProjection cfg (observedTerminal cfg ε M start hn (observedPhaseStart cfg ε M s,ω)) =
      observedPhaseTerminal cfg ε M start hn (s,ω) := by
  apply Prod.ext
  · change augTimedStateProjection cfg (observedTerminal cfg ε M start hn (observedPhaseStart cfg ε M s,ω)).1 = _
    rw [observedTerminal_base]
    rfl
  · rfl

def observedPhaseRecycledPair {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : PhaseObservation n cfg.B × BoardClockPath n) : PhaseObservation n cfg.B × BoardClockPath n :=
  let r := observedRecycledTerminalPair cfg ε M start hn (observedPhaseStart cfg ε M x.1,x.2)
  (observedTimedProjection cfg r.1,r.2)

theorem observedPhaseRecycledPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n) :
    Measurable (observedPhaseRecycledPair cfg ε M start hn) := by
  have ht := (observedRecycledTerminalPair_measurable cfg ε M start hn).comp
    (((observedPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd)
  exact ((observedTimedProjection_measurable cfg).comp ht.fst).prodMk ht.snd

theorem observedPhaseRecycledPair_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : PhaseObservation n cfg.B × BoardClockPath n) :
    ((observedPhaseRecycledPair cfg ε M start hn x).1.1,(observedPhaseRecycledPair cfg ε M start hn x).2) =
      augPhaseRecycledPair cfg ε M hn (x.1.1,x.2) := by
  have h := congrArg (fun r : AugTimedState cfg × BoardClockPath n => (augTimedStateProjection cfg r.1,r.2))
    (observedRecycledTerminalPair_base cfg ε M start hn (observedPhaseStart cfg ε M x.1,x.2))
  exact h

theorem observedPhaseRecycledPair_consistent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (x : PhaseObservation n cfg.B × BoardClockPath n) (hx : PhaseRecordsConsistent x.1) :
    PhaseRecordsConsistent (observedPhaseRecycledPair cfg ε M start hn x).1 :=
  observedRecycledTerminal_consistent cfg ε M start hn (observedPhaseStart cfg ε M x.1,x.2) hx

theorem observedPhaseRecycledPair_map {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (s : PhaseObservation n cfg.B) :
    (boardClockMeasure n (cfg.B/n)).map (fun ω => observedPhaseRecycledPair cfg ε M start hn (s,ω)) =
      ((FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
        (fun ω => observedPhaseTerminal cfg ε M start hn (s,ω))).prod (boardClockMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  letI := phaseNoise_probability cfg hn hB
  have hp : Measurable (fun r : TimedObservation cfg × BoardClockPath n => (observedTimedProjection cfg r.1,r.2)) :=
    ((observedTimedProjection_measurable cfg).comp measurable_fst).prodMk measurable_snd
  have hr : Measurable (fun ω : BoardClockPath n =>
      observedRecycledTerminalPair cfg ε M start hn (observedPhaseStart cfg ε M s,ω)) :=
    (observedRecycledTerminalPair_measurable cfg ε M start hn).comp (measurable_const.prodMk measurable_id)
  have ht : Measurable (fun ω : PhaseNoise n => observedTerminal cfg ε M start hn (observedPhaseStart cfg ε M s,ω)) :=
    (observedTerminal_measurable cfg ε M start hn).comp (measurable_const.prodMk measurable_id)
  letI : IsProbabilityMeasure ((FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
      (fun ω => observedTerminal cfg ε M start hn (observedPhaseStart cfg ε M s,ω))) :=
    Measure.isProbabilityMeasure_map ht.aemeasurable
  have h := congrArg (fun μ : Measure (TimedObservation cfg × BoardClockPath n) =>
    μ.map (fun r => (observedTimedProjection cfg r.1,r.2)))
      (observedRecycledTerminalPair_map cfg ε M start hn hB (observedPhaseStart cfg ε M s))
  rw [Measure.map_map hp hr,map_pair_with_fresh_right _ _ _ (observedTimedProjection_measurable cfg),
    Measure.map_map (observedTimedProjection_measurable cfg) ht] at h
  simpa only [Function.comp_def,observedTerminal_projection,observedPhaseRecycledPair] using h

theorem observedRecycledTerminalPair_eq_of_done {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : TimedObservation cfg) (hs : AugTimedDone cfg s.1) (ω : BoardClockPath n) :
    observedRecycledTerminalPair cfg ε M start hn (s,ω) = (s,ω) :=
  observedRecycledPair_absorbing cfg ε M start hn s ω 0 hs _ (Nat.zero_le _)

theorem observedPhaseRecycledPair_stopped {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (s : PhaseObservation n cfg.B) (hs : s.1.val.physical.process.stopped = true) (ω : BoardClockPath n) :
    observedPhaseRecycledPair cfg ε M start hn (s,ω) = (s,ω) := by
  have hd : AugTimedDone cfg (observedPhaseStart cfg ε M s).1 := Or.inr hs
  simp only [observedPhaseRecycledPair,observedRecycledTerminalPair_eq_of_done cfg ε M start hn _ hd]
  rfl

theorem observedPhaseRecycledPair_zero_horizon {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0 < n)
    (hh : cfg.horizon = 0) (s : PhaseObservation n cfg.B) (ω : BoardClockPath n) :
    observedPhaseRecycledPair cfg ε M start hn (s,ω) = (s,ω) := by
  have hd : AugTimedDone cfg (observedPhaseStart cfg ε M s).1 := Or.inl (by simp [observedPhaseStart,augPhaseStart,hh])
  simp only [observedPhaseRecycledPair,observedRecycledTerminalPair_eq_of_done cfg ε M start hn _ hd]
  rfl

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedPhaseRecycledPair_map
#print axioms NoThreeLine.BirthWitness.observedPhaseRecycledPair_base
#print axioms NoThreeLine.BirthWitness.observedPhaseRecycledPair_consistent
