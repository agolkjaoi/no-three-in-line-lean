import NoThreeLine.RootPhaseProcess

/-! True saved birth records are preserved by the actual root observer,
and remain records of the actual process. This proves record transport,
not a replacement of the stopped root snapshot by the future state. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.BirthWitness

def RecordsExtend {n : ℕ} (b c : BirthRecords n) : Prop :=
  ∀q,(b q).1=true → c q=b q

theorem recordsExtend_refl {n : ℕ} (b : BirthRecords n) : RecordsExtend b b := fun _ _=>rfl

theorem recordsExtend_trans {n : ℕ} {a b c : BirthRecords n}
    (hab : RecordsExtend a b) (hbc : RecordsExtend b c) : RecordsExtend a c := by
  intro q hq
  have he := hab q hq
  exact (hbc q (by rw [he]; exact hq)).trans he

theorem observedStep_recordsExtend {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg×CandidateData n) (hx : RecordsConsistent cfg x.1) :
    RecordsExtend x.1.2 (observedStep cfg ε M start x).2 :=
  observedStep_record_preserved cfg ε M start x hx

theorem rootObserverStep_saved_recordsExtend {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg p s) :
    RecordsExtend s.2.2.2 (rootObserverStep cfg ε M start p (s,z)).2.2.2 := by
  by_cases hf : s.2.1=true
  · simp only [rootObserverStep,if_pos hf]
    exact recordsExtend_refl _
  · have h0 := hs.live (Bool.eq_false_iff.mpr hf)
    have he : s.2.2.2=s.1.2 := congrArg Prod.snd h0
    rw [he]
    by_cases hc : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
    · simp only [rootObserverStep,if_neg hf,if_pos hc,rawStepSaved_records]
      exact observedStep_recordsExtend cfg ε M start (s.1,z) hs.records
    · simp only [rootObserverStep,if_neg hf,if_neg hc]
      exact observedStep_recordsExtend cfg ε M start (s.1,z) hs.records

theorem rootObserverStep_saved_in_actual {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg p s) (hi : RecordsExtend s.2.2.2 s.1.2) :
    RecordsExtend (rootObserverStep cfg ε M start p (s,z)).2.2.2
      (rootObserverStep cfg ε M start p (s,z)).1.2 := by
  by_cases hf : s.2.1=true
  · simp only [rootObserverStep,if_pos hf]
    exact recordsExtend_trans hi (observedStep_recordsExtend cfg ε M start (s.1,z) hs.records)
  · by_cases hc : rootClosed cfg p (observedStep cfg ε M start (s.1,z))
    · simp only [rootObserverStep,if_neg hf,if_pos hc,rawStepSaved_records]
      exact recordsExtend_refl _
    · simp only [rootObserverStep,if_neg hf,if_neg hc]
      exact recordsExtend_refl _

theorem rootObserverRecycledPair_saved_in_actual {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (hi : RecordsExtend s.2.2.2 s.1.2)
    (k : ℕ) (ω : BoardClockPath n) :
    RecordsExtend (rootObserverRecycledPair cfg ε M start p hn s k ω).1.2.2.2
      (rootObserverRecycledPair cfg ε M start p hn s k ω).1.1.2 := by
  induction k with
  | zero => exact hi
  | succ k ih =>
    exact rootObserverStep_saved_in_actual cfg ε M start p _ _
      (rootObserverRecycledPair_invariant cfg ε M start p hn s hs k ω) ih

theorem rootObserverRecycledPair_saved_record_stable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (p : Grid n) (hn : 0<n) (s : RootObservation cfg)
    (hs : RootObserverInvariant cfg p s) (ω : BoardClockPath n) (j k : ℕ) (hjk : j≤k) :
    RecordsExtend (rootObserverRecycledPair cfg ε M start p hn s j ω).1.2.2.2
      (rootObserverRecycledPair cfg ε M start p hn s k ω).1.2.2.2 := by
  induction k, hjk using Nat.le_induction with
  | base => exact recordsExtend_refl _
  | succ k hk ih =>
    exact recordsExtend_trans ih
      (rootObserverStep_saved_recordsExtend cfg ε M start p _ _
        (rootObserverRecycledPair_invariant cfg ε M start p hn s hs k ω))

theorem phaseRootStart_saved_records {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (p : Grid n) (s : PhaseRootObservation n cfg.B) (hs : PhaseRootInvariant p s) :
    (phaseRootStart cfg ε M p s).2.2.2=s.2.2.2 := by
  by_cases hf : s.2.1=true
  · simp only [phaseRootStart,if_pos hf]
  · simp only [phaseRootStart,if_neg hf]
    exact (congrArg Prod.snd (hs.live (Bool.eq_false_iff.mpr hf))).symm

theorem phaseRootEnd_saved_recordsExtend {n : ℕ} (cfg : FlowConfig n)
    (p : Grid n) (s : RootObservation cfg) (hi : RecordsExtend s.2.2.2 s.1.2) :
    RecordsExtend s.2.2.2 (phaseRootEnd cfg p s).2.2.2 := by
  dsimp only [phaseRootEnd]
  split_ifs
  · exact recordsExtend_refl _
  · exact hi

theorem phaseRootDeadline_saved_records {n : ℕ} {B : ℝ} (p : Grid n)
    (deadline : Grid n→ℝ) (t : ℝ) (s : PhaseRootObservation n B) (hs : PhaseRootInvariant p s) :
    (phaseRootDeadline p deadline t s).2.2.2=s.2.2.2 := by
  by_cases hf : s.2.1=true
  · simp only [phaseRootDeadline,if_pos hf]
  · have he := (congrArg Prod.snd (hs.live (Bool.eq_false_iff.mpr hf))).symm
    dsimp only [phaseRootDeadline]
    split_ifs <;> exact he

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_saved_record_stable
#print axioms NoThreeLine.BirthWitness.rootObserverRecycledPair_saved_in_actual
#print axioms NoThreeLine.BirthWitness.phaseRootEnd_saved_recordsExtend
#print axioms NoThreeLine.BirthWitness.phaseRootDeadline_saved_records
