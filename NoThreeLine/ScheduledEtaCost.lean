import NoThreeLine.PairCostRegularity
import NoThreeLine.ScheduledWeightGrowth
import NoThreeLine.BoundaryCauseKinds

/-! Actual eta losses telescope over the original phase sequence. A raw
eta cause is paid by one pair's total cost, without a time union. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def scheduledPairCost {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (a b : Grid n)
    (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range J, terminalPairCost (cs j).config ε M hn a b
    (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
    (recycledPhases cs ε M deadline start hn e j ω).2

theorem scheduledPairCost_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (a b : Grid n)
    (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) :
    0≤scheduledPairCost cs ε M deadline start hn a b e J ω :=
  Finset.sum_nonneg (fun j _=>terminalPairCost_nonneg (cs j).config ε M hn a b _ _)

theorem scheduledPairCost_monotone {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (a b : Grid n)
    (e : ValidAugmentedState n B) (ω : BoardClockPath n) :
    Monotone (fun J=>scheduledPairCost cs ε M deadline start hn a b e J ω) := by
  intro j k hjk
  exact Finset.sum_le_sum_of_subset_of_nonneg (Finset.range_mono hjk)
    (fun l _ _=>terminalPairCost_nonneg (cs l).config ε M hn a b _ _)

theorem recycledScheduledPair_eta_eq {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j : ℕ)
    (e : ValidAugmentedState n B) (ω : BoardClockPath n) :
    (recycledScheduledPair cs ε M deadline start hn j (e,ω)).1.val.eta=
      (augRecycledTerminal (cs j).config ε M hn (augPhaseStart (cs j).config ε M e) ω).val.1.eta := by
  unfold recycledScheduledPair
  rw [augValidDeadlineRetirement_eta]
  rfl

theorem scheduled_eta_loss_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (a b : Grid n)
    (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) :
    e.val.eta a b-(recycledPhaseState cs ε M deadline start hn e J ω).val.eta a b≤
      scheduledPairCost cs ε M deadline start hn a b e J ω := by
  induction J with
  | zero => simp [recycledPhaseState,recycledPhases,RecycledBoardProcess.iterate,scheduledPairCost]
  | succ j ih =>
    let ej := recycledPhaseState cs ε M deadline start hn e j ω
    let ωj := (recycledPhases cs ε M deadline start hn e j ω).2
    have hs := terminal_eta_loss_le (cs j).config ε M hn a b (augPhaseStart (cs j).config ε M ej) ωj
    have he : scheduledPairCost cs ε M deadline start hn a b e (j+1) ω=
        scheduledPairCost cs ε M deadline start hn a b e j ω+
        terminalPairCost (cs j).config ε M hn a b (augPhaseStart (cs j).config ε M ej) ωj :=
      Finset.sum_range_succ _ j
    rw [he,recycledPhaseState_succ_eq,recycledScheduledPair_eta_eq]
    change ej.val.eta a b-(augRecycledTerminal (cs j).config ε M hn
      (augPhaseStart (cs j).config ε M ej) ωj).val.1.eta a b≤_ at hs
    change e.val.eta a b-ej.val.eta a b≤_ at ih
    change e.val.eta a b-(augRecycledTerminal (cs j).config ε M hn
      (augPhaseStart (cs j).config ε M ej) ωj).val.1.eta a b≤_
    linarith

theorem initial_eta_cause_cost {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (p : Grid n) (J : ℕ) (ω : BoardClockPath n)
    (hh : ω∈scheduledBoundaryCauseBefore cs ε M deadline start hn
      (augInitialState B hB deadline start) p .eta J) :
    ∃ a b : Grid n, a≠b ∧ ε≤scheduledPairCost cs ε M deadline start hn a b
      (augInitialState B hB deadline start) J ω := by
  obtain ⟨N,hN,k,hd,_,a,b,hab,hhit⟩ := hh
  let e := augInitialState B hB deadline start
  let eN := recycledPhaseState cs ε M deadline start hn e N ω
  let ωN := (recycledPhases cs ε M deadline start hn e N ω).2
  have hf := (raw_eta_hit_terminal_floor (cs N).config ε M hn a b hab
    (augPhaseStart (cs N).config ε M eN) k ωN hd hhit).2
  have he : (recycledPhaseState cs ε M deadline start hn e (N+1) ω).val.eta a b≤1-ε := by
    rw [recycledPhaseState_succ_eq,recycledScheduledPair_eta_eq]
    exact hf
  have hc := scheduled_eta_loss_le cs ε M deadline start hn a b e (N+1) ω
  have hi : e.val.eta a b=1 := augInitialState_eta B hB deadline start a b
  rw [hi] at hc
  refine ⟨a,b,hab,?_⟩
  exact (show ε≤scheduledPairCost cs ε M deadline start hn a b e (N+1) ω by linarith).trans
    (scheduledPairCost_monotone cs ε M deadline start hn a b e ω hN)

end NoThreeLine

#print axioms NoThreeLine.scheduled_eta_loss_le
#print axioms NoThreeLine.initial_eta_cause_cost
