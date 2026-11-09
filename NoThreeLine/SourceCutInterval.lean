import NoThreeLine.SourceInteriorCut

/-! Identify the restricted terminal on any original-board update interval
whose interior contains the cut. The finite prefix, retained birth records,
and selected physical/eta curve all come from the same uncut realization. -/
set_option autoImplicit false
noncomputable section
open Set

namespace NoThreeLine.BirthWitness
open EtaMixedGenerator

theorem observedRecycledTerminal_eq_at_done {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : TimedObservation cfg) (ω : BoardClockPath n) (k : ℕ)
    (hk : AugTimedDone cfg (observedRecycledPair cfg ε M start hn s k ω).1.1) :
    observedRecycledTerminal cfg ε M start hn (s,ω)=
      (observedRecycledPair cfg ε M start hn s k ω).1 := by
  let N := augRecycledCompletionIndex cfg ε M hn s.1 ω
  have hd : AugTimedDone cfg (observedRecycledPair cfg ε M start hn s N ω).1.1 := by
    change AugTimedDone cfg (observedRecycledTerminal cfg ε M start hn (s,ω)).1
    rw [observedRecycledTerminal_base]
    apply augRecycledTerminal_done_of_exists
    refine ⟨k,?_⟩
    rw [←congrArg Prod.fst (observedRecycledPair_base cfg ε M start hn s k ω)]
    exact hk
  change (observedRecycledPair cfg ε M start hn s N ω).1=_
  rcases le_total N k with h | h
  · exact congrArg Prod.fst (observedRecycledPair_absorbing cfg ε M start hn s ω N hd k h).symm
  · exact congrArg Prod.fst (observedRecycledPair_absorbing cfg ε M start hn s ω k hk N h)

theorem sourceRestrict_iterate_interior {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ ∈ Ioo (elapsedTime cfg ε M start hn s k ω)
      (elapsedTime cfg ε M start hn s (k+1) ω)) :
    let x := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω
    let y := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M (start-δ) hn)
      (sourceRestrictGood cfg δ hδ s) (k+1) ω
    y.1.val.1.val=(selectedAugmentedCurve cfg (augTimedInput cfg x.1.val.1).1
      ((s.val.1.val.2-δ)-elapsedTime cfg ε M start hn s k ω),0) ∧ y.1.val.2=x.1.val.2 := by
  let x := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω
  have hd := (elapsed_segment_context cfg ε M start hn s k ω (s.val.1.val.2-δ) ht).1
  change ¬observationDone cfg x.1.val at hd
  have hstop : x.1.val.1.val.1.physical.process.stopped=false := by
    exact Bool.eq_false_iff.mpr (fun h => hd (Or.inr h))
  have hc : 0<x.1.val.1.val.2-δ := by
    have hleft := ht.1
    change s.val.1.val.2-x.1.val.1.val.2<s.val.1.val.2-δ at hleft
    linarith
  have hgap := elapsedTime_succ_sub cfg ε M start hn s k ω
  change _=observedAdvance cfg ε M (x.1.val,WinnerMarkLaw.firstMarkedRace hn x.2) at hgap
  simp only [observedAdvance,if_neg hd] at hgap
  have he : elapsedTime cfg ε M start hn s k ω=s.val.1.val.2-x.1.val.1.val.2 := rfl
  have hcut : x.1.val.1.val.2-δ<augAdvance cfg ε M
      (augTimedInput cfg x.1.val.1,(WinnerMarkLaw.firstMarkedRace hn x.2).1.1) := by
    linarith [ht.2]
  have hh := sourceRestrict_interior_observation cfg ε M start δ hδ x.1.val
    (WinnerMarkLaw.firstMarkedRace hn x.2) hc hstop hcut
  have hprefix := sourceRestrict_iterate_before cfg ε M start δ hδ hn s k ω ht.1
  dsimp only
  change (goodObservedRestartStep cfg ε M (start-δ) hn
    (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M (start-δ) hn)
      (sourceRestrictGood cfg δ hδ s) k ω)).1.val.1.val=_ ∧
    (goodObservedRestartStep cfg ε M (start-δ) hn
    (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M (start-δ) hn)
      (sourceRestrictGood cfg δ hδ s) k ω)).1.val.2=_
  rw [hprefix]
  change (observedStep cfg ε M (start-δ)
    (sourceRestrictObservation cfg δ hδ x.1.val,WinnerMarkLaw.firstMarkedRace hn x.2)).1.val=_ ∧
    (observedStep cfg ε M (start-δ)
    (sourceRestrictObservation cfg δ hδ x.1.val,WinnerMarkLaw.firstMarkedRace hn x.2)).2=x.1.val.2
  have htime : s.val.1.val.2-δ-elapsedTime cfg ε M start hn s k ω=x.1.val.1.val.2-δ := by
    rw [he]
    ring
  rw [htime]
  exact hh

theorem sourceCutTerminal_interior {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (k : ℕ) (ω : BoardClockPath n)
    (ht : s.val.1.val.2-δ ∈ Ioo (elapsedTime cfg ε M start hn s k ω)
      (elapsedTime cfg ε M start hn s (k+1) ω)) :
    let x := RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M start hn) s k ω
    (sourceCutTerminal cfg ε M start δ hδ hn s ω).1.val=
      (selectedAugmentedCurve cfg (augTimedInput cfg x.1.val.1).1
        ((s.val.1.val.2-δ)-elapsedTime cfg ε M start hn s k ω),0) ∧
    (sourceCutTerminal cfg ε M start δ hδ hn s ω).2=x.1.val.2 := by
  have hh := sourceRestrict_iterate_interior cfg ε M start δ hδ hn s k ω ht
  have hp := congrArg Prod.fst (goodObservedRecycled_projection cfg ε M (start-δ) hn
    (sourceRestrictGood cfg δ hδ s) (k+1) ω)
  change (RecycledBoardProcess.iterate (goodObservedRestartStep cfg ε M (start-δ) hn)
    (sourceRestrictGood cfg δ hδ s) (k+1) ω).1.val=
      (observedRecycledPair cfg ε M (start-δ) hn (sourceRestrictGood cfg δ hδ s).val (k+1) ω).1 at hp
  have hd : AugTimedDone cfg (observedRecycledPair cfg ε M (start-δ) hn
      (sourceRestrictGood cfg δ hδ s).val (k+1) ω).1.1 := by
    rw [←hp]
    exact Or.inl (congrArg Prod.snd hh.1)
  have hterm := observedRecycledTerminal_eq_at_done cfg ε M (start-δ) hn
    (sourceRestrictGood cfg δ hδ s).val ω (k+1) hd
  dsimp only
  unfold sourceCutTerminal
  rw [hterm,←hp]
  exact hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedRecycledTerminal_eq_at_done
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_interior
