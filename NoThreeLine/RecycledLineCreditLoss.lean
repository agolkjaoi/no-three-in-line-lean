import NoThreeLine.AugmentedLineCreditLoss
import NoThreeLine.RecycledTerminal

/-! All actual segments on the original board telescope to the physical
line-credit decrement. The terminal selector is the existing one. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE

def recycledLineCreditLoss {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑ j ∈ Finset.range k, augTimedLineLoss cfg ε M L
    ((augRecycledPair cfg ε M hn s j ω).1,
      WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s j ω).2)

theorem recycledLineCreditLoss_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    recycledLineCreditLoss cfg ε M hn L s k ω =
      augTimedLineCredit cfg L s - augTimedLineCredit cfg L (augRecycledPair cfg ε M hn s k ω).1 := by
  induction k with
  | zero => simp [recycledLineCreditLoss,augRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    change (∑ j ∈ Finset.range (k+1), _) = _
    rw [Finset.sum_range_succ]
    change recycledLineCreditLoss cfg ε M hn L s k ω + _ = _
    rw [ih,augTimedLineLoss_eq]
    change _ + (augTimedLineCredit cfg L (augRecycledPair cfg ε M hn s k ω).1 -
      augTimedLineCredit cfg L (augRecycledPair cfg ε M hn s (k+1) ω).1) = _
    ring

theorem recycledLineCreditLoss_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    0 ≤ recycledLineCreditLoss cfg ε M hn L s k ω ∧
      recycledLineCreditLoss cfg ε M hn L s k ω ≤ 1 := by
  constructor
  · exact Finset.sum_nonneg (fun j _ => augTimedLineLoss_nonneg cfg ε M L _ _)
  · rw [recycledLineCreditLoss_eq]
    exact (sub_le_self _ (augTimedLineCredit_bounds cfg L _).1).trans
      (augTimedLineCredit_bounds cfg L s).2

theorem recycledLineCreditLoss_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) (k : ℕ) :
    Measurable (recycledLineCreditLoss cfg ε M hn L s k) := by
  simp_rw [funext (recycledLineCreditLoss_eq cfg ε M hn L s k)]
  exact measurable_const.sub ((augTimedLineCredit_measurable cfg L).comp
    (augRecycledPair_measurable cfg ε M hn s k).fst)

theorem augRecycledPair_lineCredit_antitone {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) (ω : BoardClockPath n) :
    Antitone (fun k => augTimedLineCredit cfg L (augRecycledPair cfg ε M hn s k ω).1) := by
  apply antitone_nat_of_succ_le
  intro k
  exact augTimedStep_lineCredit_le cfg ε M L _ _

def terminalLineCreditLoss {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  recycledLineCreditLoss cfg ε M hn L s (augRecycledCompletionIndex cfg ε M hn s ω) ω

theorem terminalLineCreditLoss_eq {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) (ω : BoardClockPath n) :
    terminalLineCreditLoss cfg ε M hn L s ω =
      augTimedLineCredit cfg L s - augTimedLineCredit cfg L (augRecycledTerminal cfg ε M hn s ω) :=
  recycledLineCreditLoss_eq cfg ε M hn L s _ ω

theorem terminalLineCreditLoss_bounds {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) (ω : BoardClockPath n) :
    0 ≤ terminalLineCreditLoss cfg ε M hn L s ω ∧ terminalLineCreditLoss cfg ε M hn L s ω ≤ 1 :=
  recycledLineCreditLoss_bounds cfg ε M hn L s _ ω

theorem terminalLineCreditLoss_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (L : LineIndex n) (s : AugTimedState cfg) : Measurable (terminalLineCreditLoss cfg ε M hn L s) := by
  simp_rw [funext (terminalLineCreditLoss_eq cfg ε M hn L s)]
  exact measurable_const.sub ((augTimedLineCredit_measurable cfg L).comp
    (augRecycledTerminal_measurable cfg ε M hn s))

end NoThreeLine

#print axioms NoThreeLine.recycledLineCreditLoss_eq
#print axioms NoThreeLine.recycledLineCreditLoss_bounds
#print axioms NoThreeLine.augRecycledPair_lineCredit_antitone
#print axioms NoThreeLine.terminalLineCreditLoss_eq
#print axioms NoThreeLine.terminalLineCreditLoss_measurable
