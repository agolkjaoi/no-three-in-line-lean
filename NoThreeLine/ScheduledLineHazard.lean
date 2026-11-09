import NoThreeLine.ScheduledLineSurvival

/-! The scheduled density is the survival indicator times the exponential
of the actual accumulated line-intensity integrals, across changing
physical masks. Deadline retirement contributes no clock increment. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem terminalLineIntensityCost_eq_clock {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (N : ℕ) (hN : N≤1) (hn : 0<n) (s : AugTimedState cfg)
    (ho : occupancy s.val.1.physical.process L=N) (hk : s.val.1.physical.clocks L≤K)
    (ω : BoardClockPath n)
    (ht : occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L=N) :
    recycledLineIntensityCost cfg ε M hn L s (augRecycledCompletionIndex cfg ε M hn s ω) ω=
      specifiedClockHazardPotential N ((augRecycledTerminal cfg ε M hn s ω).val.1.physical.clocks L)-
      specifiedClockHazardPotential N (s.val.1.physical.clocks L) := by
  apply recycledLineIntensityCost_eq_clock cfg ε M K hn hKcfg hK L hsp s hk N hN
  intro i hi
  have hlo := recycled_occupancy_monotone cfg ε M L hn s ω (Nat.zero_le i)
  have hhi := recycled_occupancy_monotone cfg ε M L hn s ω hi.le
  change occupancy s.val.1.physical.process L≤occupancy (augRecycledPair cfg ε M hn s i ω).1.val.1.physical.process L at hlo
  change occupancy (augRecycledPair cfg ε M hn s i ω).1.val.1.physical.process L≤
    occupancy (augRecycledTerminal cfg ε M hn s ω).val.1.physical.process L at hhi
  omega

def scheduledLineIntensityCost {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (L : LineIndex n) (e : ValidAugmentedState n B) (J : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∑j∈Finset.range J,
    let s := augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω)
    let v := (recycledPhases cs ε M deadline start hn e j ω).2
    recycledLineIntensityCost (cs j).config ε M hn L s (augRecycledCompletionIndex (cs j).config ε M hn s v) v

theorem scheduledTerminal_clocks {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (e : ValidAugmentedState n B) (j : ℕ) (ω : BoardClockPath n) :
    (augRecycledTerminal (cs j).config ε M hn
      (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω))
      (recycledPhases cs ε M deadline start hn e j ω).2).val.1.physical.clocks=
    (recycledPhaseState cs ε M deadline start hn e (j+1) ω).val.physical.clocks := by
  rw [recycledPhaseState_succ_eq,recycledScheduledPair,augValidDeadlineRetirement_clocks]
  rfl

theorem scheduledLineIntensityCost_eq_clock {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K)
    (J : ℕ) (ω : BoardClockPath n)
    (hsurv : occupancy (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process L=N) :
    scheduledLineIntensityCost cs ε M deadline start hn L e J ω=
      specifiedClockHazardPotential N ((recycledPhaseState cs ε M deadline start hn e J ω).val.physical.clocks L)-
      specifiedClockHazardPotential N (e.val.physical.clocks L) := by
  induction J with
  | zero => simp [scheduledLineIntensityCost,recycledPhaseState,recycledPhases,RecycledBoardProcess.iterate]
  | succ j ih =>
    have ho := recycledPhaseState_occupancy_prefix cs ε M deadline start hn L N e he (j+1) ω hsurv j (Nat.le_succ j)
    have hi := ih ho
    have hr := recycledPhaseState_lineStageRegion cs ε M K deadline start hn hKcfg L hsp N hN e ⟨he.ge,fun _=>hk⟩ j ω
    have ht := hsurv
    rw [←scheduledTerminal_occupancy cs ε M deadline start hn e j ω L] at ht
    have hc := terminalLineIntensityCost_eq_clock (cs j).config ε M K (hKcfg j) hK L (hsp j) N hN hn
      (augPhaseStart (cs j).config ε M (recycledPhaseState cs ε M deadline start hn e j ω)) ho (hr.2 ho)
      (recycledPhases cs ε M deadline start hn e j ω).2 ht
    rw [scheduledTerminal_clocks cs ε M deadline start hn e j ω] at hc
    rw [scheduledLineIntensityCost,Finset.sum_range_succ]
    change scheduledLineIntensityCost cs ε M deadline start hn L e j ω+_=_
    rw [hi,hc]
    change specifiedClockHazardPotential N ((recycledPhaseState cs ε M deadline start hn e j ω).val.physical.clocks L)-
      specifiedClockHazardPotential N (e.val.physical.clocks L)+
      (specifiedClockHazardPotential N ((recycledPhaseState cs ε M deadline start hn e (j+1) ω).val.physical.clocks L)-
        specifiedClockHazardPotential N ((recycledPhaseState cs ε M deadline start hn e j ω).val.physical.clocks L))=_
    ring

theorem scheduledLineStageDensity_formula {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M K : ℝ) (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n)
    (hKcfg : ∀j,(cs j).K≤K) (hK : K<2) (L : LineIndex n) (hsp : ∀j,specified (cs j).directions L)
    (N : ℕ) (hN : N≤1) (e : ValidAugmentedState n B)
    (he : occupancy e.val.physical.process L=N) (hk : e.val.physical.clocks L≤K)
    (J : ℕ) (ω : BoardClockPath n) :
    scheduledLineStageDensity cs ε M K deadline start hn L N e J ω=
      if occupancy (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process L=N then
        Real.exp (scheduledLineIntensityCost cs ε M deadline start hn L e J ω) else 0 := by
  have hr := recycledPhaseState_lineStageRegion cs ε M K deadline start hn hKcfg L hsp N hN e ⟨he.ge,fun _=>hk⟩ J ω
  by_cases hs : occupancy (recycledPhaseState cs ε M deadline start hn e J ω).val.physical.process L=N
  · rw [if_pos hs,scheduledLineIntensityCost_eq_clock cs ε M K deadline start hn hKcfg hK L hsp N hN e he hk J ω hs]
    unfold scheduledLineStageDensity validLineStageDensity validLineStageValue
    rw [if_pos ⟨hs,hr.2 hs⟩,←Real.exp_add]
    congr 1
    ring
  · simp only [scheduledLineStageDensity,validLineStageDensity,validLineStageValue,hs,false_and,if_false,mul_zero]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledLineIntensityCost_eq_clock
#print axioms NoThreeLine.BirthWitness.scheduledLineStageDensity_formula
