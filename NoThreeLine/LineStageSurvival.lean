import NoThreeLine.LineStageLikelihood
import NoThreeLine.RecycledLineHazard

/-! Actual occupancy survival on the entire phase and a density lower
bound on that event. Completion is proved almost surely elsewhere; the
pathwise lemmas keep its hypothesis explicit. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem recycled_occupancy_monotone {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hn : 0<n) (s : AugTimedState cfg) (ω : BoardClockPath n) :
    Monotone (fun k=>occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L) := by
  apply monotone_nat_of_le_succ
  intro k
  exact augTimedStep_occupancy_le cfg ε M L _ _

theorem recycled_occupancy_le_terminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (hn : 0<n) (s : AugTimedState cfg) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω)) (k : ℕ) :
    occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L≤
      occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L := by
  let j := augRecycledCompletionIndex cfg ε M hn s ω
  by_cases hk : k≤j
  · exact recycled_occupancy_monotone cfg ε M L hn s ω hk
  · have he := augRecycledPair_absorbing cfg ε M hn s ω j hd k (le_of_not_ge hk)
    rw [he]
    exact le_rfl

theorem recycled_occupancy_eq_of_terminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (N : ℕ) (hn : 0<n) (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (ω : BoardClockPath n) (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω))
    (ht : occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L=N) (k : ℕ) :
    occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L=N := by
  have hlo := recycled_occupancy_monotone cfg ε M L hn s ω (Nat.zero_le k)
  change occupancy s.val.1.physical.process L≤occupancy (augRecycledPair cfg ε M hn s k ω).1.val.1.physical.process L at hlo
  have hhi := recycled_occupancy_le_terminal cfg ε M L hn s ω hd k
  omega

theorem no_line_birth_of_terminal_occupancy {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (N : ℕ) (hn : 0<n) (s : AugTimedState cfg) (ho : occupancy s.val.1.physical.process L=N)
    (ω : BoardClockPath n) (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω))
    (ht : occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L=N) (k : ℕ) :
    ¬(timedBirth cfg ε M ((augRecycledPair cfg ε M hn s k ω).1,
          WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2) ∧
        (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2).1.2∈L.val) := by
  intro hb
  have hi := recycled_occupancy_eq_of_terminal cfg ε M L N hn s ho ω hd ht k
  have hj := recycled_occupancy_eq_of_terminal cfg ε M L N hn s ho ω hd ht (k+1)
  have hs := augTimedStep_occupancy cfg ε M L (augRecycledPair cfg ε M hn s k ω).1
    (WinnerMarkLaw.firstMarkedRace hn (augRecycledPair cfg ε M hn s k ω).2)
  change occupancy (augRecycledPair cfg ε M hn s (k+1) ω).1.val.1.physical.process L=_ at hs
  rw [if_pos hb,hi,hj] at hs
  omega

theorem augTimedLineIntensityCost_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (s : AugTimedState cfg) (z : CandidateData n) :
    0≤augTimedLineIntensityCost cfg ε M L s z := by
  unfold augTimedLineIntensityCost
  split_ifs
  · exact le_rfl
  · have ha := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    apply intervalIntegral.integral_nonneg ha.1
    intro t ht
    have hb := (selectedCurve_spec cfg (augTimedInput cfg s).1.1 s.property.1.1.2.1).2.2.1 t
      ⟨ht.1,ht.2.trans (ha.2.trans (augGuardTime_mem cfg ε M _ s.property.1.1).2)⟩
    exact lineIntensity_nonneg _ _ _ cfg.mask_nonneg (fun p=>(hb.1.1 p).1) L

theorem recycledLineIntensityCost_nonneg {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (hn : 0<n) (s : AugTimedState cfg) (k : ℕ) (ω : BoardClockPath n) :
    0≤recycledLineIntensityCost cfg ε M hn L s k ω :=
  Finset.sum_nonneg (fun i _=>augTimedLineIntensityCost_nonneg cfg ε M L _ _)

theorem terminalLineStageDensity_ge_one_of_survival {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (s : AugTimedState cfg)
    (ho : occupancy s.val.1.physical.process L=N) (hk : s.val.1.physical.clocks L≤K)
    (ω : BoardClockPath n) (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s ω))
    (ht : occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L=N) :
    1≤terminalLineStageDensity cfg ε M K L N hn s ω := by
  rw [terminalLineStageDensity_formula cfg ε M K hKcfg L hsp N hN hn s ho hk ω,if_pos ht]
  apply Real.one_le_exp_iff.mpr
  have he := recycledLineIntensityCost_eq_clock cfg ε M K hn hKcfg hK L hsp s hk N hN
    (augRecycledCompletionIndex cfg ε M hn s ω) ω
    (fun i _=>recycled_occupancy_eq_of_terminal cfg ε M L N hn s ho ω hd ht i)
  change 0≤specifiedClockHazardPotential N
    ((augRecycledPair cfg ε M hn s (augRecycledCompletionIndex cfg ε M hn s ω) ω).1.val.1.physical.clocks L)-
    specifiedClockHazardPotential N (s.val.1.physical.clocks L)
  rw [←he]
  exact recycledLineIntensityCost_nonneg cfg ε M L hn s _ ω

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.no_line_birth_of_terminal_occupancy
#print axioms NoThreeLine.BirthWitness.terminalLineStageDensity_ge_one_of_survival
