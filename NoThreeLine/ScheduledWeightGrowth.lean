import NoThreeLine.PhaseWeightGrowth
import NoThreeLine.OutsideRiskCostRegularity

/-! Growth through all original scheduled phases, including absolute
deadline retirement, with one sum of actual outside-hazard costs. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def scheduledOutsideRiskCost {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (p : Grid n)
    (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range J, terminalOutsideRiskCost (cs j).config ε M hn p
    (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
    (recycledPhases cs ε M deadline start hn e j ω).2

theorem scheduledOutsideRiskCost_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (p : Grid n)
    (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) :
    0≤scheduledOutsideRiskCost cs ε M deadline start hn p e J ω :=
  Finset.sum_nonneg (fun j _=>terminalOutsideRiskCost_nonneg (cs j).config ε M hn p hB (cs j).mask_le_one _ _)

theorem scheduledOutsideRiskCost_monotone {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (p : Grid n)
    (e : ValidAugmentedState n B) (ω : BoardClockPath n) :
    Monotone (fun J=>scheduledOutsideRiskCost cs ε M deadline start hn p e J ω) := by
  intro j k hjk
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hjk)
    (fun l _ _=>terminalOutsideRiskCost_nonneg (cs l).config ε M hn p hB (cs l).mask_le_one _ _)

theorem recycledPhaseState_succ_eq {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (j : ℕ) (ω : BoardClockPath n) :
    recycledPhaseState cs ε M deadline start hn e (j+1) ω=
      (recycledScheduledPair cs ε M deadline start hn j
        (recycledPhaseState cs ε M deadline start hn e j ω,
         (recycledPhases cs ε M deadline start hn e j ω).2)).1 := by
  unfold recycledPhaseState
  rw [recycledPhases_succ]

theorem recycledPhaseState_activeWeightFloor {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (e : ValidAugmentedState n B) (hf : e.val.physical.process.ActiveWeightFloor Γ)
    (J : ℕ) (ω : BoardClockPath n) :
    (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process.ActiveWeightFloor Γ := by
  induction J with
  | zero => exact hf
  | succ j ih =>
    rw [recycledPhaseState_succ_eq]
    rw [← hΓ j] at ih ⊢
    exact recycledScheduledPair_activeWeightFloor cs ε M deadline start hn j _ ih _

theorem recycledPhaseState_activeLineGuardBounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K ρ : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hρcfg : ∀j,ρ≤(cs j).rho)
    (e : ValidAugmentedState n B) (hg : ActiveLineGuardBounds Γ K ρ e.val.physical)
    (J : ℕ) (ω : BoardClockPath n) :
    ActiveLineGuardBounds Γ K ρ (recycledPhaseState cs ε M deadline start hn e J ω).val.physical := by
  induction J with
  | zero => exact hg
  | succ j ih =>
    rw [recycledPhaseState_succ_eq]
    rw [← hΓ j] at ih ⊢
    exact recycledScheduledPair_activeLineGuardBounds cs ε M K ρ deadline start hn j (hKcfg j) (hρcfg j) _ ih _

theorem recycledPhaseState_growthPotential_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K ρ : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hρcfg : ∀j,ρ≤(cs j).rho) (hK : K<2)
    (e : ValidAugmentedState n B) (hg : ActiveLineGuardBounds Γ K ρ e.val.physical)
    (hf : e.val.physical.process.ActiveWeightFloor Γ) (p : Grid n) (J : ℕ) (ω : BoardClockPath n)
    (hp : ((recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process.accounts p).status=.active) :
    weightGrowthPotential Γ K p (recycledPhaseState cs ε M deadline start hn e J ω).val.physical≤
      weightGrowthPotential Γ K p e.val.physical+(B/n)*phaseEndpoint cs 0 J+
      scheduledOutsideRiskCost cs ε M deadline start hn p e J ω := by
  induction J with
  | zero => simp [recycledPhaseState,recycledPhases,RecycledBoardProcess.iterate,phaseEndpoint,scheduledOutsideRiskCost]
  | succ j ih =>
    let ej := recycledPhaseState cs ε M deadline start hn e j ω
    let ωj := (recycledPhases cs ε M deadline start hn e j ω).2
    rw [recycledPhaseState_succ_eq] at hp ⊢
    have hpold : (ej.val.physical.process.accounts p).status=.active :=
      (ProcessState.mem_activeEvents _ p).mp (recycledScheduledPair_active_subset cs ε M deadline start hn j ej ωj
        ((ProcessState.mem_activeEvents _ p).mpr hp))
    have hi := ih hpold
    have hgj := recycledPhaseState_activeLineGuardBounds cs ε M K ρ deadline start hn Γ hΓ hKcfg hρcfg e hg j ω
    have hfj := recycledPhaseState_activeWeightFloor cs ε M deadline start hn Γ hΓ e hf j ω
    rw [← hΓ j] at hgj hfj
    have hs := recycledScheduledPair_growthPotential_le cs ε M K ρ deadline start hn j
      (hKcfg j) (hρcfg j) hK hB ej hgj hfj p ωj hp
    rw [hΓ j] at hs
    have he : scheduledOutsideRiskCost cs ε M deadline start hn p e (j+1) ω=
        scheduledOutsideRiskCost cs ε M deadline start hn p e j ω+
        terminalOutsideRiskCost (cs j).config ε M hn p (augPhaseStart (cs j).config ε M ej) ωj :=
      Finset.sum_range_succ _ j
    rw [he,phaseEndpoint_succ]
    change weightGrowthPotential Γ K p (recycledScheduledPair cs ε M deadline start hn j (ej,ωj)).1.val.physical≤_
    change weightGrowthPotential Γ K p ej.val.physical≤_ at hi
    nlinarith

end NoThreeLine

#print axioms NoThreeLine.scheduledOutsideRiskCost_monotone
#print axioms NoThreeLine.recycledPhaseState_activeWeightFloor
#print axioms NoThreeLine.recycledPhaseState_activeLineGuardBounds
#print axioms NoThreeLine.recycledPhaseState_growthPotential_le
