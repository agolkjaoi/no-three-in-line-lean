import NoThreeLine.ExtendedState

/-! Full-state measurability of tag bookkeeping and boundary resolution. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

theorem measurable_decide_pred {X : Type*} [MeasurableSpace X] (P : X → Prop)
    [DecidablePred P] (h : Measurable P) : Measurable (fun x => decide (P x)) := by
  have he : (fun x => decide (P x)) = fun x => if P x then true else false := by
    funext x
    by_cases hx : P x <;> simp [hx]
  rw [he]
  exact Measurable.ite h.setOf measurable_const measurable_const

theorem ExtendedState.measurable_occupancy (n : ℕ) (L : LineIndex n) :
    Measurable (fun e : ExtendedState n => occupancy e.process L) :=
  (measurable_of_countable (fun S : Finset (Grid n) => (S ∩ L.val).card)).comp
    ((ProcessState.measurable_selected n).comp (measurable_process n))

theorem ExtendedState.measurable_newTags {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (ρ : ℝ) :
    Measurable (fun e : ExtendedState n => newTags e.process Γ e.lineCredits ρ e.handled) := by
  apply measurable_finset_iff.mpr
  intro L
  have hN := (measurable_occupancy n L).eq_const 1
  have hR := ((measurable_pi_apply L).comp (measurable_lineCredits n)).le' (measurable_const (a := ρ))
  have hH := (measurable_finset_notMem L).comp (measurable_handled n)
  have hS : Measurable (fun _ : ExtendedState n => ¬specified Γ L) := measurable_const
  simpa only [newTags,triggeredTags,Finset.mem_sdiff,Finset.mem_filter,Finset.mem_univ,true_and,Function.comp_def]
    using (hS.and (hN.and hR)).and hH

theorem ExtendedState.measurable_handledAfter {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (ρ : ℝ) :
    Measurable (fun e : ExtendedState n => handledAfter e.process Γ e.lineCredits ρ e.handled) := by
  apply measurable_finset_iff.mpr
  intro L
  simp only [handledAfter,Finset.mem_union]
  exact ((measurable_finset_mem L).comp (measurable_handled n)).or
    ((measurable_finset_mem L).comp (measurable_newTags Γ ρ))

theorem ExtendedState.measurable_clockTriggered {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint) (K : ℝ) :
    Measurable (fun e : ExtendedState n => clockTriggered e.process Γ K e.clocks) := by
  apply Measurable.exists
  intro L
  exact measurable_const.and (((measurable_occupancy n L).le' measurable_const).and
    (measurable_const.le' ((measurable_pi_apply L).comp (measurable_clocks n))))

theorem ExtendedState.measurable_boundaryRetirement {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (B ρ : ℝ) :
    Measurable (fun e : ExtendedState n => boundaryRetirement e.process Γ B ρ e.lineCredits e.handled) := by
  apply measurable_pi_lambda
  intro p
  apply measurable_decide_pred
  apply Measurable.or
  · exact measurable_const.le' (CreditAccount.measurable_weight.comp
      ((ProcessState.measurable_account n p).comp (measurable_process n)))
  · apply Measurable.exists
    intro L
    exact ((measurable_finset_mem L).comp (measurable_newTags Γ ρ)).and measurable_const

theorem ExtendedState.measurable_resolve {n : ℕ} (Γ : Finset PrimitiveLines.ZPoint)
    (B K ρ : ℝ) : Measurable (fun e : ExtendedState n => e.resolve Γ B K ρ) := by
  apply measurable_mk _ _ _ _ _ (measurable_clocks n) (measurable_lineCredits n)
    (measurable_handledAfter Γ ρ)
  unfold resolveBoundary
  apply Measurable.ite (measurable_clockTriggered Γ K).setOf
  · exact (ProcessState.measurable_stop n).comp (measurable_process n)
  · exact (ProcessState.measurable_retire n).comp
      ((measurable_process n).prodMk (measurable_boundaryRetirement Γ B ρ))

end NoThreeLine

#print axioms NoThreeLine.ExtendedState.measurable_newTags
#print axioms NoThreeLine.ExtendedState.measurable_resolve
