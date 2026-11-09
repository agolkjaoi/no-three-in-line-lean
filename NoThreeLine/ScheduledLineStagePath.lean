import NoThreeLine.PhaseLineStageTransition
import NoThreeLine.ScheduledWeightGrowth

/-! Original scheduled phases preserve the same occupancy stage and
its clock bounds, including actual absolute-deadline retirement. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem recycledPhaseState_lineStageRegion {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (hKcfg : ∀j,(cs j).K≤K) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B) (he : validLineStageRegion K L N e)
    (J : ℕ) (ω : BoardClockPath n) :
    validLineStageRegion K L N (recycledPhaseState cs ε M deadline start hn e J ω) := by
  induction J with
  | zero => exact he
  | succ j ih =>
    rw [recycledPhaseState_succ_eq]
    exact recycledScheduledPair_lineStageRegion cs ε M K deadline start hn j (hKcfg j) L (hsp j) N hN _ ih _

theorem recycledPhaseState_occupancy_monotone {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (L : LineIndex n)
    (e : ValidAugmentedState n B) (ω : BoardClockPath n) :
    Monotone (fun j=>occupancy (recycledPhaseState cs ε M deadline start hn e j ω).val.physical.process L) := by
  apply monotone_nat_of_le_succ
  intro j
  rw [recycledPhaseState_succ_eq]
  exact recycledScheduledPair_occupancy_le cs ε M deadline start hn j L _ _

theorem recycledPhaseState_occupancy_prefix {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (L : LineIndex n) (N : ℕ)
    (e : ValidAugmentedState n B) (he : occupancy e.val.physical.process L=N)
    (J : ℕ) (ω : BoardClockPath n)
    (hJ : occupancy (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process L=N)
    (j : ℕ) (hj : j≤J) :
    occupancy (recycledPhaseState cs ε M deadline start hn e j ω).val.physical.process L=N := by
  have hlo := recycledPhaseState_occupancy_monotone cs ε M deadline start hn L e ω (Nat.zero_le j)
  have hhi := recycledPhaseState_occupancy_monotone cs ε M deadline start hn L e ω hj
  change occupancy e.val.physical.process L≤occupancy (recycledPhaseState cs ε M deadline start hn e j ω).val.physical.process L at hlo
  change occupancy (recycledPhaseState cs ε M deadline start hn e j ω).val.physical.process L≤
    occupancy (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process L at hhi
  omega

theorem recycledPhaseState_lineStageValue_ge_on_survival {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K)
    (J : ℕ) (ω : BoardClockPath n)
    (hJ : occupancy (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process L=N) :
    validLineStageValue K L N e≤validLineStageValue K L N (recycledPhaseState cs ε M deadline start hn e J ω) := by
  induction J with
  | zero => exact le_rfl
  | succ j ih =>
    have hj := recycledPhaseState_occupancy_prefix cs ε M deadline start hn L N e he (j+1) ω hJ j (Nat.le_succ j)
    have hreg := recycledPhaseState_lineStageRegion cs ε M K deadline start hn hKcfg L hsp N hN e ⟨he.ge,fun _=>hk⟩ j ω
    have hi := ih hj
    rw [recycledPhaseState_succ_eq] at hJ ⊢
    exact hi.trans (recycledScheduledPair_lineStageValue_ge_on_survival cs ε M K deadline start hn j
      (hKcfg j) hK L (hsp j) N hN _ hj (hreg.2 hj) _ hJ)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.recycledPhaseState_lineStageRegion
#print axioms NoThreeLine.BirthWitness.recycledPhaseState_lineStageValue_ge_on_survival
