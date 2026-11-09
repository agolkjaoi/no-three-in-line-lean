import NoThreeLine.TimedWeightGrowth
import NoThreeLine.RecycledTerminal

/-! Actual original-board updates telescope the root growth potential.
No factor proportional to the number of physical updates is introduced. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE

def recycledOutsideRiskCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (p : Grid n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range k,augTimedOutsideRiskCost cfg ε M p (augRecycledPair cfg ε M hn s j ω).1
    (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s j ω).2)

theorem augRecycledPair_activeWeightFloor {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (s : AugTimedState cfg) (hf : s.val.1.physical.process.ActiveWeightFloor cfg.directions)
    (k : ℕ) (ω : BoardClockPath n) :
    (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.ActiveWeightFloor cfg.directions := by
  induction k with
  | zero => exact hf
  | succ k ih => exact augTimedStep_activeWeightFloor cfg ε M _ ih _

theorem augRecycledPair_activeLineGuardBounds {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ) (hn : 0<n)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (s : AugTimedState cfg)
    (hg : ActiveLineGuardBounds cfg.directions K ρ s.val.1.physical)
    (k : ℕ) (ω : BoardClockPath n) :
    ActiveLineGuardBounds cfg.directions K ρ (augRecycledPair cfg ε M hn s k ω).1.val.1.physical := by
  induction k with
  | zero => exact hg
  | succ k ih => exact augTimedStep_activeLineGuardBounds cfg ε M K ρ hKcfg hρcfg _ ih _

theorem recycled_growthPotential_le {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ) (hn : 0<n)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK : K<2)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hg : ActiveLineGuardBounds cfg.directions K ρ s.val.1.physical)
    (hf : s.val.1.physical.process.ActiveWeightFloor cfg.directions)
    (p : Grid n) (k : ℕ) (ω : BoardClockPath n)
    (hp : ((augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process.accounts p).status=.active) :
    weightGrowthPotential cfg.directions K p (augRecycledPair cfg ε M hn s k ω).1.val.1.physical≤
      weightGrowthPotential cfg.directions K p s.val.1.physical+
      (cfg.B/n)*(s.val.2-(augRecycledPair cfg ε M hn s k ω).1.val.2)+
      recycledOutsideRiskCost cfg ε M hn p s k ω := by
  induction k with
  | zero => simp [augRecycledPair,RecycledBoardProcess.iterate,recycledOutsideRiskCost]
  | succ k ih =>
    let sk := (augRecycledPair cfg ε M hn s k ω).1
    let zk := WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2
    have hpold : (sk.val.1.physical.process.accounts p).status=.active :=
      (ProcessState.mem_activeEvents _ p).mp (augTimedStep_active_subset cfg ε M sk zk
        ((ProcessState.mem_activeEvents _ p).mpr hp))
    have hi := ih hpold
    have hstep := augTimedStep_growthPotential_le cfg ε M K ρ hKcfg hρcfg hK hB hm sk
      (augRecycledPair_activeLineGuardBounds cfg ε M K ρ hn hKcfg hρcfg s hg k ω)
      (augRecycledPair_activeWeightFloor cfg ε M hn s hf k ω) zk p hp
    have he : recycledOutsideRiskCost cfg ε M hn p s (k+1) ω=
        recycledOutsideRiskCost cfg ε M hn p s k ω+augTimedOutsideRiskCost cfg ε M p sk zk := by
      exact Finset.sum_range_succ _ k
    rw [he]
    change weightGrowthPotential cfg.directions K p (augTimedStep cfg ε M (sk,zk)).val.1.physical≤
      weightGrowthPotential cfg.directions K p s.val.1.physical+
      (cfg.B/n)*(s.val.2-(augTimedStep cfg ε M (sk,zk)).val.2)+
      (recycledOutsideRiskCost cfg ε M hn p s k ω+augTimedOutsideRiskCost cfg ε M p sk zk)
    change weightGrowthPotential cfg.directions K p sk.val.1.physical≤
      weightGrowthPotential cfg.directions K p s.val.1.physical+
      (cfg.B/n)*(s.val.2-sk.val.2)+recycledOutsideRiskCost cfg ε M hn p s k ω at hi
    nlinarith

def terminalOutsideRiskCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (p : Grid n) (s : AugTimedState cfg) (ω : BoardClockPath n) : ℝ :=
  recycledOutsideRiskCost cfg ε M hn p s (augRecycledCompletionIndex cfg ε M hn s ω) ω

theorem terminal_growthPotential_le {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ) (hn : 0<n)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK : K<2)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hg : ActiveLineGuardBounds cfg.directions K ρ s.val.1.physical)
    (hf : s.val.1.physical.process.ActiveWeightFloor cfg.directions)
    (p : Grid n) (ω : BoardClockPath n)
    (hp : ((augRecycledTerminal cfg ε M hn s ω).val.1.physical.process.accounts p).status=.active) :
    weightGrowthPotential cfg.directions K p (augRecycledTerminal cfg ε M hn s ω).val.1.physical≤
      weightGrowthPotential cfg.directions K p s.val.1.physical+
      (cfg.B/n)*(s.val.2-(augRecycledTerminal cfg ε M hn s ω).val.2)+
      terminalOutsideRiskCost cfg ε M hn p s ω :=
  recycled_growthPotential_le cfg ε M K ρ hn hKcfg hρcfg hK hB hm s hg hf p _ ω hp

end NoThreeLine

#print axioms NoThreeLine.recycled_growthPotential_le
#print axioms NoThreeLine.terminal_growthPotential_le
