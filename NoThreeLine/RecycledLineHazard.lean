import NoThreeLine.TimedLineHazard
import NoThreeLine.RecycledTerminal

/-! Along actual original-board updates in one specified-line occupancy
stage, the intensity costs telescope without an update-count factor.
This proves the needed exponential bound, not normalization of a new law. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine
open AuxiliaryODE

def recycledLineIntensityCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0<n)
    (L : LineIndex n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑i∈Finset.range k,augTimedLineIntensityCost cfg ε M L (augRecycledPair cfg ε M hn s i ω).1
    (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s i ω).2)

theorem recycled_stage_specifiedClock_le {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (hn : 0<n)
    (hKcfg : cfg.K≤K) (L : LineIndex n) (hsp : specified cfg.directions L)
    (s : AugTimedState cfg) (hk : s.val.1.physical.clocks L≤K) (N : ℕ) (hN : N≤1)
    (k : ℕ) (ω : BoardClockPath n)
    (hstage : ∀i<k,occupancy (augRecycledPair cfg ε M hn s i ω).1.val.1.physical.process L=N) :
    (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.clocks L≤K := by
  induction k with
  | zero => exact hk
  | succ k ih =>
    have hi := ih (fun i hi=>hstage i (Nat.lt_succ_of_lt hi))
    exact augTimedStep_specifiedClock_le cfg ε M K hKcfg L hsp _
      (by rw [hstage k (Nat.lt_succ_self k)]; exact hN) hi _

theorem recycledLineIntensityCost_eq_clock {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (hn : 0<n)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (s : AugTimedState cfg) (hk : s.val.1.physical.clocks L≤K) (N : ℕ) (hN : N≤1)
    (k : ℕ) (ω : BoardClockPath n)
    (hstage : ∀i<k,occupancy (augRecycledPair cfg ε M hn s i ω).1.val.1.physical.process L=N) :
    recycledLineIntensityCost cfg ε M hn L s k ω=
      specifiedClockHazardPotential N ((augRecycledPair cfg ε M hn s k ω).1.val.1.physical.clocks L)-
      specifiedClockHazardPotential N (s.val.1.physical.clocks L) := by
  induction k with
  | zero => simp [recycledLineIntensityCost,augRecycledPair,RecycledBoardProcess.iterate]
  | succ k ih =>
    let sk := (augRecycledPair cfg ε M hn s k ω).1
    let zk := WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2
    have hprefix := fun i hi=>hstage i (Nat.lt_succ_of_lt hi)
    have hi := ih hprefix
    have hk' := recycled_stage_specifiedClock_le cfg ε M K hn hKcfg L hsp s hk N hN k ω hprefix
    have hstep := augTimedLineIntensityCost_eq_clock cfg ε M K hKcfg hK L hsp sk
      (by rw [show occupancy sk.val.1.physical.process L=N from hstage k (Nat.lt_succ_self k)]; exact hN) hk' zk
    rw [show occupancy sk.val.1.physical.process L=N from hstage k (Nat.lt_succ_self k)] at hstep
    have he : recycledLineIntensityCost cfg ε M hn L s (k+1) ω=
        recycledLineIntensityCost cfg ε M hn L s k ω+augTimedLineIntensityCost cfg ε M L sk zk :=
      Finset.sum_range_succ _ k
    rw [he,hi,hstep]
    change specifiedClockHazardPotential N (sk.val.1.physical.clocks L)-
        specifiedClockHazardPotential N (s.val.1.physical.clocks L)+
        (specifiedClockHazardPotential N ((augTimedStep cfg ε M (sk,zk)).val.1.physical.clocks L)-
          specifiedClockHazardPotential N (sk.val.1.physical.clocks L))=
        specifiedClockHazardPotential N ((augTimedStep cfg ε M (sk,zk)).val.1.physical.clocks L)-
          specifiedClockHazardPotential N (s.val.1.physical.clocks L)
    ring

theorem recycledLineIntensityCost_exp_le {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ) (hn : 0<n)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (s : AugTimedState cfg) (hk : s.val.1.physical.clocks L≤K) (N : ℕ) (hN : N≤1)
    (k : ℕ) (ω : BoardClockPath n)
    (hstage : ∀i<k,occupancy (augRecycledPair cfg ε M hn s i ω).1.val.1.physical.process L=N) :
    Real.exp (recycledLineIntensityCost cfg ε M hn L s k ω)≤(2/(2-K))^2 := by
  have hi := (specifiedClockHazardPotential_bounds N (s.val.1.physical.clocks L) K hN
    (s.property.1.1.2.1.2.1 L).1 hk hK).1
  have hf := specifiedClockHazardPotential_exp_le N
    ((augRecycledPair cfg ε M hn s k ω).1.val.1.physical.clocks L) K hN
    ((augRecycledPair cfg ε M hn s k ω).1.property.1.1.2.1.2.1 L).1
    (recycled_stage_specifiedClock_le cfg ε M K hn hKcfg L hsp s hk N hN k ω hstage) hK
  rw [recycledLineIntensityCost_eq_clock cfg ε M K hn hKcfg hK L hsp s hk N hN k ω hstage]
  exact (Real.exp_le_exp.mpr (sub_le_self _ hi)).trans hf

end NoThreeLine

#print axioms NoThreeLine.recycledLineIntensityCost_eq_clock
#print axioms NoThreeLine.recycledLineIntensityCost_exp_le
