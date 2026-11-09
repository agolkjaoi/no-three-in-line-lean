import NoThreeLine.AugmentedCappedSegment

/-! An auxiliary contact produces a genuine stop. Hence an unfinished
boundary-only step before the horizon decreases the physical finite budget. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine
open AuxiliaryODE

theorem augOutcome_raw_not_bad {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ((ℝ × Grid n) × ℝ))
    (hs : (augOutcome cfg ε M x).physical.process.stopped ≠ true) :
    ¬(augRawOutcome cfg ε M x).auxBad cfg.directions ε M := by
  intro hb
  exact hs (AugmentedState.resolve_stops_aux _ _ _ _ _ _ _ hb)

theorem augOutcome_physical_eq_capped {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ((ℝ × Grid n) × ℝ))
    (hs : (augOutcome cfg ε M x).physical.process.stopped ≠ true) :
    (augOutcome cfg ε M x).physical = cappedOutcome cfg (augPhysicalInput cfg ε M x.1,x.2) := by
  have hb := augOutcome_raw_not_bad cfg ε M x hs
  unfold augOutcome AugmentedState.resolve
  rw [if_neg hb]
  unfold augRawOutcome cappedOutcome augGuardTime
  simp only [Prod.fst,Prod.snd]
  split_ifs <;> rfl

theorem augPreState_auxBad_iff {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × ((ℝ × Grid n) × ℝ)) :
    (augPreState cfg ε M x).auxBad cfg.directions ε M ↔
      selectedAuxCurve cfg (x.1.1,augAdvance cfg ε M (x.1,x.2.1.1)) ∈
        auxiliaryGuard x.1.1.1.val.process cfg.directions ε M := by
  rfl

theorem augRawOutcome_bad_at_aux {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (z : (ℝ × Grid n) × ℝ)
    (hlate : augGuardTime cfg ε M x < z.1.1)
    (heq : augGuardTime cfg ε M x = selectedAuxTime cfg ε M x.1)
    (hearly : selectedAuxTime cfg ε M x.1 < cfg.horizon) :
    (augRawOutcome cfg ε M (x,z)).auxBad cfg.directions ε M := by
  have hcap := (augGuardTime_mem cfg ε M x he).1
  have ha : augAdvance cfg ε M (x,z.1.1) = selectedAuxTime cfg ε M x.1 := by
    change max 0 (min (augGuardTime cfg ε M x) z.1.1) = _
    rw [min_eq_left hlate.le,max_eq_right hcap,heq]
  simp only [augRawOutcome,not_le_of_gt hlate,and_false,if_false]
  rw [augPreState_auxBad_iff]
  simp only [ha]
  exact selectedAuxTime_contact cfg ε M x.1 hearly

theorem augOutcome_budget_strict {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (z : (ℝ × Grid n) × ℝ)
    (hlate : augGuardTime cfg ε M x < z.1.1) (hearly : augGuardTime cfg ε M x < x.2)
    (hH : x.2 ≤ cfg.horizon)
    (hnstop : (augOutcome cfg ε M (x,z)).physical.process.stopped ≠ true) :
    (augOutcome cfg ε M (x,z)).physical.boundaryBudget < x.1.1.val.boundaryBudget := by
  have haux : augGuardTime cfg ε M x < selectedAuxTime cfg ε M x.1 := by
    by_contra hh
    have heq := le_antisymm (augGuardTime_le_aux cfg ε M x) (le_of_not_gt hh)
    have hb := augRawOutcome_bad_at_aux cfg ε M x he z hlate heq
      ((heq ▸ hearly).trans_le hH)
    exact augOutcome_raw_not_bad cfg ε M (x,z) hnstop hb
  have ho := augOutcome_physical_eq_capped cfg ε M (x,z) hnstop
  rw [ho]
  exact cappedOutcome_budget_strict cfg (augPhysicalInput cfg ε M x) he z hlate
    (lt_min hearly haux) ((min_le_left _ _).trans hH) (by simpa only [ho] using hnstop)

end NoThreeLine

#print axioms NoThreeLine.augOutcome_physical_eq_capped
#print axioms NoThreeLine.augRawOutcome_bad_at_aux
#print axioms NoThreeLine.augOutcome_budget_strict
