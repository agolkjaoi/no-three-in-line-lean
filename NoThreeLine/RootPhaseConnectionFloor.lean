import NoThreeLine.RootSnapshotLineDomain
import NoThreeLine.RootPhaseMomentExpansion

/-! A physical guard-derived connection floor at the canonical full-phase
saved root snapshot, including raw pre-resolution snapshots. The physical
deadlines and the original board are unchanged. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection

def PhaseRootLineDomain {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (K ρ : ℝ)
    (s : PhaseRootObservation n B) : Prop :=
  LineConnectionDomain Γ K ρ s.1.1.val.physical ∧ LineConnectionDomain Γ K ρ s.2.2.1.physical

theorem phaseRootInitial_lineDomain {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (K ρ : ℝ)
    (p : Grid n) (s : PhaseObservation n B) (hs : LineConnectionDomain Γ K ρ s.1.val.physical) :
    PhaseRootLineDomain Γ K ρ (phaseRootInitial p s) := ⟨hs,hs⟩

theorem phaseRootStart_lineDomain {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ)
    (p : Grid n) (s : PhaseRootObservation n cfg.B) (hs : PhaseRootLineDomain cfg.directions K ρ s) :
    RootObserverLineDomain cfg K ρ (phaseRootStart cfg ε M p s) := by
  unfold phaseRootStart
  split_ifs
  · exact ⟨hs.1,hs.2⟩
  · exact rootObserverInitial_lineDomain cfg K ρ p _ hs.1

theorem phaseRootEnd_lineDomain {n : ℕ} (cfg : FlowConfig n) (K ρ : ℝ) (p : Grid n)
    (s : RootObservation cfg) (hs : RootObserverLineDomain cfg K ρ s) :
    PhaseRootLineDomain cfg.directions K ρ (phaseRootEnd cfg p s) := by
  dsimp only [phaseRootEnd]
  split_ifs
  · exact ⟨hs.1,hs.2⟩
  · exact ⟨hs.1,hs.1⟩

theorem phaseRootDeadline_lineDomain {n : ℕ} {B : ℝ} (Γ : Finset ZPoint) (K ρ : ℝ)
    (p : Grid n) (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B)
    (hs : PhaseRootLineDomain Γ K ρ s) :
    PhaseRootLineDomain Γ K ρ (phaseRootDeadline p deadline t s) := by
  have hc : LineConnectionDomain Γ K ρ (observedDeadline deadline t s.1).1.val.physical :=
    ⟨emptyLineCredit_augValidDeadlineRetirement deadline t s.1.1 hs.1.1,
      augDeadline_activeLineGuardBounds Γ K ρ deadline t s.1.1 hs.1.2⟩
  constructor
  · rw [phaseRootDeadline_projection]
    exact hc
  · by_cases hf : s.2.1=true
    · simpa only [phaseRootDeadline,if_pos hf] using hs.2
    · by_cases hclose : phaseRootClosed p (observedDeadline deadline t s.1)
      · simpa only [phaseRootDeadline,if_neg hf,if_pos hclose,phaseSaved] using hs.1
      · simpa only [phaseRootDeadline,if_neg hf,if_neg hclose,phaseSaved] using hc

theorem phaseRootRun_lineDomain {n : ℕ} (cfg : FlowConfig n) (ε M start K ρ : ℝ)
    (hK : cfg.K≤K) (hρ : ρ≤cfg.rho) (hρ1 : ρ≤1)
    (p : Grid n) (hn : 0<n) (x : PhaseRootObservation n cfg.B×BoardClockPath n)
    (hx : PhaseRootLineDomain cfg.directions K ρ x.1) :
    RootObserverLineDomain cfg K ρ (phaseRootRun cfg ε M start p hn x).1 :=
  rootObserverTerminal_lineDomain cfg ε M start K ρ hK hρ hρ1 p hn _
    (phaseRootStart_lineDomain cfg ε M K ρ p x.1 hx) x.2

theorem phaseRootScheduledPair_lineDomain {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ : ℝ)
    (p : Grid n) (hn : 0<n) (j : ℕ) (hK : (cs j).K≤K) (hρ : ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (x : PhaseRootObservation n B×BoardClockPath n) (hx : PhaseRootLineDomain (cs j).directions K ρ x.1) :
    PhaseRootLineDomain (cs j).directions K ρ (phaseRootScheduledPair cs ε M deadline start p hn j x).1 :=
  phaseRootDeadline_lineDomain (cs j).directions K ρ p deadline _ _
    (phaseRootEnd_lineDomain (cs j).config K ρ p _
      (phaseRootRun_lineDomain (cs j).config ε M _ K ρ hK hρ hρ1 p hn x hx))

theorem phaseRootPhases_lineDomain {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ : ℝ)
    (p : Grid n) (hn : 0<n) (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (s : PhaseRootObservation n B) (hs : PhaseRootLineDomain Γ K ρ s) (k : ℕ) (ω : BoardClockPath n) :
    PhaseRootLineDomain Γ K ρ (phaseRootPhases cs ε M deadline start p hn s k ω).1 := by
  induction k with
  | zero => exact hs
  | succ k ih =>
    simp only [phaseRootPhases]
    rw [←hΓ k] at ih ⊢
    exact phaseRootScheduledPair_lineDomain cs ε M deadline start K ρ p hn k (hK k) (hρ k) hρ1 _ ih

theorem initialRootPhaseWitness_lineDomain {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (hK0 : 0≤K)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1) (k : ℕ) (ω : BoardClockPath n) :
    LineConnectionDomain Γ K ρ (initialRootPhaseWitness cs ε M deadline start p hn hB e k ω).augmented.physical := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have hi : PhaseRootLineDomain Γ K ρ s.val :=
    phaseRootInitial_lineDomain Γ K ρ p _
      ⟨emptyLineCredit_augInitialState B hB deadline start,
        augDeadline_activeLineGuardBounds Γ K ρ deadline start _ (activeLineGuardBounds_initial n Γ K ρ hK0)⟩
  have hf := (phaseRootPhases_lineDomain cs ε M deadline start K ρ p hn Γ hΓ hK hρ hρ1 s.val hi k ω).2
  have he := congrArg Prod.fst (rootPhaseRecycledPair_projection cs ε M deadline start p hn s k ω)
  change (rootPhaseRecycledState cs ε M deadline start p hn s k ω).val = _ at he
  change LineConnectionDomain Γ K ρ (rootPhaseRecycledState cs ε M deadline start p hn s k ω).val.2.2.1.physical
  rw [he]
  exact hf

theorem initialRootPhaseWitness_connection_lower {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start K ρ δ : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (e : Retention n) (hK0 : 0≤K) (hK2 : K<2)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K≤K) (hρ : ∀j,ρ≤(cs j).rho) (hρ1 : ρ≤1)
    (hδ0 : 0≤δ) (hδ1 : δ≤1) (hδρ : δ≤ρ) (hδK : δ≤(2-K)/2)
    (k : ℕ) (ω : BoardClockPath n) (C : Finset (Grid n))
    (hC : C⊆(initialRootPhaseWitness cs ε M deadline start p hn hB e k ω).augmented.physical.process.activeEvents) :
    δ^(C.card^3)≤connectionProduct Γ C
      (initialRootPhaseWitness cs ε M deadline start p hn hB e k ω).augmented.physical := by
  have hd := initialRootPhaseWitness_lineDomain cs ε M deadline start K ρ p hn hB e hK0 Γ hΓ hK hρ hρ1 k ω
  exact active_connectionProduct_lower Γ C _ B K ρ δ
    (initialRootPhaseWitness_valid cs ε M deadline start p hn hB e k ω).1.1
    hd.1 hd.2 hC hK2 hρ1 hδ0 hδ1 hδρ hδK

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.initialRootPhaseWitness_lineDomain
#print axioms NoThreeLine.BirthWitness.initialRootPhaseWitness_connection_lower
