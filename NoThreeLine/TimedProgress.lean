import NoThreeLine.TimedState
import NoThreeLine.CappedProgress

/-! At an unfinished step either the entire candidate wait is consumed or
the finite boundary budget strictly decreases. Done states are absorbing. -/
set_option autoImplicit false
noncomputable section
open Set MeasureTheory

namespace NoThreeLine
open AuxiliaryODE

def TimedDone {n : ℕ} (cfg : FlowConfig n) (s : TimedState cfg) : Prop :=
  s.val.2 = 0 ∨ s.val.1.process.stopped = true

theorem timedDone_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (TimedDone cfg) := by
  exact (measurable_subtype_coe.snd.eq_const 0).or
    (((ProcessState.measurable_stopped n).comp
      ((ExtendedState.measurable_process n).comp measurable_subtype_coe.fst)).eq_const true)

theorem timedStep_done {n : ℕ} (cfg : FlowConfig n) (s : TimedState cfg)
    (hs : TimedDone cfg s) (z : (ℝ × Grid n) × ℝ) : timedStep cfg (s,z) = s := by
  rcases hs with ht | hs
  · exact timedStep_finished cfg s ht z
  · exact timedStep_stopped cfg s hs z

theorem timedStep_budget_le {n : ℕ} (cfg : FlowConfig n) (s : TimedState cfg)
    (z : (ℝ × Grid n) × ℝ) :
    (timedStep cfg (s,z)).val.1.boundaryBudget ≤ s.val.1.boundaryBudget := by
  change (timedStepPair cfg (s,z)).1.boundaryBudget ≤ _
  unfold timedStepPair
  split_ifs
  · exact le_rfl
  · exact cappedOutcome_budget_le cfg (timedInput cfg s) z

theorem timedStep_progress {n : ℕ} (cfg : FlowConfig n) (s : TimedState cfg)
    (z : (ℝ × Grid n) × ℝ) (ht : 0 < z.1.1) :
    TimedDone cfg (timedStep cfg (s,z)) ∨
      s.val.2 - (timedStep cfg (s,z)).val.2 = z.1.1 ∨
      (timedStep cfg (s,z)).val.1.boundaryBudget < s.val.1.boundaryBudget := by
  by_cases hdone : TimedDone cfg (timedStep cfg (s,z))
  · exact Or.inl hdone
  right
  have hbefore : ¬TimedDone cfg s := by
    intro hs
    exact hdone (by simpa only [timedStep_done cfg s hs z] using hs)
  have hstart : ¬(s.val.2 ≤ 0 ∨ s.val.1.process.stopped = true) := by
    rintro (hs | hs)
    · exact hbefore (Or.inl (le_antisymm hs s.property.2.1))
    · exact hbefore (Or.inr hs)
  have hout : (timedStep cfg (s,z)).val =
      (cappedOutcome cfg (timedInput cfg s,z),
        s.val.2-cappedAdvance cfg (timedInput cfg s,z.1.1)) := by
    simp only [timedStep,timedStepPair,if_neg hstart]
  have hcap := (cappedGuardTime_mem cfg (timedInput cfg s) s.property.1).1
  by_cases hcand : z.1.1 ≤ cappedGuardTime cfg (timedInput cfg s)
  · left
    rw [hout]
    simp only [cappedAdvance,min_eq_right hcand,max_eq_right ht.le]
    ring
  · right
    have hlate : cappedGuardTime cfg (timedInput cfg s) < z.1.1 := lt_of_not_ge hcand
    have ha : cappedAdvance cfg (timedInput cfg s,z.1.1) =
        cappedGuardTime cfg (timedInput cfg s) := by
      simp only [cappedAdvance,min_eq_left hlate.le,max_eq_right hcap]
    have hr : 0 < (timedStep cfg (s,z)).val.2 :=
      lt_of_le_of_ne (timedStep cfg (s,z)).property.2.1
        (Ne.symm (fun h => hdone (Or.inl h)))
    have hearly : cappedGuardTime cfg (timedInput cfg s) < (timedInput cfg s).2 := by
      rw [hout,ha] at hr
      exact sub_pos.mp hr
    have hnstop : (cappedOutcome cfg (timedInput cfg s,z)).process.stopped ≠ true := by
      intro hs
      exact hdone (Or.inr (by simpa only [hout] using hs))
    rw [hout]
    exact cappedOutcome_budget_strict cfg (timedInput cfg s) s.property.1 z hlate hearly
      s.property.2.2 hnstop

end NoThreeLine

#print axioms NoThreeLine.timedStep_done
#print axioms NoThreeLine.timedStep_budget_le
#print axioms NoThreeLine.timedStep_progress
