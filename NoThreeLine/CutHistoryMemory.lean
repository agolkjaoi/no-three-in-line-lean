import NoThreeLine.EarlierCutHistory
import NoThreeLine.SourceCutAfterCompletion

/-! A finite history remembers the actual deterministic cut once it has
crossed it. Before crossing, it remembers the current observation with
shifted remaining time. This handles genuine early global stopping too. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory Set Filter
namespace NoThreeLine.BirthWitness

def finiteCutMemory {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ) (hδ : 0≤δ)
    (hn : 0<n) : (i : ℕ)→(Fin (i+1)→TimedObservation cfg)→TimedObservation cfg
  | 0,x=>sourceRestrictObservation cfg δ hδ (x 0)
  | i+1,x=>
    if crossesCut cfg δ (x (Fin.castSucc (Fin.last i))) (x (Fin.last (i+1))) then
      interiorCutObservation cfg ε M start δ hδ hn (x (Fin.castSucc (Fin.last i)))
    else if δ<(x (Fin.last (i+1))).1.val.2 then
      sourceRestrictObservation cfg δ hδ (x (Fin.last (i+1)))
    else finiteCutMemory cfg ε M start δ hδ hn i (fun q=>x q.castSucc)

theorem finiteCutMemory_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (i : ℕ) :
    Measurable (finiteCutMemory cfg ε M start δ hδ hn i) := by
  induction i with
  | zero => exact (sourceRestrictObservation_measurable cfg δ hδ).comp (measurable_pi_apply 0)
  | succ i ih =>
    have hs (q : Fin ((i+1)+1)) : Measurable (fun x : Fin ((i+1)+1)→TimedObservation cfg=>x q) :=
      measurable_pi_apply q
    apply Measurable.ite
    · exact (measurableSet_lt (hs (Fin.last (i+1))).fst.subtype_val.snd measurable_const).inter
        (measurableSet_lt measurable_const (hs (Fin.castSucc (Fin.last i))).fst.subtype_val.snd)
    · exact (interiorCutObservation_measurable cfg ε M start δ hδ hn).comp (measurable_pi_apply _)
    · apply Measurable.ite
      · exact measurableSet_lt measurable_const (hs (Fin.last (i+1))).fst.subtype_val.snd
      · exact (sourceRestrictObservation_measurable cfg δ hδ).comp (measurable_pi_apply _)
      · exact ih.comp (measurable_pi_lambda _ (fun q=>measurable_pi_apply q.castSucc))

theorem finiteCutMemory_actual {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hstart : δ<s.val.1.val.2)
    (hne : ∀j,δ≠(observedRecycledPair cfg ε M start hn s.val j ω).1.1.val.2) (i : ℕ) :
    (δ<(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2→
      finiteCutMemory cfg ε M start δ hδ hn i (observedPast cfg ε M start hn s.val i ω)=
        sourceRestrictObservation cfg δ hδ (observedRecycledPair cfg ε M start hn s.val i ω).1) ∧
    ((observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2<δ→
      finiteCutMemory cfg ε M start δ hδ hn i (observedPast cfg ε M start hn s.val i ω)=
        sourceCutTerminal cfg ε M start δ hδ hn s ω) := by
  induction i with
  | zero => exact ⟨fun _=>rfl,fun h=>False.elim (not_lt_of_gt hstart h)⟩
  | succ i ih =>
    have hr := observed_remaining_antitone cfg ε M start hn s ω (Nat.le_succ i)
    have hprefix : (fun q : Fin (i+1)=>observedPast cfg ε M start hn s.val (i+1) ω q.castSucc)=
        observedPast cfg ε M start hn s.val i ω := rfl
    change ((δ<_→(if crossesCut cfg δ _ _ then _ else if δ<_ then _ else _)=_) ∧
      (_<δ→(if crossesCut cfg δ _ _ then _ else if δ<_ then _ else _)=_))
    rw [hprefix]
    have hl : observedPast cfg ε M start hn s.val (i+1) ω (Fin.last (i+1))=
        (observedRecycledPair cfg ε M start hn s.val (i+1) ω).1 := rfl
    have hp : observedPast cfg ε M start hn s.val (i+1) ω (Fin.castSucc (Fin.last i))=
        (observedRecycledPair cfg ε M start hn s.val i ω).1 := rfl
    rw [hl,hp]
    constructor
    · intro hi
      rw [if_neg (by change ¬(_<δ ∧ δ<_); exact fun h=>(not_lt_of_gt hi) h.1),if_pos hi]
    · intro hi
      by_cases hc : δ<(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2
      · rw [if_pos (show crossesCut cfg δ _ _ from ⟨hi,hc⟩)]
        exact (sourceCutTerminal_eq_interiorCut_of_crossing cfg ε M start δ hδ hn s i ω ⟨hi,hc⟩).symm
      · rw [if_neg (show ¬crossesCut cfg δ _ _ from fun h=>hc h.2),if_neg (not_lt_of_gt hi)]
        exact ih.2 (lt_of_le_of_ne (le_of_not_gt hc) (Ne.symm (hne i)))

theorem finiteCutMemory_stable_actual {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (ω : BoardClockPath n)
    (hstart : δ<s.val.1.val.2)
    (hne : ∀j,δ≠(observedRecycledPair cfg ε M start hn s.val j ω).1.1.val.2)
    (hd : AugTimedDone cfg (augRecycledTerminal cfg ε M hn s.val.1 ω)) :
    ∀ᶠi in atTop,finiteCutMemory cfg ε M start δ hδ hn i (observedPast cfg ε M start hn s.val i ω)=
      sourceCutTerminal cfg ε M start δ hδ hn s ω := by
  let N := augRecycledCompletionIndex cfg ε M hn s.val.1 ω
  have hterm : AugTimedDone cfg (observedRecycledPair cfg ε M start hn s.val N ω).1.1 := by
    change AugTimedDone cfg (observedRecycledTerminal cfg ε M start hn (s.val,ω)).1
    rw [observedRecycledTerminal_base]
    exact hd
  filter_upwards [eventually_ge_atTop N] with i hi
  have he := observedRecycledPair_absorbing cfg ε M start hn s.val ω N hterm i hi
  have hval : (observedRecycledPair cfg ε M start hn s.val i ω).1=
      observedRecycledTerminal cfg ε M start hn (s.val,ω) := congrArg Prod.fst he
  rcases lt_or_gt_of_ne (hne N) with hR | hR
  · have hRi : δ<(observedRecycledPair cfg ε M start hn s.val i ω).1.1.val.2 := by
      rw [he]
      exact hR
    rw [(finiteCutMemory_actual cfg ε M start δ hδ hn s ω hstart hne i).1 hRi,hval]
    apply (sourceCutTerminal_after_completion cfg ε M start δ hδ hn s ω hd _).symm
    rw [elapsedTime_eq_observed_remaining]
    linarith
  · apply (finiteCutMemory_actual cfg ε M start δ hδ hn s ω hstart hne i).2
    rw [he]
    exact hR

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.finiteCutMemory_actual
#print axioms NoThreeLine.BirthWitness.finiteCutMemory_stable_actual
