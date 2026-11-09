import NoThreeLine.RootPhasePointLaw
import NoThreeLine.RootFreezeEta

/-! The actual and saved eta floors are propagated together through
physical phases, artificial reopenings and real deadline retirements. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
namespace NoThreeLine.BirthWitness

def PhaseRootEtaLower {n : ℕ} {B : ℝ} (ε : ℝ) (a b : Grid n) (s : PhaseRootObservation n B) : Prop :=
  1-ε≤s.1.1.val.eta a b ∧ 1-ε≤s.2.2.1.eta a b

theorem phaseRootBoundary_eta_lower {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (deadline : Grid n→ℝ) (t ε : ℝ) (a b : Grid n) (s : RootObservation cfg)
    (ha : 1-ε≤s.1.1.val.1.eta a b) (hs : 1-ε≤s.2.2.1.eta a b) :
    PhaseRootEtaLower ε a b (phaseRootBoundary cfg p deadline t s) := by
  have he : PhaseRootEtaLower ε a b (phaseRootEnd cfg p s) := by
    dsimp only [phaseRootEnd]
    split_ifs
    · exact ⟨ha,hs⟩
    · exact ⟨ha,ha⟩
  let u := phaseRootEnd cfg p s
  have hd : 1-ε≤(observedDeadline deadline t u.1).1.val.eta a b := by
    change 1-ε≤(augValidDeadlineRetirement deadline t u.1.1).val.eta a b
    rw [augValidDeadlineRetirement_eta]
    exact he.1
  change PhaseRootEtaLower ε a b (phaseRootDeadline p deadline t u)
  dsimp only [phaseRootDeadline]
  split_ifs
  · exact ⟨hd,he.2⟩
  · exact ⟨hd,he.1⟩
  · exact ⟨hd,hd⟩

theorem phaseRootScheduledPair_eta_lower {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (j : ℕ)
    (x : PhaseRootObservation n B×BoardClockPath n) (hx : PhaseRootInvariant p x.1)
    (a b : Grid n) (hab : a≠b) (hη : PhaseRootEtaLower ε a b x.1) :
    PhaseRootEtaLower ε a b (phaseRootScheduledPair cs ε M deadline start p hn j x).1 := by
  have ha : 1-ε≤(phaseRootStart (cs j).config ε M p x.1).1.1.val.1.eta a b := by
    rw [phaseRootStart_projection]
    exact hη.1
  have hs : 1-ε≤(phaseRootStart (cs j).config ε M p x.1).2.2.1.eta a b := by
    rw [phaseRootStart_saved (cs j).config ε M p x.1 hx]
    exact hη.2
  have hh := rootObserverRecycledPair_eta_lower (cs j).config ε M (phaseEndpoint cs start j) p hn
    (phaseRootStart (cs j).config ε M p x.1) a b hab ha hs
    (augRecycledCompletionIndex (cs j).config ε M hn (phaseRootStart (cs j).config ε M p x.1).1.1 x.2) x.2
  exact phaseRootBoundary_eta_lower (cs j).config p deadline (phaseEndpoint cs start (j+1)) ε a b
    (phaseRootRun (cs j).config ε M (phaseEndpoint cs start j) p hn x).1 hh.1 hh.2

theorem phaseRootPhases_eta_lower {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n)
    (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s)
    (a b : Grid n) (hab : a≠b) (hη : PhaseRootEtaLower ε a b s) (k : ℕ) (ω : BoardClockPath n) :
    PhaseRootEtaLower ε a b (phaseRootPhases cs ε M deadline start p hn s k ω).1 := by
  induction k with
  | zero => exact hη
  | succ k ih =>
    exact phaseRootScheduledPair_eta_lower cs ε M deadline start p hn k _
      (phaseRootPhases_invariant cs ε M deadline start p hn s hs k ω) a b hab ih

theorem rootPhaseWitness_eta_lower {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (e : Retention n)
    (s : GoodPhaseRootObservation n B p) (a b : Grid n) (hab : a≠b)
    (hη : PhaseRootEtaLower ε a b s.val) (k : ℕ) (ω : BoardClockPath n) :
    1-ε≤(rootPhaseWitness cs ε M deadline start p hn e s k ω).augmented.eta a b := by
  have hp := congrArg (fun r : PhaseRootObservation n B×BoardClockPath n=>r.1)
    (rootPhaseRecycledPair_projection cs ε M deadline start p hn s k ω)
  change (rootPhaseRecycledState cs ε M deadline start p hn s k ω).val=
    (phaseRootPhases cs ε M deadline start p hn s.val k ω).1 at hp
  change 1-ε≤(rootPhaseRecycledState cs ε M deadline start p hn s k ω).val.2.2.1.eta a b
  rw [hp]
  exact (phaseRootPhases_eta_lower cs ε M deadline start p hn s.val s.property.1 a b hab hη k ω).2

theorem initial_rootPhaseWitness_eta_lower {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (hε : 0≤ε) (a b : Grid n) (hab : a≠b) (k : ℕ) (ω : BoardClockPath n) :
    1-ε≤(rootPhaseWitness cs ε M deadline start p hn e
      (initialGoodPhaseRootObservation B hB p deadline start) k ω).augmented.eta a b := by
  apply rootPhaseWitness_eta_lower cs ε M deadline start p hn e _ a b hab _ k ω
  have hh : 1-ε≤(augInitialState B hB deadline start).val.eta a b := by
    rw [augInitialState_eta]
    linarith
  exact ⟨hh,hh⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseRootPhases_eta_lower
#print axioms NoThreeLine.BirthWitness.initial_rootPhaseWitness_eta_lower
