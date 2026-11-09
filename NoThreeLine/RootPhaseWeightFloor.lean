import NoThreeLine.RootFreezeWeightFloor
import NoThreeLine.RootPhaseMomentExpansion

/-! The actual saved root snapshot retains its active-weight floor through
artificial endpoint reopening and physical deadline closure. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.BirthWitness
open PrimitiveLines

def PhaseRootWeightFloor {n : ℕ} {B : ℝ} (Γ : Finset ZPoint)
    (s : PhaseRootObservation n B) : Prop :=
  s.1.1.val.physical.process.ActiveWeightFloor Γ ∧ s.2.2.1.physical.process.ActiveWeightFloor Γ

theorem phaseRootInitial_weightFloor {n : ℕ} {B : ℝ} (Γ : Finset ZPoint)
    (p : Grid n) (s : PhaseObservation n B) (hs : s.1.val.physical.process.ActiveWeightFloor Γ) :
    PhaseRootWeightFloor Γ (phaseRootInitial p s) := ⟨hs,hs⟩

theorem phaseRootStart_weightFloor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : PhaseRootObservation n cfg.B) (hs : PhaseRootWeightFloor cfg.directions s) :
    RootObserverWeightFloor cfg (phaseRootStart cfg ε M p s) := by
  unfold phaseRootStart
  split_ifs
  · exact ⟨hs.1,hs.2⟩
  · exact rootObserverInitial_weightFloor cfg p _ hs.1

theorem phaseRootEnd_weightFloor {n : ℕ} (cfg : FlowConfig n) (p : Grid n)
    (s : RootObservation cfg) (hs : RootObserverWeightFloor cfg s) :
    PhaseRootWeightFloor cfg.directions (phaseRootEnd cfg p s) := by
  dsimp only [phaseRootEnd]
  split_ifs
  · exact ⟨hs.1,hs.2⟩
  · exact ⟨hs.1,hs.1⟩

theorem phaseRootDeadline_weightFloor {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B) (hs : PhaseRootWeightFloor Γ s) :
    PhaseRootWeightFloor Γ (phaseRootDeadline p deadline t s) := by
  have hc : (observedDeadline deadline t s.1).1.val.physical.process.ActiveWeightFloor Γ :=
    augDeadline_activeWeightFloor Γ deadline t s.1.1 hs.1
  constructor
  · rw [phaseRootDeadline_projection]
    exact hc
  · by_cases hf : s.2.1=true
    · simpa only [phaseRootDeadline,if_pos hf] using hs.2
    · by_cases hclose : phaseRootClosed p (observedDeadline deadline t s.1)
      · simpa only [phaseRootDeadline,if_neg hf,if_pos hclose,phaseSaved] using hs.1
      · simpa only [phaseRootDeadline,if_neg hf,if_neg hclose,phaseSaved] using hc

theorem phaseRootRun_weightFloor {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (x : PhaseRootObservation n cfg.B×BoardClockPath n)
    (hx : PhaseRootWeightFloor cfg.directions x.1) :
    RootObserverWeightFloor cfg (phaseRootRun cfg ε M start p hn x).1 :=
  rootObserverTerminal_weightFloor cfg ε M start p hn _
    (phaseRootStart_weightFloor cfg ε M p x.1 hx) x.2

theorem phaseRootScheduledPair_weightFloor {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (j : ℕ) (x : PhaseRootObservation n B×BoardClockPath n)
    (hx : PhaseRootWeightFloor (cs j).directions x.1) :
    PhaseRootWeightFloor (cs j).directions (phaseRootScheduledPair cs ε M deadline start p hn j x).1 :=
  phaseRootDeadline_weightFloor (cs j).directions p deadline _ _
    (phaseRootEnd_weightFloor (cs j).config p _
      (phaseRootRun_weightFloor (cs j).config ε M _ p hn x hx))

theorem phaseRootPhases_weightFloor {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (s : PhaseRootObservation n B) (hs : PhaseRootWeightFloor Γ s) (k : ℕ) (ω : BoardClockPath n) :
    PhaseRootWeightFloor Γ (phaseRootPhases cs ε M deadline start p hn s k ω).1 := by
  induction k with
  | zero => exact hs
  | succ k ih =>
    simp only [phaseRootPhases]
    rw [←hΓ k] at ih ⊢
    exact phaseRootScheduledPair_weightFloor cs ε M deadline start p hn k _ ih

theorem initialRootPhaseWitness_activeWeightFloor {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (k : ℕ) (ω : BoardClockPath n) :
    (initialRootPhaseWitness cs ε M deadline start p hn hB e k ω).augmented.physical.process.ActiveWeightFloor Γ := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have hi : PhaseRootWeightFloor Γ s.val :=
    phaseRootInitial_weightFloor Γ p _ (augDeadline_activeWeightFloor Γ deadline start _
      (ProcessState.initial_activeWeightFloor n Γ))
  have hf := (phaseRootPhases_weightFloor cs ε M deadline start p hn Γ hΓ s.val hi k ω).2
  have he := congrArg Prod.fst (rootPhaseRecycledPair_projection cs ε M deadline start p hn s k ω)
  change (rootPhaseRecycledState cs ε M deadline start p hn s k ω).val = _ at he
  change (rootPhaseRecycledState cs ε M deadline start p hn s k ω).val.2.2.1.physical.process.ActiveWeightFloor Γ
  rw [he]
  exact hf

theorem initialRootPhaseWitness_active_weight_lower {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ) (k : ℕ) (ω : BoardClockPath n)
    (q : Grid n) (hq : ((initialRootPhaseWitness cs ε M deadline start p hn hB e k ω).augmented.physical.process.accounts q).status=.active) :
    (1/2:ℝ)^Γ.card ≤ ((initialRootPhaseWitness cs ε M deadline start p hn hB e k ω).augmented.physical.process.accounts q).weight :=
  ProcessState.activeWeightFloor_uniform _ Γ
    (initialRootPhaseWitness_activeWeightFloor cs ε M deadline start p hn hB e Γ hΓ k ω) q hq

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initialRootPhaseWitness_activeWeightFloor
#print axioms NoThreeLine.BirthWitness.initialRootPhaseWitness_active_weight_lower
