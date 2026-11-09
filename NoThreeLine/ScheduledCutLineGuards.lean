import NoThreeLine.ActiveLineGuardBounds
import NoThreeLine.ScheduledCutShortStarMain

/-! Actual scheduled cuts inherit active-line bounds from boundary resolution.
Uniform parameter bounds are supplied for the finite schedule. Frozen zero-time
states retain their previous bound; no all-path lower-floor hypothesis is added
to the theorem starting at the canonical initial observation. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE

theorem augmentedResolve_activeLineGuardBounds {n : ℕ} (a : AugmentedState n)
    (Γ : Finset PrimitiveLines.ZPoint) (B K ρ ε M : ℝ) (ha : a.Valid B) :
    ActiveLineGuardBounds Γ K ρ (a.resolve Γ B K ρ ε M).physical := by
  unfold AugmentedState.resolve
  split_ifs
  · exact activeLineGuardBounds_stop a.physical Γ K ρ
  · exact activeLineGuardBounds_resolve a.physical Γ B K ρ ha.1

theorem augTimedStep_activeLineGuardBounds {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ)
    (hK : cfg.K ≤ K) (hρ : ρ ≤ cfg.rho) (s : AugTimedState cfg)
    (hs : ActiveLineGuardBounds cfg.directions K ρ s.val.1.physical)
    (z : (ℝ × Grid n) × ℝ) :
    ActiveLineGuardBounds cfg.directions K ρ (augTimedStep cfg ε M (s,z)).val.1.physical := by
  change ActiveLineGuardBounds cfg.directions K ρ (augTimedStepPair cfg ε M (s,z)).1.physical
  unfold augTimedStepPair
  split_ifs
  · exact hs
  · exact (augmentedResolve_activeLineGuardBounds _ _ _ _ _ _ _
      (augRawOutcome_valid cfg ε M (augTimedInput cfg s) s.property.1.1 s.property.1.2 z)).mono hK hρ

theorem augDeadline_activeLineGuardBounds {n : ℕ} {B : ℝ}
    (Γ : Finset PrimitiveLines.ZPoint) (K ρ : ℝ) (deadline : Grid n → ℝ) (t : ℝ)
    (s : ValidAugmentedState n B) (hs : ActiveLineGuardBounds Γ K ρ s.val.physical) :
    ActiveLineGuardBounds Γ K ρ (augValidDeadlineRetirement deadline t s).val.physical := by
  unfold augValidDeadlineRetirement
  split_ifs
  · exact hs
  · exact activeLineGuardBounds_retire hs _

end NoThreeLine

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem observedRecycledPair_activeLineGuardBounds {n : ℕ} (cfg : FlowConfig n)
    (ε M start K ρ : ℝ) (hn : 0<n) (hK : cfg.K ≤ K) (hρ : ρ ≤ cfg.rho)
    (s : TimedObservation cfg) (hs : ActiveLineGuardBounds cfg.directions K ρ s.1.val.1.physical)
    (k : ℕ) (ω : BoardClockPath n) :
    ActiveLineGuardBounds cfg.directions K ρ
      (observedRecycledPair cfg ε M start hn s k ω).1.1.val.1.physical := by
  induction k with
  | zero => exact hs
  | succ k ih =>
    exact augTimedStep_activeLineGuardBounds cfg ε M K ρ hK hρ _ ih _

theorem observedRecycledTerminal_activeLineGuardBounds {n : ℕ} (cfg : FlowConfig n)
    (ε M start K ρ : ℝ) (hn : 0<n) (hK : cfg.K ≤ K) (hρ : ρ ≤ cfg.rho)
    (s : TimedObservation cfg) (hs : ActiveLineGuardBounds cfg.directions K ρ s.1.val.1.physical)
    (ω : BoardClockPath n) :
    ActiveLineGuardBounds cfg.directions K ρ
      (observedRecycledTerminal cfg ε M start hn (s,ω)).1.val.1.physical :=
  observedRecycledPair_activeLineGuardBounds cfg ε M start K ρ hn hK hρ s hs _ ω

theorem goodScheduledPair_activeLineGuardBounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ : ℝ)
    (hn : 0<n) (j : ℕ) (hK : (cs j).K ≤ K) (hρ : ρ ≤ (cs j).rho)
    (s : GoodPhaseObservation n B)
    (hs : ActiveLineGuardBounds (cs j).directions K ρ s.val.1.val.physical)
    (ω : BoardClockPath n) :
    ActiveLineGuardBounds (cs j).directions K ρ
      (goodScheduledPair cs ε M deadline start hn j (s,ω)).1.val.1.val.physical := by
  apply augDeadline_activeLineGuardBounds
  exact observedRecycledTerminal_activeLineGuardBounds (cs j).config ε M _ K ρ hn hK hρ
    (observedPhaseStart (cs j).config ε M s.val) hs ω

theorem goodPhases_activeLineGuardBounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ : ℝ)
    (hn : 0<n) (Γ : Finset PrimitiveLines.ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K ≤ K) (hρ : ∀j,ρ ≤ (cs j).rho)
    (s : GoodPhaseObservation n B) (hs : ActiveLineGuardBounds Γ K ρ s.val.1.val.physical)
    (k : ℕ) (ω : BoardClockPath n) :
    ActiveLineGuardBounds Γ K ρ (goodPhases cs ε M deadline start hn s k ω).1.val.1.val.physical := by
  induction k with
  | zero => exact hs
  | succ k ih =>
    simp only [goodPhases]
    rw [← hΓ k] at ih ⊢
    exact goodScheduledPair_activeLineGuardBounds cs ε M deadline start K ρ hn k (hK k) (hρ k) _ ih _

theorem sourceCutTerminal_activeLineGuardBounds {n : ℕ} (cfg : FlowConfig n)
    (ε M start δ K ρ : ℝ) (hδ : 0≤δ) (hn : 0<n) (hK : cfg.K ≤ K) (hρ : ρ ≤ cfg.rho)
    (s : GoodObservation cfg) (hs : ActiveLineGuardBounds cfg.directions K ρ s.val.1.val.1.physical)
    (ω : BoardClockPath n) :
    ActiveLineGuardBounds cfg.directions K ρ
      (sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val.1.physical :=
  observedRecycledTerminal_activeLineGuardBounds cfg ε M (start-δ) K ρ hn hK hρ
    (sourceRestrictGood cfg δ hδ s).val hs ω

theorem scheduledCutWitness_activeLineGuardBounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ : ℝ)
    (e : Retention n) (hn : 0<n) (Γ : Finset PrimitiveLines.ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K ≤ K) (hρ : ∀j,ρ ≤ (cs j).rho)
    (s : GoodPhaseObservation n B) (hs : ActiveLineGuardBounds Γ K ρ s.val.1.val.physical)
    (k : ℕ) (x : BoardClockPath n × ℝ) :
    ActiveLineGuardBounds Γ K ρ
      (scheduledCutWitness cs ε M deadline start e hn s k x).augmented.physical := by
  let y := goodPhases cs ε M deadline start hn s k x.1
  have hi : ActiveLineGuardBounds (cs k).config.directions K ρ y.1.val.1.val.physical := by
    rw [show (cs k).config.directions=Γ from hΓ k]
    exact goodPhases_activeLineGuardBounds cs ε M deadline start K ρ hn Γ hΓ hK hρ s hs k x.1
  have ht := sourceCutTerminal_activeLineGuardBounds (cs k).config ε M (phaseEndpoint cs start k)
    (elapsedCutAmount (cs k).config.horizon x.2) K ρ
    (elapsedCutAmount (cs k).config.horizon x.2).coe_nonneg hn (hK k) (hρ k)
    (goodPhaseStart (cs k).config ε M y.1) hi y.2
  simpa only [scheduledCutWitness,scheduledCutObservation,phaseCutObservation,observedWitness,
    show (cs k).config.directions=Γ from hΓ k,hΓ k,y] using ht

theorem initial_scheduledCutWitness_activeLineGuardBounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ : ℝ)
    (e : Retention n) (hn : 0<n) (hB : 1≤B) (hK0 : 0≤K)
    (Γ : Finset PrimitiveLines.ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K ≤ K) (hρ : ∀j,ρ ≤ (cs j).rho)
    (k : ℕ) (x : BoardClockPath n × ℝ) :
    ActiveLineGuardBounds Γ K ρ
      (scheduledCutWitness cs ε M deadline start e hn
        (initialGoodPhaseObservation B hB deadline start) k x).augmented.physical := by
  apply scheduledCutWitness_activeLineGuardBounds cs ε M deadline start K ρ e hn Γ hΓ hK hρ
  exact augDeadline_activeLineGuardBounds Γ K ρ deadline start _
    (activeLineGuardBounds_initial n Γ K ρ hK0)

theorem initial_scheduledCutWitness_lineCredit_lower {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start K ρ : ℝ)
    (e : Retention n) (hn : 0<n) (hB : 1≤B) (hK0 : 0≤K) (hρ1 : ρ≤1)
    (Γ : Finset PrimitiveLines.ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hK : ∀j,(cs j).K ≤ K) (hρ : ∀j,ρ ≤ (cs j).rho)
    (k : ℕ) (x : BoardClockPath n × ℝ) (p : Grid n) (L : LineIndex n)
    (hp : p ∈ (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k x).augmented.physical.process.activeEvents)
    (hpL : p ∈ L.val) (hsp : ¬AuxiliaryODE.specified Γ L) :
    ρ ≤ (scheduledCutWitness cs ε M deadline start e hn
      (initialGoodPhaseObservation B hB deadline start) k x).augmented.physical.lineCredits L := by
  exact active_lineCredit_lower
    (scheduledCutWitness_valid cs ε M deadline start e hn _ k x).1.1
    (scheduledCutWitness_emptyLineCredit cs ε M deadline start e hn _ k x)
    (initial_scheduledCutWitness_activeLineGuardBounds cs ε M deadline start K ρ e hn hB hK0 Γ hΓ hK hρ k x)
    hρ1 p hp L hpL hsp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutWitness_activeLineGuardBounds
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutWitness_lineCredit_lower
