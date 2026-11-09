import NoThreeLine.SourceCutTerminal
import NoThreeLine.BirthObservationTime

/-! Actual recorded birth timestamps never exceed the process's actual
calendar time. The invariant follows from the real birth update, including
rejection, stopping, and the same-cfg reduced-remaining-time cut. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.BirthWitness

def RecordsBefore {n : ℕ} (t : ℝ) (b : BirthRecords n) : Prop :=
  ∀q,(b q).1=true → (b q).2≤t

theorem recordsBefore_mono {n : ℕ} {t u : ℝ} {b : BirthRecords n}
    (h : RecordsBefore t b) (htu : t≤u) : RecordsBefore u b :=
  fun q hq=>(h q hq).trans htu

theorem observedStep_recordsBefore {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg×CandidateData n)
    (hx : RecordsBefore (observationTime cfg start x.1.1) x.1.2) :
    RecordsBefore (observationTime cfg start (observedStep cfg ε M start x).1)
      (observedStep cfg ε M start x).2 := by
  classical
  have ht := observationTime_step_mono cfg ε M start (x.1.1,x.2)
  intro q hq
  by_cases hb : timedBirth cfg ε M (x.1.1,x.2)
  · by_cases he : q=x.2.1.2
    · subst q
      rw [observedStep_record_of_birth cfg ε M start x hb]
      exact (birthObservationTime_eq_after cfg ε M start _ hb.1).le
    · have hr : (observedStep cfg ε M start x).2 q=x.1.2 q := by
        simp only [observedStep,if_pos hb,Function.update_of_ne he]
      rw [hr] at hq ⊢
      exact (hx q hq).trans ht
  · rw [observedStep_record_no_birth cfg ε M start x hb] at hq ⊢
    exact (hx q hq).trans ht

theorem observedRecycledPair_recordsBefore {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : TimedObservation cfg)
    (hs : RecordsBefore (observationTime cfg start s.1) s.2) (k : ℕ) (ω : BoardClockPath n) :
    RecordsBefore (observationTime cfg start (observedRecycledPair cfg ε M start hn s k ω).1.1)
      (observedRecycledPair cfg ε M start hn s k ω).1.2 := by
  induction k with
  | zero => exact hs
  | succ k ih => exact observedStep_recordsBefore cfg ε M start _ ih

theorem observedRecycledTerminal_recordsBefore {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (hn : 0<n) (s : TimedObservation cfg)
    (hs : RecordsBefore (observationTime cfg start s.1) s.2) (ω : BoardClockPath n) :
    RecordsBefore (observationTime cfg start (observedRecycledTerminal cfg ε M start hn (s,ω)).1)
      (observedRecycledTerminal cfg ε M start hn (s,ω)).2 :=
  observedRecycledPair_recordsBefore cfg ε M start hn s hs _ ω

theorem sourceCutTerminal_recordsBefore {n : ℕ} (cfg : FlowConfig n) (ε M start δ : ℝ)
    (hδ : 0≤δ) (hn : 0<n) (s : GoodObservation cfg) (hδR : δ≤s.val.1.val.2)
    (hs : RecordsBefore (observationTime cfg start s.val.1) s.val.2) (ω : BoardClockPath n) :
    RecordsBefore (start+cfg.horizon-δ)
      (sourceCutTerminal cfg ε M start δ hδ hn s ω).2 := by
  have hi : RecordsBefore (observationTime cfg (start-δ) (sourceRestrictGood cfg δ hδ s).val.1)
      (sourceRestrictGood cfg δ hδ s).val.2 := by
    change RecordsBefore (observationTime cfg (start-δ) (sourceRestrictObservation cfg δ hδ s.val).1) s.val.2
    rw [sourceRestrictObservation_time cfg start δ hδ s.val hδR]
    exact hs
  apply recordsBefore_mono (observedRecycledTerminal_recordsBefore cfg ε M (start-δ) hn _ hi ω)
  have ht := (observationTime_bounds cfg (start-δ)
    (sourceCutTerminal cfg ε M start δ hδ hn s ω).1).2
  unfold sourceCutTerminal at ht
  linarith

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedStep_recordsBefore
#print axioms NoThreeLine.BirthWitness.observedRecycledTerminal_recordsBefore
#print axioms NoThreeLine.BirthWitness.sourceCutTerminal_recordsBefore
