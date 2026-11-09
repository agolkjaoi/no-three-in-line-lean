import NoThreeLine.RootPhaseReopen
import NoThreeLine.RootFreezeTerminal
import NoThreeLine.ObservedRecycledPhases

/-! An actual finite-phase root observer on the same original board. The
observer reopens only at artificial endpoints, applies the real deadline
operation, and retains the complete snapshot upon permanent root closure.
The physical state, eta, birth records and residual board are unchanged. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def phaseRootInitial {n : ℕ} {B : ℝ} (p : Grid n) (s : PhaseObservation n B) : PhaseRootObservation n B :=
  (s,(if phaseRootClosed p s then true else false),phaseSaved s)

theorem phaseRootInitial_measurable {n : ℕ} {B : ℝ} (p : Grid n) :
    Measurable (phaseRootInitial (B:=B) p) :=
  measurable_id.prodMk ((Measurable.ite (phaseRootClosed_measurable p).setOf measurable_const measurable_const).prodMk
    phaseSaved_measurable)

theorem phaseRootInitial_invariant {n : ℕ} {B : ℝ} (p : Grid n) (s : PhaseObservation n B)
    (hs : PhaseRecordsConsistent s) : PhaseRootInvariant p (phaseRootInitial p s) := by
  refine ⟨hs,phaseSaved_valid s hs,?_,fun _=>rfl,rfl⟩
  change (if phaseRootClosed p s then true else false)=true ↔ phaseRootClosed p s
  by_cases hc : phaseRootClosed p s <;> simp [hc]

def phaseRootRun {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : PhaseRootObservation n cfg.B×BoardClockPath n) : RootObservation cfg×BoardClockPath n :=
  rootObserverTerminalPair cfg ε M start p hn (phaseRootStart cfg ε M p x.1,x.2)

theorem phaseRootRun_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n) :
    Measurable (phaseRootRun cfg ε M start p hn) :=
  (rootObserverTerminalPair_measurable cfg ε M start p hn).comp
    (((phaseRootStart_measurable cfg ε M p).comp measurable_fst).prodMk measurable_snd)

theorem phaseRootRun_invariant {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : PhaseRootObservation n cfg.B×BoardClockPath n) (hx : PhaseRootInvariant p x.1) :
    RootObserverInvariant cfg p (phaseRootRun cfg ε M start p hn x).1 :=
  rootObserverTerminal_invariant cfg ε M start p hn _ (phaseRootStart_invariant cfg ε M p x.1 hx)

theorem phaseRootRun_reopenBound {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (e : Retention n) (x : PhaseRootObservation n cfg.B×BoardClockPath n) (hx : PhaseRootInvariant p x.1) :
    RootReopenBound cfg p e (phaseRootRun cfg ε M start p hn x).1 :=
  rootObserverRecycledPair_reopenBound cfg ε M start p e hn _
    (phaseRootStart_invariant cfg ε M p x.1 hx) (phaseRootStart_reopenBound cfg ε M p e x.1 hx) _ x.2

theorem phaseRootRun_projection {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (p : Grid n) (hn : 0<n)
    (x : PhaseRootObservation n cfg.B×BoardClockPath n) :
    (observedTimedProjection cfg (phaseRootRun cfg ε M start p hn x).1.1,
      (phaseRootRun cfg ε M start p hn x).2)=
      observedPhaseRecycledPair cfg ε M start hn (x.1.1,x.2) := by
  have hh := rootObserverTerminalPair_projection cfg ε M start p hn (phaseRootStart cfg ε M p x.1,x.2)
  rw [phaseRootStart_projection] at hh
  exact congrArg (fun r : TimedObservation cfg×BoardClockPath n=>(observedTimedProjection cfg r.1,r.2)) hh

def phaseRootScheduledPair {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x : PhaseRootObservation n B×BoardClockPath n) : PhaseRootObservation n B×BoardClockPath n :=
  let r := phaseRootRun (cs j).config ε M (phaseEndpoint cs start j) p hn x
  (phaseRootBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1)) r.1,r.2)

theorem phaseRootScheduledPair_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ) :
    Measurable (phaseRootScheduledPair cs ε M deadline start p hn j) := by
  have hr := phaseRootRun_measurable (cs j).config ε M (phaseEndpoint cs start j) p hn
  exact ((phaseRootBoundary_measurable (cs j).config p deadline _).comp hr.fst).prodMk hr.snd

theorem phaseRootScheduledPair_invariant {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x : PhaseRootObservation n B×BoardClockPath n) (hx : PhaseRootInvariant p x.1) :
    PhaseRootInvariant p (phaseRootScheduledPair cs ε M deadline start p hn j x).1 :=
  phaseRootBoundary_invariant (cs j).config p deadline _ _
    (phaseRootRun_invariant (cs j).config ε M _ p hn x hx)

theorem phaseRootScheduledPair_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x : PhaseRootObservation n B×BoardClockPath n) :
    ((phaseRootScheduledPair cs ε M deadline start p hn j x).1.1,
      (phaseRootScheduledPair cs ε M deadline start p hn j x).2)=
      observedScheduledPair cs ε M deadline start hn j (x.1.1,x.2) := by
  change ((phaseRootBoundary (cs j).config p deadline (phaseEndpoint cs start (j+1))
    (phaseRootRun (cs j).config ε M (phaseEndpoint cs start j) p hn x).1).1,_)=_
  rw [phaseRootBoundary_projection]
  exact congrArg (fun r : PhaseObservation n B×BoardClockPath n=>
    (observedDeadline deadline (phaseEndpoint cs start (j+1)) r.1,r.2))
      (phaseRootRun_projection (cs j).config ε M (phaseEndpoint cs start j) p hn x)

theorem phaseRootScheduledPair_mixed_le_terminal {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (e : Retention n) (C D L : Finset (Grid n)) (x : PhaseRootObservation n B×BoardClockPath n)
    (hx : PhaseRootInvariant p x.1) :
    mixed (cs j).directions C D L
      (savedWitness e (phaseRootScheduledPair cs ε M deadline start p hn j x).1.2.2)≤
      mixed (cs j).directions C D L
        (savedWitness e (phaseRootRun (cs j).config ε M (phaseEndpoint cs start j) p hn x).1.2.2) :=
  phaseRootBoundary_mixed_le (cs j).config p deadline _ e _
    (phaseRootRun_invariant (cs j).config ε M _ p hn x hx)
    (phaseRootRun_reopenBound (cs j).config ε M _ p hn e x hx) C D L

def phaseRootPhases {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (s : PhaseRootObservation n B) :
    ℕ→BoardClockPath n→PhaseRootObservation n B×BoardClockPath n
  | 0,ω=>(s,ω)
  | k+1,ω=>phaseRootScheduledPair cs ε M deadline start p hn k (phaseRootPhases cs ε M deadline start p hn s k ω)

theorem phaseRootPhases_joint_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (k : ℕ) :
    Measurable (fun x : PhaseRootObservation n B×BoardClockPath n=>
      phaseRootPhases cs ε M deadline start p hn x.1 k x.2) := by
  induction k with
  | zero => exact measurable_id
  | succ k ih => exact (phaseRootScheduledPair_measurable cs ε M deadline start p hn k).comp ih

theorem phaseRootPhases_invariant {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (s : PhaseRootObservation n B)
    (hs : PhaseRootInvariant p s) (k : ℕ) (ω : BoardClockPath n) :
    PhaseRootInvariant p (phaseRootPhases cs ε M deadline start p hn s k ω).1 := by
  induction k with
  | zero => exact hs
  | succ k ih => exact phaseRootScheduledPair_invariant cs ε M deadline start p hn k _ ih

theorem phaseRootPhases_projection {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (s : PhaseRootObservation n B)
    (k : ℕ) (ω : BoardClockPath n) :
    ((phaseRootPhases cs ε M deadline start p hn s k ω).1.1,
      (phaseRootPhases cs ε M deadline start p hn s k ω).2)=
      (observedRecycledPhaseState cs ε M deadline start hn s.1 k ω,
        (observedRecycledPhases cs ε M deadline start hn s.1 k ω).2) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change ((phaseRootScheduledPair cs ε M deadline start p hn k _).1.1,
      (phaseRootScheduledPair cs ε M deadline start p hn k _).2)=_
    rw [phaseRootScheduledPair_projection,ih]
    simp only [observedRecycledPhaseState,observedRecycledPhases_succ]

theorem phaseRootPhases_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (s : PhaseRootObservation n B)
    (hs : PhaseRootInvariant p s) (k : ℕ) (ω : BoardClockPath n) :
    ((phaseRootPhases cs ε M deadline start p hn s k ω).1.2.2.1.physical.process.accounts p).credit=
      validAugStateCredit B p (observedRecycledPhaseState cs ε M deadline start hn s.1 k ω).1 := by
  have hi := (phaseRootPhases_invariant cs ε M deadline start p hn s hs k ω).credit
  have hp := congrArg Prod.fst (phaseRootPhases_projection cs ε M deadline start p hn s k ω)
  change _=( (observedRecycledPhaseState cs ε M deadline start hn s.1 k ω).1.val.physical.process.accounts p).credit
  simp only [Prod.fst] at hp
  rw [←hp]
  exact hi

theorem phaseRootPhases_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 0<B)
    (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s) (k : ℕ) :
    (∫ω,((phaseRootPhases cs ε M deadline start p hn s k ω).1.2.2.1.physical.process.accounts p).credit
      ∂boardClockMeasure n (B/n))=(s.1.1.val.physical.process.accounts p).credit := by
  simp_rw [phaseRootPhases_credit cs ε M deadline start p hn s hs k]
  exact observedRecycledPhaseState_expected_credit cs ε M deadline start hn hB s.1 k p

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.phaseRootScheduledPair_mixed_le_terminal
#print axioms NoThreeLine.BirthWitness.phaseRootPhases_joint_measurable
#print axioms NoThreeLine.BirthWitness.phaseRootPhases_projection
#print axioms NoThreeLine.BirthWitness.phaseRootPhases_expected_credit
