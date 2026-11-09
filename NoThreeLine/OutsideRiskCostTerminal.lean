import NoThreeLine.OutsideRiskCostRegularity

/-! Nonnegative cost prefixes are dominated by the actual terminal cost
on completing paths. No such claim is made for the noncompletion fallback. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine
open BirthWitness

theorem augTimedOutsideRiskCost_eq_zero_of_done {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : AugTimedState cfg) (hs : AugTimedDone cfg s) (z : CandidateData n) :
    augTimedOutsideRiskCost cfg ε M p s z = 0 := by
  exact if_pos ((birthDone_iff cfg s).mpr hs)

theorem recycledOutsideRiskCost_stable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) (s : AugTimedState cfg) (ω : BoardClockPath n)
    (K : ℕ) (hd : AugTimedDone cfg (augRecycledPair cfg ε M hn s K ω).1)
    (k : ℕ) (hk : K ≤ k) :
    recycledOutsideRiskCost cfg ε M hn p s k ω = recycledOutsideRiskCost cfg ε M hn p s K ω := by
  have htail (j : ℕ) (hj : K ≤ j) :
      augTimedOutsideRiskCost cfg ε M p (augRecycledPair cfg ε M hn s j ω).1
        (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s j ω).2) = 0 := by
    rw [augRecycledPair_absorbing cfg ε M hn s ω K hd j hj]
    exact augTimedOutsideRiskCost_eq_zero_of_done cfg ε M p _ hd _
  induction k, hk using Nat.le_induction with
  | base => rfl
  | succ j hj ih =>
    unfold recycledOutsideRiskCost at ih ⊢
    rw [Finset.sum_range_succ,htail j hj,add_zero,ih]

theorem recycledOutsideRiskCost_le_terminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω)) (k : ℕ) :
    recycledOutsideRiskCost cfg ε M hn p s k ω ≤ terminalOutsideRiskCost cfg ε M hn p s ω := by
  let K := augRecycledCompletionIndex cfg ε M hn s ω
  change _ ≤ recycledOutsideRiskCost cfg ε M hn p s K ω
  by_cases hk : k ≤ K
  · exact recycledOutsideRiskCost_monotone cfg ε M hn p hB hm s ω hk
  · exact (recycledOutsideRiskCost_stable cfg ε M hn p s ω K hd k (le_of_not_ge hk)).le

theorem recycledOutsideRiskCost_le_terminal_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (hn : 0 < n) (p : Grid n) (hB : 0 < cfg.B) (hm : ∀ q, cfg.mask q ≤ 1)
    (s : AugTimedState cfg) :
    ∀ᵐ ω ∂boardClockMeasure n (cfg.B/n), ∀ k,
      recycledOutsideRiskCost cfg ε M hn p s k ω ≤ terminalOutsideRiskCost cfg ε M hn p s ω := by
  filter_upwards [augRecycledTerminal_done_ae cfg ε M hn hB s] with ω hω k
  exact recycledOutsideRiskCost_le_terminal cfg ε M hn p hB hm s ω hω k

end NoThreeLine

#print axioms NoThreeLine.recycledOutsideRiskCost_stable
#print axioms NoThreeLine.recycledOutsideRiskCost_le_terminal
#print axioms NoThreeLine.recycledOutsideRiskCost_le_terminal_ae
