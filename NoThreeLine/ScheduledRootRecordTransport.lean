import NoThreeLine.ScheduledRootRecordInput
import NoThreeLine.PhasePointHistory

/-! Birth records at an active-root cut are carried into the canonical
full-phase saved snapshot. The actual phase input and residual board are
used throughout. Null completion paths and the countable update endpoints
are excluded by proved almost-everywhere statements. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness

def initialRootPhaseRecords {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (J : ℕ) (ω : BoardClockPath n) : BirthRecords n :=
  (rootPhaseRecycledState cs ε M deadline start p hn
    (initialGoodPhaseRootObservation B hB p deadline start) J ω).val.2.2.2

theorem initialRootPhaseRecords_eq_raw {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (J : ℕ) (ω : BoardClockPath n) :
    initialRootPhaseRecords cs ε M deadline start p hn hB J ω=
      (phaseRootPhases cs ε M deadline start p hn
        (initialGoodPhaseRootObservation B hB p deadline start).val J ω).1.2.2.2 :=
  congrArg (fun x : PhaseRootObservation n B×BoardClockPath n=>x.1.2.2.2)
    (rootPhaseRecycledPair_projection cs ε M deadline start p hn
      (initialGoodPhaseRootObservation B hB p deadline start) J ω)

theorem initialRootPhaseRecords_stable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (j J : ℕ) (hjJ : j≤J) (ω : BoardClockPath n) :
    RecordsExtend (initialRootPhaseRecords cs ε M deadline start p hn hB j ω)
      (initialRootPhaseRecords cs ε M deadline start p hn hB J ω) := by
  rw [initialRootPhaseRecords_eq_raw,initialRootPhaseRecords_eq_raw]
  exact phaseRootPhases_saved_record_stable cs ε M deadline start p hn _
    (initialGoodPhaseRootObservation B hB p deadline start).property.1
    (recordsExtend_refl _) ω j J hjJ

theorem scheduledRootTerminal_recordsExtend_phase {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N : ℕ) (ω : BoardClockPath n) :
    RecordsExtend
      (rootObserverTerminal (cs N).config ε M (phaseEndpoint cs start N) p hn
        ((scheduledRootRecordInput cs ε M deadline start p hn hB N ω).val,
          scheduledRootRecordBoard cs ε M deadline start p hn hB N ω)).2.2.2
      (initialRootPhaseRecords cs ε M deadline start p hn hB (N+1) ω) := by
  let s := scheduledRootRecordInput cs ε M deadline start p hn hB N ω
  let v := scheduledRootRecordBoard cs ε M deadline start p hn hB N ω
  have hi := scheduledRootRecordInput_saved_in_actual cs ε M deadline start p hn hB N ω
  have hr := rootObserverRecycledPair_saved_in_actual (cs N).config ε M
    (phaseEndpoint cs start N) p hn s.val s.property.1 hi
    (augRecycledCompletionIndex (cs N).config ε M hn s.val.1.1 v) v
  have ht := rootObserverTerminal_invariant (cs N).config ε M (phaseEndpoint cs start N)
    p hn (s.val,v) s.property.1
  unfold initialRootPhaseRecords
  rw [rootPhaseRecycledState_succ]
  have he := congrArg Prod.fst (goodPhaseRootScheduledPair_projection cs ε M deadline start p hn N
    (rootPhaseRecycledState cs ε M deadline start p hn
      (initialGoodPhaseRootObservation B hB p deadline start) N ω,v))
  dsimp only [Prod.fst] at he
  dsimp only [v,scheduledRootRecordBoard] at he
  rw [he]
  change RecordsExtend _ (phaseRootBoundary (cs N).config p deadline
    (phaseEndpoint cs start (N+1))
    (rootObserverTerminal (cs N).config ε M (phaseEndpoint cs start N) p hn (s.val,v))).2.2.2
  rw [phaseRootBoundary,phaseRootDeadline_saved_records p deadline _ _
    (phaseRootEnd_invariant (cs N).config p _ ht)]
  exact phaseRootEnd_saved_recordsExtend (cs N).config p _ hr

theorem scheduledRootTerminal_recordsExtend_full {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N J : ℕ) (hNJ : N<J) (ω : BoardClockPath n) :
    RecordsExtend
      (rootObserverTerminal (cs N).config ε M (phaseEndpoint cs start N) p hn
        ((scheduledRootRecordInput cs ε M deadline start p hn hB N ω).val,
          scheduledRootRecordBoard cs ε M deadline start p hn hB N ω)).2.2.2
      (initialRootPhaseRecords cs ε M deadline start p hn hB J ω) :=
  recordsExtend_trans (scheduledRootTerminal_recordsExtend_phase cs ε M deadline start p hn hB N ω)
    (initialRootPhaseRecords_stable cs ε M deadline start p hn hB (N+1) J hNJ ω)

theorem scheduledRootRecordInput_remaining {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N : ℕ) (ω : BoardClockPath n) :
    (scheduledRootRecordInput cs ε M deadline start p hn hB N ω).val.1.1.val.2=(cs N).horizon := by
  change (phaseRootStart (cs N).config ε M p _).1.1.val.2=_
  rw [phaseRootStart_projection]
  rfl

theorem scheduledCut_recordsExtend_full_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N J : ℕ) (hNJ : N<J) :
    ∀ᵐω∂boardClockMeasure n (B/n),∀ᵐt : ℝ∂volume,
    t∈Ioo (0:ℝ) (cs N).horizon →
    ((scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t)).1.val.1.physical.process.accounts p).status=.active →
    RecordsExtend (scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t)).2
      (initialRootPhaseRecords cs ε M deadline start p hn hB J ω) := by
  filter_upwards [scheduledRootRecordInput_done_ae cs ε M deadline start p hn hB N] with ω hd
  let s := scheduledRootRecordInput cs ε M deadline start p hn hB N ω
  let v := scheduledRootRecordBoard cs ε M deadline start p hn hB N ω
  have hf : (rootObserverTerminal (cs N).config ε M (phaseEndpoint cs start N) p hn (s.val,v)).2.1=true := by
    apply (rootObserverTerminal_invariant (cs N).config ε M (phaseEndpoint cs start N)
      p hn (s.val,v) s.property.1).closed_iff.mpr
    left
    rw [rootObserverTerminal_projection]
    change (observedRecycledTerminal (cs N).config ε M (phaseEndpoint cs start N) hn (s.val.1,v)).1.val.2≤0 ∨
      (observedRecycledTerminal (cs N).config ε M (phaseEndpoint cs start N) hn (s.val.1,v)).1.val.1.physical.process.stopped=true
    rw [observedRecycledTerminal_base]
    exact hd.imp (fun h=>h.le) id
  filter_upwards [CalendarIntegral.ae_avoids_endpoints
    (fun j=>elapsedTime (cs N).config ε M (phaseEndpoint cs start N) hn (goodRootActual (cs N).config p s) j v)] with t ht
  intro htI ha
  have hrem : s.val.1.1.val.2=(cs N).horizon :=
    scheduledRootRecordInput_remaining cs ε M deadline start p hn hB N ω
  have htI' : t∈Ioo (0:ℝ) s.val.1.1.val.2 := by simpa only [hrem] using htI
  have hc := scheduledCutObservation_eq_root_input cs ε M deadline start p hn hB N ω t
  have hδ : ((elapsedCutAmount (cs N).horizon t):ℝ)=s.val.1.1.val.2-t := by
    rw [elapsedCutAmount_coe _ _ htI.2.le,hrem]
  simp only [hδ] at hc
  rw [hc] at ha ⊢
  exact recordsExtend_trans
    (sourceCut_recordsExtend_terminal_of_avoid (cs N).config ε M (phaseEndpoint cs start N) p hn s
      (scheduledRootRecordInput_activeRecords cs ε M deadline start p hn hB N ω) v hd hf t htI' ht ha)
    (scheduledRootTerminal_recordsExtend_full cs ε M deadline start p hn hB N J hNJ ω)

theorem scheduledCut_recordsExtend_full_point_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N J : ℕ) (hNJ : N<J) :
    ∀ᵐω∂phasePointMeasure cs ε M deadline start hn hB p J,∀ᵐt : ℝ∂volume,
    t∈Ioo (0:ℝ) (cs N).horizon →
    ((scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t)).1.val.1.physical.process.accounts p).status=.active →
    RecordsExtend (scheduledCutObservation cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) N (ω,t)).2
      (initialRootPhaseRecords cs ε M deadline start p hn hB J ω) :=
  (phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB p J).ae_le
    (scheduledCut_recordsExtend_full_ae cs ε M deadline start p hn hB N J hNJ)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledRootTerminal_recordsExtend_full
#print axioms NoThreeLine.BirthWitness.scheduledCut_recordsExtend_full_ae
#print axioms NoThreeLine.BirthWitness.scheduledCut_recordsExtend_full_point_ae
