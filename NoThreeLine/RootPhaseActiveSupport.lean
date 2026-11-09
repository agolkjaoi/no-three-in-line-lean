import NoThreeLine.RootPhasePointLaw
import NoThreeLine.RootFreezeActiveSupport

/-! An initially active root has zero saved credit whenever its saved
snapshot is inactive, across every real phase boundary. Thus the existing
phase point measure is supported on active saved snapshots. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def PhaseRootSavedActiveSupport {n : ℕ} {B : ℝ} (p : Grid n) (s : PhaseRootObservation n B) : Prop :=
  (s.2.2.1.physical.process.accounts p).status≠.active →
    (s.2.2.1.physical.process.accounts p).credit=0

theorem rootObserverRecycledPair_active_support_of_invariant {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (hp : RootSavedActiveSupport cfg p s)
    (k : ℕ) (ω : BoardClockPath n) :
    RootSavedActiveSupport cfg p (rootObserverRecycledPair cfg ε M start p hn s k ω).1 := by
  induction k with
  | zero => exact hp
  | succ k ih =>
    exact rootObserverStep_active_support cfg ε M start p _ _
      (rootObserverRecycledPair_invariant cfg ε M start p hn s hs k ω) ih

theorem phaseRootBoundary_active_support {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (hp : RootSavedActiveSupport cfg p s) :
    PhaseRootSavedActiveSupport p (phaseRootBoundary cfg p deadline t s) := by
  have he : PhaseRootSavedActiveSupport p (phaseRootEnd cfg p s) := by
    dsimp only [phaseRootEnd]
    split_ifs with hc
    · exact hp
    · intro hi
      exact False.elim (hc (Or.inr hi))
  let u := phaseRootEnd cfg p s
  have hu : PhaseRootInvariant p u := phaseRootEnd_invariant cfg p s hs
  change PhaseRootSavedActiveSupport p (phaseRootDeadline p deadline t u)
  dsimp only [phaseRootDeadline]
  split_ifs with hf hc
  · exact he
  · intro hi
    exact False.elim (hf (hu.closed_iff.mpr (Or.inr hi)))
  · intro hi
    exact False.elim (hc (Or.inr hi))

theorem phaseRootScheduledPair_active_support {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x : PhaseRootObservation n B×BoardClockPath n) (hx : PhaseRootInvariant p x.1)
    (hp : PhaseRootSavedActiveSupport p x.1) :
    PhaseRootSavedActiveSupport p (phaseRootScheduledPair cs ε M deadline start p hn j x).1 := by
  have hs : RootSavedActiveSupport (cs j).config p (phaseRootStart (cs j).config ε M p x.1) := by
    unfold RootSavedActiveSupport
    rw [phaseRootStart_saved (cs j).config ε M p x.1 hx]
    exact hp
  have hh := rootObserverRecycledPair_active_support_of_invariant (cs j).config ε M (phaseEndpoint cs start j) p hn
    (phaseRootStart (cs j).config ε M p x.1) (phaseRootStart_invariant (cs j).config ε M p x.1 hx) hs
    (augRecycledCompletionIndex (cs j).config ε M hn (phaseRootStart (cs j).config ε M p x.1).1.1 x.2) x.2
  exact phaseRootBoundary_active_support (cs j).config p deadline (phaseEndpoint cs start (j+1))
    (phaseRootRun (cs j).config ε M (phaseEndpoint cs start j) p hn x).1
    (phaseRootRun_invariant (cs j).config ε M (phaseEndpoint cs start j) p hn x hx) hh

theorem phaseRootPhases_active_support {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s) (hp : PhaseRootSavedActiveSupport p s)
    (k : ℕ) (ω : BoardClockPath n) :
    PhaseRootSavedActiveSupport p (phaseRootPhases cs ε M deadline start p hn s k ω).1 := by
  induction k with
  | zero => exact hp
  | succ k ih =>
    exact phaseRootScheduledPair_active_support cs ε M deadline start p hn k _
      (phaseRootPhases_invariant cs ε M deadline start p hn s hs k ω) ih

theorem initial_rootPhaseWitness_inactive_credit_zero {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active)
    (k : ℕ) (ω : BoardClockPath n)
    (hi : ((rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω).augmented.physical.process.accounts p).status≠.active) :
    ((rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω).augmented.physical.process.accounts p).credit=0 := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have hproj := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>r.1)
    (rootPhaseRecycledPair_projection cs ε M deadline start p hn s k ω)
  change (rootPhaseRecycledState cs ε M deadline start p hn s k ω).val=
    (phaseRootPhases cs ε M deadline start p hn s.val k ω).1 at hproj
  have hinit : PhaseRootSavedActiveSupport p s.val := fun h=>False.elim (h hp)
  have hh := phaseRootPhases_active_support cs ε M deadline start p hn s.val s.property.1 hinit k ω
  rw [←hproj] at hh
  exact hh hi

theorem initial_rootPhasePoint_active_ae {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active) (k : ℕ) :
    ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB p k,
      ((rootPhaseWitness cs ε M deadline start p hn e
        (initialGoodPhaseRootObservation B hB p deadline start) k ω).augmented.physical.process.accounts p).status=.active := by
  have hpos : ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB p k,0<phasePointCredit cs ε M deadline start hn hB p k ω :=
    savedCreditMeasure_positive_ae _ _ (phasePointCredit_measurable cs ε M deadline start hn hB p k)
  filter_upwards [hpos] with ω hω
  by_contra hi
  have hz := initial_rootPhaseWitness_inactive_credit_zero cs ε M deadline start p hn hB e hp k ω hi
  rw [initial_rootPhaseWitness_credit] at hz
  exact (ne_of_gt hω) hz

theorem initial_rootPhasePoint_witness_mean_eq {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hp : ((augInitialState B hB deadline start).val.physical.process.accounts p).status=.active)
    (D : Finset (Grid n)) (k : ℕ) :
    (∫ω,witnessProduct D (rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k)=
      ∫ω,activeWitness D p (rootPhaseWitness cs ε M deadline start p hn e
        (initialGoodPhaseRootObservation B hB p deadline start) k ω) ∂phasePointMeasure cs ε M deadline start hn hB p k := by
  apply integral_congr_ae
  filter_upwards [initial_rootPhasePoint_active_ae cs ε M deadline start p hn hB e hp k] with ω hω
  simp only [activeWitness,if_pos hω]

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseRootPhases_active_support
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_active_ae
#print axioms NoThreeLine.BirthWitness.initial_rootPhasePoint_witness_mean_eq
