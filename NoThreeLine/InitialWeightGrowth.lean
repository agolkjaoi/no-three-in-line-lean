import NoThreeLine.ScheduledWeightGrowth

/-! Canonical initial weight one and clock zero supply the actual
initial potential and all inherited growth invariants. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem augInitialState_growthPotential {n : ℕ} (B : ℝ) (hB : 1≤B)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (K : ℝ) (p : Grid n) :
    weightGrowthPotential Γ K p (augInitialState B hB deadline start).val.physical=0 := by
  have he := weightGrowthPotential_eq_of_coordinates Γ K p _ _
    (augValidDeadlineRetirement_coordinates deadline start
      ⟨AugmentedState.initial n,AugmentedState.initial_valid n B hB⟩)
  change weightGrowthPotential Γ K p (augInitialState B hB deadline start).val.physical=_ at he
  rw [he]
  simp [weightGrowthPotential,rootDesignatedClock,AugmentedState.initial,ExtendedState.initial,ProcessState.initial]

theorem augInitialState_activeWeightFloor {n : ℕ} (B : ℝ) (hB : 1≤B)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) :
    (augInitialState B hB deadline start).val.physical.process.ActiveWeightFloor Γ :=
  augDeadline_activeWeightFloor Γ deadline start _ (ProcessState.initial_activeWeightFloor n Γ)

theorem augInitialState_activeLineGuardBounds {n : ℕ} (B : ℝ) (hB : 1≤B)
    (deadline : Grid n→ℝ) (start : ℝ) (Γ : Finset ZPoint) (K ρ : ℝ) (hK0 : 0≤K) :
    ActiveLineGuardBounds Γ K ρ (augInitialState B hB deadline start).val.physical :=
  augDeadline_activeLineGuardBounds Γ K ρ deadline start _ (activeLineGuardBounds_initial n Γ K ρ hK0)

theorem initial_recycledPhaseState_growthPotential_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K ρ : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (Γ : Finset ZPoint) (hΓ : ∀j,(cs j).directions=Γ)
    (hKcfg : ∀j,(cs j).K≤K) (hρcfg : ∀j,ρ≤(cs j).rho) (hK0 : 0≤K) (hK : K<2)
    (p : Grid n) (J : ℕ) (ω : BoardClockPath n)
    (hp : ((recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) J ω).val.physical.process.accounts p).status=.active) :
    weightGrowthPotential Γ K p (recycledPhaseState cs ε M deadline start hn (augInitialState B hB deadline start) J ω).val.physical≤
      (B/n)*phaseEndpoint cs 0 J+
      scheduledOutsideRiskCost cs ε M deadline start hn p (augInitialState B hB deadline start) J ω := by
  have h := recycledPhaseState_growthPotential_le cs ε M K ρ deadline start hn (lt_of_lt_of_le zero_lt_one hB)
    Γ hΓ hKcfg hρcfg hK (augInitialState B hB deadline start)
    (augInitialState_activeLineGuardBounds B hB deadline start Γ K ρ hK0)
    (augInitialState_activeWeightFloor B hB deadline start Γ) p J ω hp
  simpa only [augInitialState_growthPotential,zero_add] using h

end NoThreeLine

#print axioms NoThreeLine.augInitialState_growthPotential
#print axioms NoThreeLine.initial_recycledPhaseState_growthPotential_le
