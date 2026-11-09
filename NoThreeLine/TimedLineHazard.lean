import NoThreeLine.SpecifiedClockHazard
import NoThreeLine.AugmentedWeightGrowth

/-! The real augmented timed update preserves the specified clock through
candidate geometry and boundary resolution. Its line-intensity cost is
exactly the fixed-occupancy clock-potential increment. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

theorem augOutcome_clocks_eq_pre {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (z : (ℝ×Grid n)×ℝ) :
    (augOutcome cfg ε M (x,z)).physical.clocks=(augPreState cfg ε M (x,z)).physical.clocks := by
  have hc := BirthWitness.augmented_resolve_coordinates (augRawOutcome cfg ε M (x,z))
    cfg.directions cfg.B cfg.K cfg.rho ε M
  have hk := congrArg (fun v : Coordinates n=>v.2.1) hc
  simp only [ExtendedState.coordinates] at hk
  exact hk.trans (augRawOutcome_clocks_eq_pre cfg ε M x z)

theorem augTimedStep_specifiedClock_le {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (L : LineIndex n) (hsp : specified cfg.directions L)
    (s : AugTimedState cfg) (hN : occupancy s.val.1.physical.process L≤1)
    (hk : s.val.1.physical.clocks L≤K) (z : (ℝ×Grid n)×ℝ) :
    (augTimedStep cfg ε M (s,z)).val.1.physical.clocks L≤K := by
  change (augTimedStepPair cfg ε M (s,z)).1.physical.clocks L≤K
  unfold augTimedStepPair
  split_ifs with hd
  · exact hk
  · rw [augOutcome_clocks_eq_pre]
    have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    exact selectedCurve_specifiedClock_le cfg (augTimedInput cfg s).1.1 s.property.1.1 K hKcfg L hsp hN hk _
      ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1).2⟩

def augTimedLineIntensityCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (L : LineIndex n)
    (s : AugTimedState cfg) (z : (ℝ×Grid n)×ℝ) : ℝ :=
  if s.val.2≤0 ∨ s.val.1.physical.process.stopped=true then 0 else
    ∫u in (0:ℝ)..augAdvance cfg ε M (augTimedInput cfg s,z.1.1),
      lineIntensity s.val.1.physical.process cfg.mask (selectedCurve cfg ((augTimedInput cfg s).1.1,u)) L

theorem augTimedLineIntensityCost_eq_clock {n : ℕ} (cfg : FlowConfig n) (ε M K : ℝ)
    (hKcfg : cfg.K≤K) (hK : K<2) (L : LineIndex n) (hsp : specified cfg.directions L)
    (s : AugTimedState cfg) (hN : occupancy s.val.1.physical.process L≤1)
    (hk : s.val.1.physical.clocks L≤K) (z : (ℝ×Grid n)×ℝ) :
    augTimedLineIntensityCost cfg ε M L s z=
      specifiedClockHazardPotential (occupancy s.val.1.physical.process L)
        ((augTimedStep cfg ε M (s,z)).val.1.physical.clocks L)-
      specifiedClockHazardPotential (occupancy s.val.1.physical.process L) (s.val.1.physical.clocks L) := by
  by_cases hd : s.val.2≤0 ∨ s.val.1.physical.process.stopped=true
  · simp only [augTimedLineIntensityCost,if_pos hd,augTimedStep,augTimedStepPair,hd,if_true,sub_self]
  · have hs : s.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
    have ht := augAdvance_mem cfg ε M (augTimedInput cfg s) s.property.1.1 z.1.1
    have hh := selected_specifiedLineIntensity_integral cfg (augTimedInput cfg s).1.1 s.property.1.1
      K hKcfg hK L hs hsp hN hk _
      ⟨ht.1,ht.2.trans (augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1).2⟩
    simp only [augTimedLineIntensityCost,if_neg hd,augTimedStep,augTimedStepPair,hd,if_false]
    rw [augOutcome_clocks_eq_pre]
    exact hh

end NoThreeLine

#print axioms NoThreeLine.augTimedStep_specifiedClock_le
#print axioms NoThreeLine.augTimedLineIntensityCost_eq_clock
