import NoThreeLine.AugmentedWeightGrowth
import NoThreeLine.ScheduledWeightFloor

/-! A potential subtracting the actual specified-clock budget telescopes
through physical/auxiliary resolution and the actual timed step. -/
set_option autoImplicit false
noncomputable section

namespace NoThreeLine
open AuxiliaryODE PrimitiveLines

def weightGrowthPotential {n : ℕ} (Γ : Finset ZPoint) (K : ℝ) (p : Grid n)
    (e : ExtendedState n) : ℝ :=
  Real.log (e.process.accounts p).weight-rootDesignatedClock Γ p e.clocks/(2-K)

theorem weightGrowthPotential_resolve {n : ℕ} (a : AugmentedState n)
    (Γ : Finset ZPoint) (B K ρ ε M K' : ℝ) (p : Grid n) :
    weightGrowthPotential Γ K' p (a.resolve Γ B K ρ ε M).physical=
      weightGrowthPotential Γ K' p a.physical := by
  have he := BirthWitness.augmented_resolve_coordinates a Γ B K ρ ε M
  have hw := congrArg (fun z : Coordinates n=>z.1 p) he
  have hk := congrArg (fun z : Coordinates n=>z.2.1) he
  unfold weightGrowthPotential
  simp only [ExtendedState.coordinates] at hw hk
  rw [hw,hk]

theorem augOutcome_growthPotential_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (K ρ : ℝ)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK : K<2)
    (hg : ActiveLineGuardBounds cfg.directions K ρ x.1.1.val)
    (hf : x.1.1.val.process.ActiveWeightFloor cfg.directions)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (hstop : x.1.1.val.process.stopped=false) (z : (ℝ×Grid n)×ℝ) (p : Grid n)
    (hp : ((augOutcome cfg ε M (x,z)).physical.process.accounts p).status=.active) :
    weightGrowthPotential cfg.directions K p (augOutcome cfg ε M (x,z)).physical≤
      weightGrowthPotential cfg.directions K p x.1.1.val+
      (cfg.B/n)*augAdvance cfg ε M (x,z.1.1)+
      selectedOutsideRiskIntegral cfg x.1.1 p (augAdvance cfg ε M (x,z.1.1)) := by
  have hpraw : ((augRawOutcome cfg ε M (x,z)).physical.process.accounts p).status=.active :=
    (ProcessState.mem_activeEvents _ p).mp (BirthWitness.augmented_resolve_active_subset
      (augRawOutcome cfg ε M (x,z)) cfg.directions cfg.B cfg.K cfg.rho ε M
      ((ProcessState.mem_activeEvents _ p).mpr hp))
  have hh := augRawOutcome_log_growth_le cfg ε M x he K ρ hKcfg hρcfg hK hg hf hB hm hstop z p hpraw
  change weightGrowthPotential cfg.directions K p
    ((augRawOutcome cfg ε M (x,z)).resolve cfg.directions cfg.B cfg.K cfg.rho ε M).physical≤_
  rw [weightGrowthPotential_resolve]
  unfold weightGrowthPotential
  rw [sub_div] at hh
  linarith

def augTimedOutsideRiskCost {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : AugTimedState cfg) (z : (ℝ×Grid n)×ℝ) : ℝ :=
  if s.val.2≤0 ∨ s.val.1.physical.process.stopped=true then 0 else
    selectedOutsideRiskIntegral cfg (augTimedInput cfg s).1.1 p
      (augAdvance cfg ε M (augTimedInput cfg s,z.1.1))

theorem augTimedStep_active_subset {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (z : (ℝ×Grid n)×ℝ) :
    (augTimedStep cfg ε M (s,z)).val.1.physical.process.activeEvents⊆s.val.1.physical.process.activeEvents := by
  change (augTimedStepPair cfg ε M (s,z)).1.physical.process.activeEvents⊆_
  unfold augTimedStepPair
  split_ifs
  · exact Finset.Subset.refl _
  · exact BirthWitness.augOutcome_active_subset cfg ε M (augTimedInput cfg s,z)

theorem augTimedStep_growthPotential_le {n : ℕ} (cfg : FlowConfig n) (ε M K ρ : ℝ)
    (hKcfg : cfg.K≤K) (hρcfg : ρ≤cfg.rho) (hK : K<2)
    (hB : 0<cfg.B) (hm : ∀q,cfg.mask q≤1)
    (s : AugTimedState cfg) (hg : ActiveLineGuardBounds cfg.directions K ρ s.val.1.physical)
    (hf : s.val.1.physical.process.ActiveWeightFloor cfg.directions)
    (z : (ℝ×Grid n)×ℝ) (p : Grid n)
    (hp : ((augTimedStep cfg ε M (s,z)).val.1.physical.process.accounts p).status=.active) :
    weightGrowthPotential cfg.directions K p (augTimedStep cfg ε M (s,z)).val.1.physical≤
      weightGrowthPotential cfg.directions K p s.val.1.physical+
      (cfg.B/n)*(s.val.2-(augTimedStep cfg ε M (s,z)).val.2)+augTimedOutsideRiskCost cfg ε M p s z := by
  by_cases hd : s.val.2≤0 ∨ s.val.1.physical.process.stopped=true
  · simp only [augTimedStep,augTimedStepPair,if_pos hd,augTimedOutsideRiskCost,sub_self,mul_zero,add_zero]
    exact le_rfl
  have hs : s.val.1.physical.process.stopped=false := Bool.eq_false_iff.mpr (not_or.mp hd).2
  have hp' : ((augOutcome cfg ε M (augTimedInput cfg s,z)).physical.process.accounts p).status=.active := by
    simpa only [augTimedStep,augTimedStepPair,if_neg hd] using hp
  have hh := augOutcome_growthPotential_le cfg ε M (augTimedInput cfg s) s.property.1.1 K ρ
    hKcfg hρcfg hK hg hf hB hm hs z p hp'
  simpa only [augTimedStep,augTimedStepPair,if_neg hd,augTimedOutsideRiskCost,sub_sub_cancel,augTimedInput] using hh

end NoThreeLine

#print axioms NoThreeLine.weightGrowthPotential_resolve
#print axioms NoThreeLine.augTimedStep_growthPotential_le
