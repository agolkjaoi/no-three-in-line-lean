import NoThreeLine.VirtualHitTerminal

/-! A raw virtual hit itself supplies a finite completion witness. Thus
its saved-snapshot inclusion is pathwise, even on the total selector's
otherwise exceptional noncompletion inputs. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem rootObserverRecycledPair_physical_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (k : ℕ) (ω : BoardClockPath n) :
    ((rootObserverRecycledPair cfg ε M start p hn s k ω).1.1.1,
      (rootObserverRecycledPair cfg ε M start p hn s k ω).2)=augRecycledPair cfg ε M hn s.1.1 k ω :=
  (congrArg (fun v : TimedObservation cfg×BoardClockPath n=>(v.1.1,v.2))
    (rootObserverRecycledPair_projection cfg ε M start p hn s k ω)).trans
      (observedRecycledPair_base cfg ε M start hn s.1 k ω)

theorem virtualHitAt_terminal_exact {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverInvariant cfg q s)
    (hM : 0<M) (L : LineIndex n) (k : ℕ) (ω : BoardClockPath n)
    (hh : virtualHitAt cfg ε M start q hn s L k ω) :
    (rootObserverTerminal cfg ε M start q hn (s,ω)).1.1.val.1.physical.process.stopped=true ∧
    (rootObserverTerminal cfg ε M start q hn (s,ω)).2=
      (true,rawStepSaved cfg ε M start
        ((rootObserverRecycledPair cfg ε M start q hn s k ω).1.1,
          WinnerMarkLaw.firstMarkedRace hn (rootObserverRecycledPair cfg ε M start q hn s k ω).2)) := by
  let I := augRecycledCompletionIndex cfg ε M hn s.1.1 ω
  have hb (i : ℕ) := congrArg Prod.fst (rootObserverRecycledPair_physical_base cfg ε M start q hn s i ω)
  have hstop : (rootObserverRecycledPair cfg ε M start q hn s (k+1) ω).1.1.1.val.1.physical.process.stopped=true := by
    change (rootObserverStep cfg ε M start q _).1.1.val.1.physical.process.stopped=true
    rw [rootObserverStep_projection]
    exact virtualRawHit_stops cfg ε M start L q _ hh
  have hstop' : (augRecycledPair cfg ε M hn s.1.1 (k+1) ω).1.val.1.physical.process.stopped=true := by
    rw [←hb (k+1)]
    exact hstop
  have hdone := augRecycledTerminal_done_of_exists cfg ε M hn s.1.1 ω ⟨k+1,Or.inr hstop'⟩
  have hdI : AugTimedDone cfg (augRecycledPair cfg ε M hn s.1.1 I ω).1 := hdone
  have hI := augRecycledPair_absorbing cfg ε M hn s.1.1 ω I hdI (max I (k+1)) (le_max_left _ _)
  have hk := augRecycledPair_absorbing cfg ε M hn s.1.1 ω (k+1) (Or.inr hstop')
    (max I (k+1)) (le_max_right _ _)
  have hterstop : (rootObserverTerminal cfg ε M start q hn (s,ω)).1.1.val.1.physical.process.stopped=true := by
    change (rootObserverRecycledPair cfg ε M start q hn s I ω).1.1.1.val.1.physical.process.stopped=true
    rw [hb I,←hI,hk]
    exact hstop'
  have hf : (rootObserverTerminal cfg ε M start q hn (s,ω)).2.1=true :=
    (rootObserverTerminal_invariant cfg ε M start q hn (s,ω) hs).closed_iff.mpr (Or.inl (Or.inr hterstop))
  have hsave := rootObserverRecycledPair_frozen_stable cfg ε M start q hn s ω I hf
    (max I (k+1)) (le_max_left _ _)
  have hhit := virtualHitAt_snapshot_stable cfg ε M start q hn s hs hM L k ω hh
    (max I (k+1)) (le_max_right _ _)
  exact ⟨hterstop,hsave.symm.trans hhit⟩

theorem virtualHitEvent_terminal_snapshot {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (hn : 0<n) (s : RootObservation cfg) (hs : RootObserverInvariant cfg q s)
    (hM : 0<M) (L : LineIndex n) (ω : BoardClockPath n)
    (hh : ω∈virtualHitEvent cfg ε M start q hn s L) :
    (rootObserverTerminal cfg ε M start q hn (s,ω)).1.1.val.1.physical.process.stopped=true ∧
    M≤virtualMass (rootObserverTerminal cfg ε M start q hn (s,ω)).2.2.1.physical.process
      cfg.directions (rootObserverTerminal cfg ε M start q hn (s,ω)).2.2.1.physical.coordinates L q := by
  obtain ⟨k,hk⟩ := hh
  have he := virtualHitAt_terminal_exact cfg ε M start q hn s hs hM L k ω hk
  refine ⟨he.1,?_⟩
  rw [he.2]
  exact hk.2

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.virtualHitAt_terminal_exact
#print axioms NoThreeLine.BirthWitness.virtualHitEvent_terminal_snapshot
