import NoThreeLine.RootPhaseProcess

/-! Permanent root closure cannot reopen at later phase boundaries. The
horizon-only flag is deliberately different. These are exact pathwise
facts about the constructed observer and its unchanged physical process. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

theorem observedStep_permanentRootClosed {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : TimedObservation cfg) (z : CandidateData n)
    (hs : phaseRootClosed p (observedTimedProjection cfg s)) :
    phaseRootClosed p (observedTimedProjection cfg (observedStep cfg ε M start (s,z))) := by
  rcases hs with hstop | hi
  · rw [observedStep_frozen cfg ε M start (s,z) (Or.inr hstop)]
    exact Or.inl hstop
  · right
    intro ha
    exact hi ((ProcessState.mem_activeEvents _ _).mp
      (observedStep_active_subset cfg ε M start (s,z) ((ProcessState.mem_activeEvents _ _).mpr ha)))

theorem rootObserverRecycledPair_permanentRootClosed {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : phaseRootClosed p (observedTimedProjection cfg s.1)) (k : ℕ) (ω : BoardClockPath n) :
    phaseRootClosed p (observedTimedProjection cfg (rootObserverRecycledPair cfg ε M start p hn s k ω).1.1) := by
  induction k with
  | zero => exact hs
  | succ k ih =>
    change phaseRootClosed p (observedTimedProjection cfg (rootObserverStep cfg ε M start p _).1)
    rw [rootObserverStep_projection]
    exact observedStep_permanentRootClosed cfg ε M start p _ _ ih

theorem rootObserverTerminal_preserves_frozen {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg) (hf : s.2.1=true) (ω : BoardClockPath n) :
    (rootObserverTerminal cfg ε M start p hn (s,ω)).2=s.2 :=
  rootObserverRecycledPair_frozen_stable cfg ε M start p hn s ω 0 hf _ (Nat.zero_le _)

theorem phaseRootRun_permanentRootClosed {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : PhaseRootObservation n cfg.B×BoardClockPath n)
    (hx : PhaseRootInvariant p x.1) (hf : x.1.2.1=true) :
    phaseRootClosed p (observedTimedProjection cfg (phaseRootRun cfg ε M start p hn x).1.1) := by
  apply rootObserverRecycledPair_permanentRootClosed cfg ε M start p hn
  rw [phaseRootStart_projection]
  exact hx.closed_iff.mp hf

theorem phaseRootBoundary_permanent {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : RootObservation cfg)
    (hc : phaseRootClosed p (observedTimedProjection cfg s.1)) :
    (phaseRootBoundary cfg p deadline t s).2=(true,s.2.2) := by
  simp only [phaseRootBoundary,phaseRootEnd,if_pos hc,phaseRootDeadline,ite_true]

theorem phaseRootScheduledPair_preserves_permanent {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x : PhaseRootObservation n B×BoardClockPath n) (hx : PhaseRootInvariant p x.1)
    (hf : x.1.2.1=true) :
    (phaseRootScheduledPair cs ε M deadline start p hn j x).1.2=x.1.2 := by
  have hc := phaseRootRun_permanentRootClosed (cs j).config ε M (phaseEndpoint cs start j) p hn x hx hf
  have hstart : (phaseRootStart (cs j).config ε M p x.1).2.1=true := by
    simp only [phaseRootStart,if_pos hf]
  have hsave := congrArg Prod.snd (rootObserverTerminal_preserves_frozen (cs j).config ε M
    (phaseEndpoint cs start j) p hn (phaseRootStart (cs j).config ε M p x.1) hstart x.2)
  rw [phaseRootStart_saved (cs j).config ε M p x.1 hx] at hsave
  change (phaseRootBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1))
    (phaseRootRun (cs j).config ε M (phaseEndpoint cs start j) p hn x).1).2=x.1.2
  rw [phaseRootBoundary_permanent _ _ _ _ _ hc]
  change (true,(rootObserverTerminal (cs j).config ε M (phaseEndpoint cs start j) p hn
    (phaseRootStart (cs j).config ε M p x.1,x.2)).2.2)=x.1.2
  rw [hsave]
  exact Prod.ext hf.symm rfl

theorem phaseRootPhases_permanent_stable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (s : PhaseRootObservation n B)
    (hs : PhaseRootInvariant p s) (ω : BoardClockPath n) (k : ℕ)
    (hk : (phaseRootPhases cs ε M deadline start p hn s k ω).1.2.1=true) :
    ∀j,k≤j→(phaseRootPhases cs ε M deadline start p hn s j ω).1.2=
      (phaseRootPhases cs ε M deadline start p hn s k ω).1.2 := by
  intro j hj
  induction j, hj using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    exact (phaseRootScheduledPair_preserves_permanent cs ε M deadline start p hn j _
      (phaseRootPhases_invariant cs ε M deadline start p hn s hs j ω)
      (by rw [ih]; exact hk)).trans ih

theorem phaseRootDeadline_firstClosure {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B) (hf : s.2.1=false)
    (hc : phaseRootClosed p (observedDeadline deadline t s.1)) :
    (phaseRootDeadline p deadline t s).2=(true,phaseSaved s.1) := by
  simp only [phaseRootDeadline,hf,Bool.false_eq_true,if_false,if_pos hc]

theorem phaseRootStart_open {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (p : Grid n)
    (s : PhaseRootObservation n cfg.B) (hs : PhaseRootInvariant p s) (hf : s.2.1=false)
    (hH : 0<(cfg.horizon:ℝ)) :
    (phaseRootStart cfg ε M p s).2.1=false := by
  have hp : ¬phaseRootClosed p s.1 := by
    intro h
    have hh := hs.closed_iff.mpr h
    rw [hf] at hh
    exact Bool.noConfusion hh
  have hc : ¬rootClosed cfg p (observedPhaseStart cfg ε M s.1) := by
    rw [observedPhaseStart_rootClosed]
    exact not_or.mpr ⟨not_le.mpr hH,hp⟩
  simp only [phaseRootStart,hf,Bool.false_eq_true,if_false,rootObserverInitial,if_neg hc]


theorem phaseRootStart_firstClosure_snapshot {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n)
    (s : PhaseRootObservation n cfg.B) (hs : PhaseRootInvariant p s) (hf : s.2.1=false)
    (hH : 0<(cfg.horizon:ℝ)) (z : CandidateData n)
    (hc : rootClosed cfg p (observedStep cfg ε M start ((phaseRootStart cfg ε M p s).1,z))) :
    (rootObserverStep cfg ε M start p (phaseRootStart cfg ε M p s,z)).2=
      (true,rawStepSaved cfg ε M start (observedPhaseStart cfg ε M s.1,z)) := by
  rw [rootObserverStep_first_closure cfg ε M start p _ (phaseRootStart_open cfg ε M p s hs hf hH) hc]
  rw [phaseRootStart_projection]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseRootScheduledPair_preserves_permanent
#print axioms NoThreeLine.BirthWitness.phaseRootPhases_permanent_stable
#print axioms NoThreeLine.BirthWitness.phaseRootDeadline_firstClosure
#print axioms NoThreeLine.BirthWitness.phaseRootStart_open

#print axioms NoThreeLine.BirthWitness.phaseRootStart_firstClosure_snapshot
