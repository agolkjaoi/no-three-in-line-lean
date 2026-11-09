import NoThreeLine.RootCutTerminalRecords
import NoThreeLine.ScheduledPhaseCompletion
import NoThreeLine.RootPhaseSourceProjection

/-! The root observer's actual inherited input for a scheduled phase,
with reachable active-record and inclusion invariants and the same cut. -/
set_option autoImplicit false
set_option maxHeartbeats 1400000
noncomputable section
open MeasureTheory
namespace NoThreeLine.BirthWitness

def scheduledRootRecordInput {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (N : ℕ) (ω : BoardClockPath n) : GoodRootObservation (cs N).config p :=
  goodPhaseRootStart (cs N).config ε M p (rootPhaseRecycledState cs ε M deadline start p hn
    (initialGoodPhaseRootObservation B hB p deadline start) N ω)

def scheduledRootRecordBoard {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (p : Grid n) (hn : 0<n) (hB : 1≤B)
    (N : ℕ) (ω : BoardClockPath n) : BoardClockPath n :=
  (rootPhaseRecycledPair cs ε M deadline start p hn
    (initialGoodPhaseRootObservation B hB p deadline start) N ω).2

theorem scheduledRootRecordInput_activeRecords {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N : ℕ) (ω : BoardClockPath n) :
    RootActiveRecords (cs N).config p
      (scheduledRootRecordInput cs ε M deadline start p hn hB N ω).val := by
  apply phaseRootStart_activeRecords
  have he := congrArg Prod.fst (rootPhaseRecycledPair_projection cs ε M deadline start p hn
    (initialGoodPhaseRootObservation B hB p deadline start) N ω)
  change (rootPhaseRecycledState cs ε M deadline start p hn _ N ω).val = _ at he
  change PhaseRootActiveRecords p (rootPhaseRecycledState cs ε M deadline start p hn _ N ω).val
  rw [he]
  exact initial_phaseRootPhases_activeRecords cs ε M deadline start p hn hB N ω

theorem scheduledRootRecordInput_saved_in_actual {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N : ℕ) (ω : BoardClockPath n) :
    RecordsExtend (scheduledRootRecordInput cs ε M deadline start p hn hB N ω).val.2.2.2
      (scheduledRootRecordInput cs ε M deadline start p hn hB N ω).val.1.2 := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have hi : RecordsExtend s.val.2.2.2 s.val.1.2 := recordsExtend_refl _
  have he := congrArg Prod.fst (rootPhaseRecycledPair_projection cs ε M deadline start p hn s N ω)
  change (rootPhaseRecycledState cs ε M deadline start p hn s N ω).val = _ at he
  apply phaseRootStart_saved_in_actual _ _ _ _ _
    (rootPhaseRecycledState cs ε M deadline start p hn s N ω).property.1
  change RecordsExtend (rootPhaseRecycledState cs ε M deadline start p hn s N ω).val.2.2.2
    (rootPhaseRecycledState cs ε M deadline start p hn s N ω).val.1.2
  rw [he]
  exact phaseRootPhases_saved_in_actual cs ε M deadline start p hn s.val s.property.1 hi N ω

theorem scheduledCutObservation_eq_root_input {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N : ℕ) (ω : BoardClockPath n) (t : ℝ) :
    scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) N (ω,t)=
      sourceCutTerminal (cs N).config ε M (phaseEndpoint cs start N)
        (elapsedCutAmount (cs N).horizon t) (elapsedCutAmount (cs N).horizon t).coe_nonneg hn
        (goodRootActual (cs N).config p (scheduledRootRecordInput cs ε M deadline start p hn hB N ω))
        (scheduledRootRecordBoard cs ε M deadline start p hn hB N ω) := by
  let s := initialGoodPhaseRootObservation B hB p deadline start
  have he := rootPhaseActual_pair_projection cs ε M deadline start p hn s N ω
  have hc := congrArg (fun y : GoodPhaseObservation n B×BoardClockPath n=>
    phaseCutObservation (cs N).config ε M (phaseEndpoint cs start N) hn ((y.1,t),y.2)) he
  change phaseCutObservation (cs N).config ε M (phaseEndpoint cs start N) hn
    (((goodPhases cs ε M deadline start hn (goodPhaseRootActual p s) N ω).1,t),
      (goodPhases cs ε M deadline start hn (goodPhaseRootActual p s) N ω).2)=_
  rw [←hc]
  unfold phaseCutObservation scheduledRootRecordInput
  rw [goodPhaseRootStart_actual]
  rfl

theorem scheduledRootRecordInput_done_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (p : Grid n) (hn : 0<n) (hB : 1≤B) (N : ℕ) :
    ∀ᵐω∂boardClockMeasure n (B/n),
    AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
      (scheduledRootRecordInput cs ε M deadline start p hn hB N ω).val.1.1
      (scheduledRootRecordBoard cs ε M deadline start p hn hB N ω)) := by
  have hh := scheduledPhaseCompletion_ae cs ε M deadline start hn (zero_lt_one.trans_le hB)
    (initialGoodPhaseObservation B hB deadline start) N
  filter_upwards [hh] with ω hω
  have he := rootPhaseActual_pair_projection cs ε M deadline start p hn
    (initialGoodPhaseRootObservation B hB p deadline start) N ω
  have he1 := congrArg Prod.fst he
  have he2 := congrArg Prod.snd he
  dsimp only [Prod.fst, Prod.snd] at he1 he2
  change AugTimedDone (cs N).config (augRecycledTerminal (cs N).config ε M hn
    (goodRootActual (cs N).config p (scheduledRootRecordInput cs ε M deadline start p hn hB N ω)).val.1
    (scheduledRootRecordBoard cs ε M deadline start p hn hB N ω))
  unfold scheduledRootRecordInput scheduledRootRecordBoard
  rw [goodPhaseRootStart_actual,he1,he2]
  exact hω

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.scheduledRootRecordInput_activeRecords
#print axioms NoThreeLine.BirthWitness.scheduledCutObservation_eq_root_input
#print axioms NoThreeLine.BirthWitness.scheduledRootRecordInput_done_ae
