import NoThreeLine.RootSavedRecords

/-! Preserve each true saved record through actual phase completion,
artificial endpoint reopening, and real deadline retirement. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.BirthWitness

theorem phaseRootStart_saved_in_actual {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : PhaseRootObservation n cfg.B) (hs : PhaseRootInvariant p s)
    (hi : RecordsExtend s.2.2.2 s.1.2) :
    RecordsExtend (phaseRootStart cfg ε M p s).2.2.2 (phaseRootStart cfg ε M p s).1.2 := by
  rw [phaseRootStart_saved_records cfg ε M p s hs,phaseRootStart_projection]
  exact hi

theorem phaseRootEnd_saved_in_actual {n : ℕ} (cfg : FlowConfig n)
    (p : Grid n) (s : RootObservation cfg) (hi : RecordsExtend s.2.2.2 s.1.2) :
    RecordsExtend (phaseRootEnd cfg p s).2.2.2 (phaseRootEnd cfg p s).1.2 := by
  dsimp only [phaseRootEnd]
  split_ifs
  · exact hi
  · exact recordsExtend_refl _

theorem phaseRootDeadline_saved_in_actual {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B)
    (hs : PhaseRootInvariant p s) (hi : RecordsExtend s.2.2.2 s.1.2) :
    RecordsExtend (phaseRootDeadline p deadline t s).2.2.2 (phaseRootDeadline p deadline t s).1.2 := by
  rw [phaseRootDeadline_saved_records p deadline t s hs,phaseRootDeadline_projection]
  exact hi

theorem phaseRootScheduledPair_saved_in_actual {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (j : ℕ) (x : PhaseRootObservation n B×BoardClockPath n)
    (hx : PhaseRootInvariant p x.1) (hi : RecordsExtend x.1.2.2.2 x.1.1.2) :
    RecordsExtend (phaseRootScheduledPair cs ε M deadline start p hn j x).1.2.2.2
      (phaseRootScheduledPair cs ε M deadline start p hn j x).1.1.2 := by
  have hs := phaseRootStart_invariant (cs j).config ε M p x.1 hx
  have hsi := phaseRootStart_saved_in_actual (cs j).config ε M p x.1 hx hi
  have hr := rootObserverRecycledPair_saved_in_actual (cs j).config ε M (phaseEndpoint cs start j)
    p hn _ hs hsi (augRecycledCompletionIndex (cs j).config ε M hn
      (phaseRootStart (cs j).config ε M p x.1).1.1 x.2) x.2
  exact phaseRootDeadline_saved_in_actual p deadline (phaseEndpoint cs start (j+1)) _
    (phaseRootEnd_invariant (cs j).config p _ (phaseRootRun_invariant (cs j).config ε M _ p hn x hx))
    (phaseRootEnd_saved_in_actual (cs j).config p _ hr)

theorem phaseRootScheduledPair_saved_recordsExtend {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (j : ℕ) (x : PhaseRootObservation n B×BoardClockPath n)
    (hx : PhaseRootInvariant p x.1) (hi : RecordsExtend x.1.2.2.2 x.1.1.2) :
    RecordsExtend x.1.2.2.2 (phaseRootScheduledPair cs ε M deadline start p hn j x).1.2.2.2 := by
  let s := phaseRootStart (cs j).config ε M p x.1
  let k := augRecycledCompletionIndex (cs j).config ε M hn s.1.1 x.2
  have hs := phaseRootStart_invariant (cs j).config ε M p x.1 hx
  have hsi := phaseRootStart_saved_in_actual (cs j).config ε M p x.1 hx hi
  have he : RecordsExtend x.1.2.2.2 (phaseRootRun (cs j).config ε M (phaseEndpoint cs start j) p hn x).1.2.2.2 := by
    rw [←phaseRootStart_saved_records (cs j).config ε M p x.1 hx]
    exact rootObserverRecycledPair_saved_record_stable (cs j).config ε M (phaseEndpoint cs start j)
      p hn s hs x.2 0 k (Nat.zero_le _)
  have hr := rootObserverRecycledPair_saved_in_actual (cs j).config ε M (phaseEndpoint cs start j)
    p hn s hs hsi k x.2
  have hb := phaseRootEnd_saved_recordsExtend (cs j).config p _ hr
  change RecordsExtend _ (phaseRootDeadline p deadline (phaseEndpoint cs start (j+1))
    (phaseRootEnd (cs j).config p (phaseRootRun (cs j).config ε M (phaseEndpoint cs start j) p hn x).1)).2.2.2
  rw [phaseRootDeadline_saved_records p deadline _ _
    (phaseRootEnd_invariant (cs j).config p _ (phaseRootRun_invariant (cs j).config ε M _ p hn x hx))]
  exact recordsExtend_trans he hb

theorem phaseRootPhases_saved_in_actual {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s)
    (hi : RecordsExtend s.2.2.2 s.1.2) (k : ℕ) (ω : BoardClockPath n) :
    RecordsExtend (phaseRootPhases cs ε M deadline start p hn s k ω).1.2.2.2
      (phaseRootPhases cs ε M deadline start p hn s k ω).1.1.2 := by
  induction k with
  | zero => exact hi
  | succ k ih =>
    exact phaseRootScheduledPair_saved_in_actual cs ε M deadline start p hn k _
      (phaseRootPhases_invariant cs ε M deadline start p hn s hs k ω) ih

theorem phaseRootPhases_saved_record_stable {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s)
    (hi : RecordsExtend s.2.2.2 s.1.2) (ω : BoardClockPath n) (j k : ℕ) (hjk : j≤k) :
    RecordsExtend (phaseRootPhases cs ε M deadline start p hn s j ω).1.2.2.2
      (phaseRootPhases cs ε M deadline start p hn s k ω).1.2.2.2 := by
  induction k, hjk using Nat.le_induction with
  | base => exact recordsExtend_refl _
  | succ k hk ih =>
    exact recordsExtend_trans ih
      (phaseRootScheduledPair_saved_recordsExtend cs ε M deadline start p hn k _
        (phaseRootPhases_invariant cs ε M deadline start p hn s hs k ω)
        (phaseRootPhases_saved_in_actual cs ε M deadline start p hn s hs hi k ω))

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.phaseRootScheduledPair_saved_recordsExtend
#print axioms NoThreeLine.BirthWitness.phaseRootPhases_saved_in_actual
#print axioms NoThreeLine.BirthWitness.phaseRootPhases_saved_record_stable
