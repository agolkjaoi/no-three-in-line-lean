import NoThreeLine.ScheduledWeightFloor
import NoThreeLine.RootPhaseProcess

/-! Both the physical state and the simultaneously saved pre-resolution
root snapshot inherit the specified-line weight floor. This includes the
raw snapshot at a global stop, before positive retirement. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.BirthWitness

def RootObserverWeightFloor {n : ℕ} (cfg : FlowConfig n) (s : RootObservation cfg) : Prop :=
  s.1.1.val.1.physical.process.ActiveWeightFloor cfg.directions ∧
    s.2.2.1.physical.process.ActiveWeightFloor cfg.directions

theorem rawStepSaved_activeWeightFloor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (s : TimedObservation cfg) (hs : s.1.val.1.physical.process.ActiveWeightFloor cfg.directions)
    (z : CandidateData n) :
    (rawStepSaved cfg ε M start (s,z)).1.physical.process.ActiveWeightFloor cfg.directions := by
  unfold rawStepSaved
  split_ifs
  · exact hs
  · exact augRawOutcome_activeWeightFloor cfg ε M (augTimedInput cfg s.1) s.1.property.1.1 hs z

theorem rootObserverInitial_weightFloor {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) (hs : s.1.val.1.physical.process.ActiveWeightFloor cfg.directions) :
    RootObserverWeightFloor cfg (rootObserverInitial cfg p s) := ⟨hs,hs⟩

theorem rootObserverStep_weightFloor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (hs : RootObserverWeightFloor cfg s)
    (z : CandidateData n) : RootObserverWeightFloor cfg (rootObserverStep cfg ε M start p (s,z)) := by
  have hc : (observedStep cfg ε M start (s.1,z)).1.val.1.physical.process.ActiveWeightFloor cfg.directions :=
    augTimedStep_activeWeightFloor cfg ε M s.1.1 hs.1 z
  constructor
  · rw [rootObserverStep_projection]
    exact hc
  · by_cases hf : s.2.1=true
    · simpa only [rootObserverStep,if_pos hf] using hs.2
    · by_cases hclose : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
      · simpa only [rootObserverStep,if_neg hf,if_pos hclose] using
          rawStepSaved_activeWeightFloor cfg ε M start s.1 hs.1 z
      · simpa only [rootObserverStep,if_neg hf,if_neg hclose,savedObservation] using hc

theorem rootObserverRecycledPair_weightFloor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverWeightFloor cfg s)
    (k : ℕ) (ω : BoardClockPath n) :
    RootObserverWeightFloor cfg (rootObserverRecycledPair cfg ε M start p hn s k ω).1 := by
  induction k with
  | zero => exact hs
  | succ k ih => exact rootObserverStep_weightFloor cfg ε M start p _ ih _

theorem rootObserverTerminal_weightFloor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverWeightFloor cfg s)
    (ω : BoardClockPath n) :
    RootObserverWeightFloor cfg (rootObserverTerminalPair cfg ε M start p hn (s,ω)).1 :=
  rootObserverRecycledPair_weightFloor cfg ε M start p hn s hs _ ω

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.rawStepSaved_activeWeightFloor
#print axioms NoThreeLine.BirthWitness.rootObserverTerminal_weightFloor
