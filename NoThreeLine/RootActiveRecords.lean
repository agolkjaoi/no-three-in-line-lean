import NoThreeLine.RootPhaseRecords

/-! While the physical root remains active, saved and current birth
records agree. In a previously closed observer this uses actual global
stopping, not the false claim that a stopped root must be inactive. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.BirthWitness

def RootActiveRecords {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : RootObservation cfg) : Prop :=
  (s.1.1.val.1.physical.process.accounts p).status=.active → s.2.2.2=s.1.2

theorem rootObserverInitial_activeRecords {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : TimedObservation cfg) : RootActiveRecords cfg p (rootObserverInitial cfg p s) := fun _=>rfl

theorem rootObserverStep_activeRecords {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg p s) (hi : RootActiveRecords cfg p s) :
    RootActiveRecords cfg p (rootObserverStep cfg ε M start p (s,z)) := by
  intro ha
  have han : ((observedStep cfg ε M start (s.1,z)).1.val.1.physical.process.accounts p).status=.active := by
    simpa only [rootObserverStep_projection] using ha
  have hao : (s.1.1.val.1.physical.process.accounts p).status=.active :=
    (ProcessState.mem_activeEvents _ _).mp
      (observedStep_active_subset cfg ε M start (s.1,z) ((ProcessState.mem_activeEvents _ _).mpr han))
  by_cases hf : s.2.1=true
  · have hd : observationDone cfg s.1 := by
      rcases hs.closed_iff.mp hf with hd|hn
      · exact hd
      · exact (hn hao).elim
    simp only [rootObserverStep,if_pos hf,observedStep_frozen cfg ε M start (s.1,z) hd]
    exact hi hao
  · by_cases hc : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
    · simp only [rootObserverStep,if_neg hf,if_pos hc,rawStepSaved_records]
    · simp only [rootObserverStep,if_neg hf,if_neg hc,savedObservation]

theorem rootObserverRecycledPair_activeRecords {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverInvariant cfg p s)
    (hi : RootActiveRecords cfg p s) (k : ℕ) (ω : BoardClockPath n) :
    RootActiveRecords cfg p (rootObserverRecycledPair cfg ε M start p hn s k ω).1 := by
  induction k with
  | zero => exact hi
  | succ k ih =>
    exact rootObserverStep_activeRecords cfg ε M start p _ _
      (rootObserverRecycledPair_invariant cfg ε M start p hn s hs k ω) ih

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.rootObserverStep_activeRecords
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_activeRecords
