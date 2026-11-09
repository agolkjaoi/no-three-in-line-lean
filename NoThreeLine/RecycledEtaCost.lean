import NoThreeLine.EtaRateCost
import NoThreeLine.RecycledTerminal

/-! Pair-rate costs telescope along the same recycled original board.
A raw eta hit forces completion and is paid by its single terminal cost,
even on paths for which termination had not previously been assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE BirthWitness

def recycledPairCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (a b : Grid n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,augTimedPairCost cfg ε M a b (augRecycledPair cfg ε M hn s j ω).1
    (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s j ω).2)

theorem recycledPairCost_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (a b : Grid n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    0≤recycledPairCost cfg ε M hn a b s k ω :=
  Finset.sum_nonneg (fun j _=>augTimedPairCost_nonneg cfg ε M a b _ _)

theorem recycled_eta_loss_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (a b : Grid n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    s.val.1.eta a b-(augRecycledPair cfg ε M hn s k ω).1.val.1.eta a b≤
      recycledPairCost cfg ε M hn a b s k ω := by
  induction k with
  | zero => simp [augRecycledPair,RecycledBoardProcess.iterate,recycledPairCost]
  | succ k ih =>
    let sk := (augRecycledPair cfg ε M hn s k ω).1
    let zk := WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2
    have hs := augTimedStep_eta_loss_le cfg ε M a b sk zk
    have he : recycledPairCost cfg ε M hn a b s (k+1) ω=
        recycledPairCost cfg ε M hn a b s k ω+augTimedPairCost cfg ε M a b sk zk :=
      Finset.sum_range_succ _ k
    rw [he]
    change s.val.1.eta a b-(augTimedStep cfg ε M (sk,zk)).val.1.eta a b≤_
    change s.val.1.eta a b-sk.val.1.eta a b≤_ at ih
    linarith

def terminalPairCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (a b : Grid n) (s : AugTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  recycledPairCost cfg ε M hn a b s (augRecycledCompletionIndex cfg ε M hn s ω) ω

theorem terminal_eta_loss_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (a b : Grid n) (s : AugTimedState cfg) (ω : BoardClockPath n) :
    s.val.1.eta a b-(augRecycledTerminal cfg ε M hn s ω).val.1.eta a b≤
      terminalPairCost cfg ε M hn a b s ω :=
  recycled_eta_loss_le cfg ε M hn a b s _ ω

theorem raw_eta_hit_terminal_floor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (a b : Grid n) (hab : a≠b) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n)
    (hd : ¬AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1)
    (hh : (augRawOutcome cfg ε M
      (augTimedInput cfg (augRecycledPair cfg ε M hn s k ω).1,
        WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2)).eta a b≤1-ε) :
    (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.stopped=true ∧
    (augRecycledTerminal cfg ε M hn s ω).val.1.eta a b≤1-ε := by
  let sk := (augRecycledPair cfg ε M hn s k ω).1
  let zk := WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2
  let raw := augRawOutcome cfg ε M (augTimedInput cfg sk,zk)
  have hd' : ¬(sk.val.2≤0 ∨ sk.val.1.physical.process.stopped=true) := by
    rintro (h | h)
    · exact hd (Or.inl (le_antisymm h sk.property.2.1))
    · exact hd (Or.inr h)
  have hb : raw.auxBad cfg.directions ε M := Or.inl ⟨a,b,hab,hh⟩
  have hstop : (augRecycledPair cfg ε M hn s (k+1) ω).1.val.1.physical.process.stopped=true := by
    change (augTimedStep cfg ε M (sk,zk)).val.1.physical.process.stopped=true
    simp only [augTimedStep,augTimedStepPair,if_neg hd']
    exact AugmentedState.resolve_stops_aux raw cfg.directions cfg.B cfg.K cfg.rho ε M hb
  have hfloor : (augRecycledPair cfg ε M hn s (k+1) ω).1.val.1.eta a b≤1-ε := by
    change (augTimedStep cfg ε M (sk,zk)).val.1.eta a b≤1-ε
    simp only [augTimedStep,augTimedStepPair,if_neg hd']
    change (raw.resolve cfg.directions cfg.B cfg.K cfg.rho ε M).eta a b≤1-ε
    rw [AugmentedState.resolve_eta]
    exact hh
  let I := augRecycledCompletionIndex cfg ε M hn s ω
  have hdone := augRecycledTerminal_done_of_exists cfg ε M hn s ω ⟨k+1,Or.inr hstop⟩
  have hI := augRecycledPair_absorbing cfg ε M hn s ω I hdone (max I (k+1)) (le_max_left _ _)
  have hk := augRecycledPair_absorbing cfg ε M hn s ω (k+1) (Or.inr hstop)
    (max I (k+1)) (le_max_right _ _)
  have he : augRecycledTerminal cfg ε M hn s ω=(augRecycledPair cfg ε M hn s (k+1) ω).1 :=
    congrArg Prod.fst (hI.symm.trans hk)
  rw [he]
  exact ⟨hstop,hfloor⟩

theorem raw_eta_hit_cost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (a b : Grid n) (hab : a≠b) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n)
    (hinit : s.val.1.eta a b=1)
    (hd : ¬AugTimedDone cfg (augRecycledPair cfg ε M hn s k ω).1)
    (hh : (augRawOutcome cfg ε M
      (augTimedInput cfg (augRecycledPair cfg ε M hn s k ω).1,
        WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2)).eta a b≤1-ε) :
    ε≤terminalPairCost cfg ε M hn a b s ω := by
  have hf := (raw_eta_hit_terminal_floor cfg ε M hn a b hab s k ω hd hh).2
  have hc := terminal_eta_loss_le cfg ε M hn a b s ω
  rw [hinit] at hc
  linarith

end NoThreeLine

#print axioms NoThreeLine.recycled_eta_loss_le
#print axioms NoThreeLine.raw_eta_hit_terminal_floor
#print axioms NoThreeLine.raw_eta_hit_cost
