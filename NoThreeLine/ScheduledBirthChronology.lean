import NoThreeLine.BirthRecordChronology
import NoThreeLine.ScheduledCutObservation

/-! Birth-record chronology at every actual phase prefix and every actual
scheduled cut. No replacement of the original clocks or deadlines occurs. -/
set_option autoImplicit false
noncomputable section
open Set
namespace NoThreeLine.BirthWitness

theorem observedRecycledPhaseState_recordsBefore {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (s : PhaseObservation n B) (hs : RecordsBefore start s.2)
    (k : ℕ) (ω : BoardClockPath n) :
    RecordsBefore (phaseEndpoint cs start k)
      (observedRecycledPhaseState cs ε M deadline start hn s k ω).2 := by
  induction k with
  | zero =>
    rw [phaseEndpoint_zero]
    exact hs
  | succ k ih =>
    let x := observedRecycledPhases cs ε M deadline start hn s k ω
    have hi : RecordsBefore
        (observationTime (cs k).config (phaseEndpoint cs start k)
          (observedPhaseStart (cs k).config ε M x.1.2).1)
        (observedPhaseStart (cs k).config ε M x.1.2).2 := by
      rw [observedPhaseStart_time]
      exact ih
    have ht := observedRecycledTerminal_recordsBefore (cs k).config ε M
      (phaseEndpoint cs start k) hn _ hi x.2
    have hb := recordsBefore_mono ht (observationTime_bounds (cs k).config
      (phaseEndpoint cs start k) _).2
    change RecordsBefore _ (observedRecycledPhases cs ε M deadline start hn s (k+1) ω).1.2.2
    rw [observedRecycledPhases_succ,phaseEndpoint_succ]
    exact hb

theorem goodPhases_recordsBefore {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (s : GoodPhaseObservation n B) (hs : RecordsBefore start s.val.2)
    (k : ℕ) (ω : BoardClockPath n) :
    RecordsBefore (phaseEndpoint cs start k) (goodPhases cs ε M deadline start hn s k ω).1.val.2 := by
  rw [goodPhases_state_projection]
  exact observedRecycledPhaseState_recordsBefore cs ε M deadline start hn s.val hs k ω

theorem scheduledCutObservation_recordsBefore {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (s : GoodPhaseObservation n B) (hs : RecordsBefore start s.val.2)
    (k : ℕ) (ω : BoardClockPath n) (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    RecordsBefore (phaseEndpoint cs start k+t)
      (scheduledCutObservation cs ε M deadline start hn s k (ω,t)).2 := by
  let y := goodPhases cs ε M deadline start hn s k ω
  have hy := goodPhases_recordsBefore cs ε M deadline start hn s hs k ω
  have hi : RecordsBefore (observationTime (cs k).config (phaseEndpoint cs start k)
      (goodPhaseStart (cs k).config ε M y.1).val.1) (goodPhaseStart (cs k).config ε M y.1).val.2 := by
    change RecordsBefore (observationTime (cs k).config (phaseEndpoint cs start k)
      (observedPhaseStart (cs k).config ε M y.1.val).1) y.1.val.2
    rw [observedPhaseStart_time]
    exact hy
  have hδR : (elapsedCutAmount (cs k).horizon t:ℝ)≤
      (goodPhaseStart (cs k).config ε M y.1).val.1.val.2 := by
    change (elapsedCutAmount (cs k).horizon t:ℝ)≤(cs k).horizon
    rw [elapsedCutAmount_coe _ _ ht.2]
    linarith [ht.1]
  have h := sourceCutTerminal_recordsBefore (cs k).config ε M (phaseEndpoint cs start k)
    (elapsedCutAmount (cs k).horizon t) (elapsedCutAmount (cs k).horizon t).coe_nonneg hn
    (goodPhaseStart (cs k).config ε M y.1) hδR hi y.2
  have he : phaseEndpoint cs start k+(cs k).config.horizon-(elapsedCutAmount (cs k).horizon t:ℝ)=
      phaseEndpoint cs start k+t := by
    rw [elapsedCutAmount_coe _ _ ht.2]
    change phaseEndpoint cs start k+(cs k).horizon-((cs k).horizon-t)=_
    ring
  rw [he] at h
  exact h

theorem initial_scheduledCutObservation_recordsBefore {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (k : ℕ) (ω : BoardClockPath n)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) :
    RecordsBefore (phaseEndpoint cs start k+t)
      (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)).2 := by
  apply scheduledCutObservation_recordsBefore cs ε M deadline start hn _ _ k ω t ht
  intro q hq
  change false=true at hq
  contradiction

theorem initial_scheduledCut_selected_timestamp {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (k : ℕ) (ω : BoardClockPath n)
    (t : ℝ) (ht : t∈Icc (0:ℝ) (cs k).horizon) (q : Grid n)
    (hq : q∈(scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).1.val.1.physical.process.selected) :
    ((scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).2 q).1=true ∧
    ((scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) k (ω,t)).2 q).2≤phaseEndpoint cs start k+t := by
  have hc : RecordsConsistent (cs k).config
      (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) k (ω,t)) :=
    sourceCutTerminal_consistent (cs k).config ε M _ _ _ hn _ _
  have hb := (hc q).mpr hq
  exact ⟨hb,initial_scheduledCutObservation_recordsBefore cs ε M deadline start hn hB k ω t ht q hb⟩

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedRecycledPhaseState_recordsBefore
#print axioms NoThreeLine.BirthWitness.initial_scheduledCutObservation_recordsBefore
#print axioms NoThreeLine.BirthWitness.initial_scheduledCut_selected_timestamp
