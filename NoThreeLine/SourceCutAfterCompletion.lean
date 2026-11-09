import NoThreeLine.SourceCutInterval

/-! A cut after the original process has already stopped preserves that
actual stopped physical/eta state and every birth record. Only the unused
remaining-time coordinate is shifted. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine.BirthWitness

theorem sourceCutTerminal_after_completion {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω))
    (ht : elapsedTime cfg ε M start hn s
        (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω<s.val.1.val.2-δ) :
    sourceCutTerminal cfg ε M start δ hδ hn s ω=
      sourceRestrictObservation cfg δ hδ (observedRecycledTerminal cfg ε M start hn (s.val,ω)) := by
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1 ω
  let x := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s N ω
  have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M start hn s N ω)
  change x.1.val=observedRecycledTerminal cfg ε M start hn (s.val,ω) at hp
  have hbase : x.1.val.1=augRecycledTerminal cfg ε M hn s.val.1 ω :=
    (congrArg Prod.fst hp).trans (observedRecycledTerminal_base cfg ε M start hn (s.val,ω))
  have hxR : 0<x.1.val.1.val.2 := by
    change s.val.1.val.2-x.1.val.1.val.2<s.val.1.val.2-δ at ht
    linarith
  have hxDone : AugTimedDone cfg x.1.val.1 := by rw [hbase]; exact hd
  have hxStop : x.1.val.1.val.1.physical.process.stopped=true :=
    hxDone.resolve_left (ne_of_gt hxR)
  have hprefix := sourceRestrict_iterate_before cfg ε M start δ hδ hn s N ω ht
  have hproj := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M (start-δ) hn
    (sourceRestrictGood cfg δ hδ s) N ω)
  change (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M (start-δ) hn)
    (sourceRestrictGood cfg δ hδ s) N ω).1.val=
    (observedRecycledPair cfg ε M (start-δ) hn (sourceRestrictGood cfg δ hδ s).val N ω).1 at hproj
  have heq : (observedRecycledPair cfg ε M (start-δ) hn
      (sourceRestrictGood cfg δ hδ s).val N ω).1=sourceRestrictObservation cfg δ hδ x.1.val := by
    rw [←hproj,hprefix]
    rfl
  have hdnew : AugTimedDone cfg (observedRecycledPair cfg ε M (start-δ) hn
      (sourceRestrictGood cfg δ hδ s).val N ω).1.1 := by
    rw [heq]
    exact Or.inr hxStop
  unfold sourceCutTerminal
  rw [observedRecycledTerminal_eq_at_done cfg ε M (start-δ) hn
    (sourceRestrictGood cfg δ hδ s).val ω N hdnew,heq,hp]

theorem sourceCutTerminal_after_completion_augmented {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω))
    (ht : elapsedTime cfg ε M start hn s
        (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω<s.val.1.val.2-δ) :
    (sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val.1=
      (augRecycledTerminal cfg ε M hn s.val.1 ω).val.1 := by
  rw [sourceCutTerminal_after_completion cfg ε M start δ hδ hn s ω hd ht]
  change (observedRecycledTerminal cfg ε M start hn (s.val,ω)).1.val.1=_
  rw [observedRecycledTerminal_base]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_after_completion
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_after_completion_augmented
