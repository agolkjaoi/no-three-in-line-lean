import NoThreeLine.RecycledRawWeightCap
import NoThreeLine.RecycledPhaseComposition

/-! One unchanged scheduled phase preserves the growth invariants and
transports its actual risk cost through absolute deadline retirement. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

theorem weightGrowthPotential_eq_of_coordinates {n : ℕ} (Γ : Finset ZPoint) (K : ℝ)
    (p : Grid n) (e f : ExtendedState n) (h : e.coordinates=f.coordinates) :
    weightGrowthPotential Γ K p e=weightGrowthPotential Γ K p f := by
  have hw := congrArg (fun z : Coordinates n=>z.1 p) h
  have hk := congrArg (fun z : Coordinates n=>z.2.1) h
  simp only [ExtendedState.coordinates] at hw hk
  simp only [weightGrowthPotential,hw,hk]

theorem augValidDeadlineRetirement_coordinates {n : ℕ} {B : ℝ}
    (deadline : Grid n→ℝ) (t : ℝ) (e : ValidAugmentedState n B) :
    (augValidDeadlineRetirement deadline t e).val.physical.coordinates=e.val.physical.coordinates := by
  unfold augValidDeadlineRetirement
  split
  · rfl
  · exact e.val.physical.retire_coordinates _

theorem augValidDeadlineRetirement_active_subset {n : ℕ} {B : ℝ}
    (deadline : Grid n→ℝ) (t : ℝ) (e : ValidAugmentedState n B) :
    (augValidDeadlineRetirement deadline t e).val.physical.process.activeEvents⊆e.val.physical.process.activeEvents := by
  unfold augValidDeadlineRetirement
  split
  · exact Finset.Subset.refl _
  · exact retire_activeEvents_subset e.val.physical.process _

theorem augRecycledPair_active_subset {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.activeEvents⊆s.val.1.physical.process.activeEvents := by
  induction k with
  | zero => exact Finset.Subset.refl _
  | succ k ih => exact (augTimedStep_active_subset cfg ε M _ _).trans ih

theorem recycledScheduledPair_active_subset {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (j : ℕ) (e : ValidAugmentedState n B) (ω : BoardClockPath n) :
    (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.process.activeEvents⊆
      e.val.physical.process.activeEvents :=
  (augValidDeadlineRetirement_active_subset deadline _ _).trans
    (augRecycledPair_active_subset (cs j).config ε M hn (augPhaseStart (cs j).config ε M e) _ ω)

theorem recycledScheduledPair_activeWeightFloor {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (j : ℕ) (e : ValidAugmentedState n B)
    (hf : e.val.physical.process.ActiveWeightFloor (cs j).directions) (ω : BoardClockPath n) :
    (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.process.ActiveWeightFloor (cs j).directions := by
  apply augDeadline_activeWeightFloor
  exact augRecycledPair_activeWeightFloor (cs j).config ε M hn (augPhaseStart (cs j).config ε M e) hf _ ω

theorem recycledScheduledPair_activeLineGuardBounds {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K ρ : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (j : ℕ) (hK : (cs j).K≤K) (hρ : ρ≤(cs j).rho) (e : ValidAugmentedState n B)
    (hg : ActiveLineGuardBounds (cs j).directions K ρ e.val.physical) (ω : BoardClockPath n) :
    ActiveLineGuardBounds (cs j).directions K ρ
      (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical := by
  apply augDeadline_activeLineGuardBounds
  exact augRecycledPair_activeLineGuardBounds (cs j).config ε M K ρ hn hK hρ
    (augPhaseStart (cs j).config ε M e) hg _ ω

theorem recycledScheduledPair_growthPotential_le {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M K ρ : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (j : ℕ) (hKcfg : (cs j).K≤K) (hρcfg : ρ≤(cs j).rho) (hK : K<2) (hB : 0<B)
    (e : ValidAugmentedState n B) (hg : ActiveLineGuardBounds (cs j).directions K ρ e.val.physical)
    (hf : e.val.physical.process.ActiveWeightFloor (cs j).directions) (p : Grid n) (ω : BoardClockPath n)
    (hp : ((recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical.process.accounts p).status=.active) :
    weightGrowthPotential (cs j).directions K p (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical≤
      weightGrowthPotential (cs j).directions K p e.val.physical+(B/n)*(cs j).horizon+
      terminalOutsideRiskCost (cs j).config ε M hn p (augPhaseStart (cs j).config ε M e) ω := by
  have hp' := (ProcessState.mem_activeEvents _ p).mp
    (augValidDeadlineRetirement_active_subset deadline _ _ ((ProcessState.mem_activeEvents _ p).mpr hp))
  have hh := terminal_growthPotential_le (cs j).config ε M K ρ hn hKcfg hρcfg hK hB
    (cs j).mask_le_one (augPhaseStart (cs j).config ε M e) hg hf p ω hp'
  have he := weightGrowthPotential_eq_of_coordinates (cs j).directions K p _ _
    (augValidDeadlineRetirement_coordinates deadline (phaseEndpoint cs start (j+1))
      (augPhaseRecycledPair (cs j).config ε M hn (e,ω)).1)
  change weightGrowthPotential (cs j).directions K p (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.physical=_ at he
  rw [he]
  apply hh.trans
  exact add_le_add (add_le_add le_rfl (mul_le_mul_of_nonneg_left
    (sub_le_self _ (augRecycledTerminal (cs j).config ε M hn
      (augPhaseStart (cs j).config ε M e) ω).property.2.1)
    (div_nonneg hB.le (Nat.cast_nonneg n)))) le_rfl

end NoThreeLine

#print axioms NoThreeLine.recycledScheduledPair_active_subset
#print axioms NoThreeLine.recycledScheduledPair_activeWeightFloor
#print axioms NoThreeLine.recycledScheduledPair_activeLineGuardBounds
#print axioms NoThreeLine.recycledScheduledPair_growthPotential_le
