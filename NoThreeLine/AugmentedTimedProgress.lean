import NoThreeLine.AugmentedTimedState
import NoThreeLine.AugmentedProgress

/-! At an unfinished step either the entire candidate wait is consumed or
the finite boundary budget strictly decreases. Done states are absorbing. -/
set_option autoImplicit false
noncomputable section
open Set MeasureTheory

namespace NoThreeLine
open AuxiliaryODE

def AugTimedDone {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) : Prop :=
  s.val.2 = 0 ∨ s.val.1.physical.process.stopped = true

theorem augTimedDone_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (AugTimedDone cfg) := by
  exact (measurable_subtype_coe.snd.eq_const 0).or
    (((ProcessState.measurable_stopped n).comp
      ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst))).eq_const true)

theorem augTimedStep_done {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (s : AugTimedState cfg)
    (hs : AugTimedDone cfg s) (z : (ℝ × Grid n) × ℝ) : augTimedStep cfg ε M (s,z) = s := by
  rcases hs with ht | hs
  · exact augTimedStep_finished cfg ε M s ht z
  · exact augTimedStep_stopped cfg ε M s hs z

theorem augTimedStep_budget_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (s : AugTimedState cfg)
    (z : (ℝ × Grid n) × ℝ) :
    (augTimedStep cfg ε M (s,z)).val.1.physical.boundaryBudget ≤ s.val.1.physical.boundaryBudget := by
  change (augTimedStepPair cfg ε M (s,z)).1.physical.boundaryBudget ≤ _
  unfold augTimedStepPair
  split_ifs
  · exact le_rfl
  · exact augOutcome_budget_le cfg ε M (augTimedInput cfg s) z

theorem augTimedStep_progress {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (s : AugTimedState cfg)
    (z : (ℝ × Grid n) × ℝ) (ht : 0 < z.1.1) :
    AugTimedDone cfg (augTimedStep cfg ε M (s,z)) ∨
      s.val.2 - (augTimedStep cfg ε M (s,z)).val.2 = z.1.1 ∨
      (augTimedStep cfg ε M (s,z)).val.1.physical.boundaryBudget < s.val.1.physical.boundaryBudget := by
  by_cases hdone : AugTimedDone cfg (augTimedStep cfg ε M (s,z))
  · exact Or.inl hdone
  right
  have hbefore : ¬AugTimedDone cfg s := by
    intro hs
    exact hdone (by simpa only [augTimedStep_done cfg ε M s hs z] using hs)
  have hstart : ¬(s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true) := by
    rintro (hs | hs)
    · exact hbefore (Or.inl (le_antisymm hs s.property.2.1))
    · exact hbefore (Or.inr hs)
  have hout : (augTimedStep cfg ε M (s,z)).val =
      (augOutcome cfg ε M (augTimedInput cfg s,z),
        s.val.2-augAdvance cfg ε M (augTimedInput cfg s,z.1.1)) := by
    simp only [augTimedStep,augTimedStepPair,if_neg hstart]
  have hcap := (augGuardTime_mem cfg ε M (augTimedInput cfg s) s.property.1.1).1
  by_cases hcand : z.1.1 ≤ augGuardTime cfg ε M (augTimedInput cfg s)
  · left
    rw [hout]
    change s.val.2 - (s.val.2 - max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) z.1.1)) = z.1.1
    rw [min_eq_right hcand,max_eq_right ht.le]
    ring
  · right
    have hlate : augGuardTime cfg ε M (augTimedInput cfg s) < z.1.1 := lt_of_not_ge hcand
    have ha : augAdvance cfg ε M (augTimedInput cfg s,z.1.1) =
        augGuardTime cfg ε M (augTimedInput cfg s) := by
      change max 0 (min (augGuardTime cfg ε M (augTimedInput cfg s)) z.1.1) = _
      rw [min_eq_left hlate.le,max_eq_right hcap]
    have hr : 0 < (augTimedStep cfg ε M (s,z)).val.2 :=
      lt_of_le_of_ne (augTimedStep cfg ε M (s,z)).property.2.1
        (Ne.symm (fun h => hdone (Or.inl h)))
    have hearly : augGuardTime cfg ε M (augTimedInput cfg s) < (augTimedInput cfg s).2 := by
      rw [hout,ha] at hr
      exact sub_pos.mp hr
    have hnstop : (augOutcome cfg ε M (augTimedInput cfg s,z)).physical.process.stopped ≠ true := by
      intro hs
      exact hdone (Or.inr (by simpa only [hout] using hs))
    rw [hout]
    exact augOutcome_budget_strict cfg ε M (augTimedInput cfg s) s.property.1.1 z hlate hearly
      s.property.2.2 hnstop

end NoThreeLine

#print axioms NoThreeLine.augTimedStep_done
#print axioms NoThreeLine.augTimedStep_budget_le
#print axioms NoThreeLine.augTimedStep_progress
