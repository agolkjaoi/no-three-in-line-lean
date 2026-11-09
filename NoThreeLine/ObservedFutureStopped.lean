import NoThreeLine.ObservedHistoryFutureCredit
import NoThreeLine.SourceCutAfterCompletion
import NoThreeLine.ObservedActualCutInterval

/-! If the original process completes before the cut while time remains,
it is globally stopped. All original future phases preserve its credit,
and the actual cut has that same credit. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine.BirthWitness

theorem observedScheduledPair_stopped {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j : ℕ) (s : PhaseObservation n B)
    (hs : s.1.val.physical.process.stopped=true) (ω : BoardClockPath n) :
    observedScheduledPair cs ε M deadline start hn j (s,ω)=(s,ω) := by
  unfold observedScheduledPair
  rw [observedPhaseRecycledPair_stopped (cs j).config ε M (phaseEndpoint cs start j) hn s hs ω]
  change ((augValidDeadlineRetirement deadline _ s.1,s.2),ω)=(s,ω)
  rw [augValidDeadlineRetirement_stopped deadline _ s.1 hs]

theorem observedPhaseContinuation_stopped {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ) (s : PhaseObservation n B)
    (hs : s.1.val.physical.process.stopped=true) (ω : BoardClockPath n) :
    observedPhaseContinuation cs ε M deadline start hn j k s ω=((j+k,s),ω) := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change observedPhaseRestartStep cs ε M deadline start hn
      (observedPhaseContinuation cs ε M deadline start hn j k s ω)=_
    rw [ih]
    simp only [observedPhaseRestartStep,observedScheduledPair_stopped cs ε M deadline start hn (j+k) s hs ω]
    rfl

theorem observedAfterTerminal_stopped_credit {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (j k : ℕ)
    (s : TimedObservation (cs j).config) (hs : s.1.val.1.physical.process.stopped=true)
    (ω : BoardClockPath n) (p : Grid n) :
    validAugStateCredit B p (observedAfterTerminal cs ε M deadline start hn j k (s,ω)).1.2.1=
      augTimedCredit (cs j).config p s.1 := by
  unfold observedAfterTerminal
  have he : observedDeadline deadline (phaseEndpoint cs start (j+1)) (observedTimedProjection (cs j).config s)=
      observedTimedProjection (cs j).config s := by
    change (augValidDeadlineRetirement deadline _ (observedTimedProjection (cs j).config s).1,s.2)=_
    rw [augValidDeadlineRetirement_stopped deadline _ _ hs]
    rfl
  rw [he,observedPhaseContinuation_stopped cs ε M deadline start hn (j+1) k _ hs ω]
  rfl

theorem observedFuture_credit_eq_cut_after_completion {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n→ℝ) (start δ : ℝ) (hδ : 0≤δ) (hn : 0<n)
    (j k : ℕ) (s : GoodObservation (cs j).config) (ω : BoardClockPath n) (p : Grid n)
    (hd : AugTimedDone (cs j).config (augRecycledTerminal (cs j).config ε M hn s.val.1 ω))
    (hR : δ<(augRecycledTerminal (cs j).config ε M hn s.val.1 ω).val.2) :
    validAugStateCredit B p (observedThroughPhaseTail cs ε M deadline start hn j k s.val ω).1.2.1=
      augTimedCredit (cs j).config p
        (sourceCutTerminal (cs j).config ε M (phaseEndpoint cs start j) δ hδ hn s ω).1 := by
  let cfg := (cs j).config
  let t₀ := phaseEndpoint cs start j
  have hstop : (augRecycledTerminal cfg ε M hn s.val.1 ω).val.1.physical.process.stopped=true :=
    hd.resolve_left (ne_of_gt (hδ.trans_lt hR))
  have hobs : (observedRecycledTerminal cfg ε M t₀ hn (s.val,ω)).1.val.1.physical.process.stopped=true := by
    rw [observedRecycledTerminal_base]
    exact hstop
  have ht : elapsedTime cfg ε M t₀ hn s (augRecycledCompletionIndex cfg ε M hn s.val.1 ω) ω<
      s.val.1.val.2-δ := by
    rw [elapsedTime_eq_observed_remaining]
    change s.val.1.val.2-(observedRecycledTerminal cfg ε M t₀ hn (s.val,ω)).1.val.2<_
    rw [observedRecycledTerminal_base]
    linarith
  have hcut := sourceCutTerminal_after_completion_augmented cfg ε M t₀ δ hδ hn s ω hd ht
  change validAugStateCredit B p
    (observedAfterTerminal cs ε M deadline start hn j k
      (observedRecycledTerminal cfg ε M t₀ hn (s.val,ω),
        (observedRecycledTerminalPair cfg ε M t₀ hn (s.val,ω)).2)).1.2.1=_
  rw [observedAfterTerminal_stopped_credit cs ε M deadline start hn j k _ hobs]
  change ((observedRecycledTerminal cfg ε M t₀ hn (s.val,ω)).1.val.1.physical.process.accounts p).credit=_
  rw [observedRecycledTerminal_base]
  exact congrArg (fun a : AugmentedState n=>(a.physical.process.accounts p).credit) hcut.symm

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedFuture_credit_eq_cut_after_completion
