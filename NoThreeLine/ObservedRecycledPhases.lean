import NoThreeLine.ObservedScheduledRestart
import NoThreeLine.RecycledPhaseComposition
import NoThreeLine.BirthObservationPhaseRecords

/-! Actual observed finite phases on one original board. Projection recovers
the existing physical/eta process pointwise, including its residual board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine.BirthWitness

def observedRecycledPhases {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (s : PhaseObservation n B) (k : ℕ) (ω : BoardClockPath n) :
    (ℕ × PhaseObservation n B) × BoardClockPath n :=
  RecycledBoardProcess.iterate (observedPhaseRestartStep cs ε M deadline start hn) (0,s) k ω

theorem observedRecycledPhases_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B) (k : ℕ) :
    Measurable (observedRecycledPhases cs ε M deadline start hn s k) :=
  RecycledBoardProcess.iterate_measurable _ (observedPhaseRestartStep_measurable cs ε M deadline start hn) (0,s) k

theorem observedRecycledPhases_index {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (k : ℕ) (ω : BoardClockPath n) : (observedRecycledPhases cs ε M deadline start hn s k ω).1.1 = k := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (observedRecycledPhases cs ε M deadline start hn s k ω).1.1+1=k+1
    rw [ih]

theorem observedRecycledPhases_succ {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (k : ℕ) (ω : BoardClockPath n) :
    let r := observedRecycledPhases cs ε M deadline start hn s k ω
    let t := observedScheduledPair cs ε M deadline start hn k (r.1.2,r.2)
    observedRecycledPhases cs ε M deadline start hn s (k+1) ω = ((k+1,t.1),t.2) := by
  change observedPhaseRestartStep cs ε M deadline start hn (observedRecycledPhases cs ε M deadline start hn s k ω) = _
  simp only [observedPhaseRestartStep,observedRecycledPhases_index]

theorem observedRecycledPhases_base {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (k : ℕ) (ω : BoardClockPath n) :
    (((observedRecycledPhases cs ε M deadline start hn s k ω).1.1,
      (observedRecycledPhases cs ε M deadline start hn s k ω).1.2.1),
      (observedRecycledPhases cs ε M deadline start hn s k ω).2) =
        recycledPhases cs ε M deadline start hn s.1 k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (((observedPhaseRestartStep cs ε M deadline start hn
      (observedRecycledPhases cs ε M deadline start hn s k ω)).1.1,
      (observedPhaseRestartStep cs ε M deadline start hn
        (observedRecycledPhases cs ε M deadline start hn s k ω)).1.2.1),
      (observedPhaseRestartStep cs ε M deadline start hn
        (observedRecycledPhases cs ε M deadline start hn s k ω)).2) =
      recycledPhaseStep cs ε M deadline start hn (recycledPhases cs ε M deadline start hn s.1 k ω)
    rw [observedPhaseRestartStep_base,ih]

def observedRecycledPhaseState {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n)
    (s : PhaseObservation n B) (k : ℕ) (ω : BoardClockPath n) : PhaseObservation n B :=
  (observedRecycledPhases cs ε M deadline start hn s k ω).1.2

theorem observedRecycledPhaseState_base {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (k : ℕ) (ω : BoardClockPath n) :
    (observedRecycledPhaseState cs ε M deadline start hn s k ω).1 =
      recycledPhaseState cs ε M deadline start hn s.1 k ω :=
  congrArg (fun r : (ℕ × ValidAugmentedState n B) × BoardClockPath n => r.1.2)
    (observedRecycledPhases_base cs ε M deadline start hn s k ω)

theorem observedRecycledPhaseState_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B) (k : ℕ) :
    Measurable (observedRecycledPhaseState cs ε M deadline start hn s k) :=
  (observedRecycledPhases_measurable cs ε M deadline start hn s k).fst.snd

theorem observedRecycledPhaseState_consistent {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (hs : PhaseRecordsConsistent s) (k : ℕ) (ω : BoardClockPath n) :
    PhaseRecordsConsistent (observedRecycledPhaseState cs ε M deadline start hn s k ω) := by
  induction k with
  | zero => exact hs
  | succ k ih =>
    change PhaseRecordsConsistent (observedRecycledPhases cs ε M deadline start hn s (k+1) ω).1.2
    rw [observedRecycledPhases_succ]
    exact observedScheduledPair_consistent cs ε M deadline start hn k _ ih

theorem observedScheduledPair_record_preserved {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (j : ℕ)
    (x : PhaseObservation n B × BoardClockPath n) (hx : PhaseRecordsConsistent x.1)
    (p : Grid n) (hp : (x.1.2 p).1=true) :
    (observedScheduledPair cs ε M deadline start hn j x).1.2 p=x.1.2 p :=
  observedRecycledPair_record_stable (cs j).config ε M (phaseEndpoint cs start j) hn
    (observedPhaseStart (cs j).config ε M x.1) hx x.2 p 0 hp _ (Nat.zero_le _)

theorem observedRecycledPhaseState_record_preserved {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (hs : PhaseRecordsConsistent s) (p : Grid n) (hp : (s.2 p).1=true)
    (k : ℕ) (ω : BoardClockPath n) :
    (observedRecycledPhaseState cs ε M deadline start hn s k ω).2 p=s.2 p := by
  induction k with
  | zero => rfl
  | succ k ih =>
    change (observedRecycledPhases cs ε M deadline start hn s (k+1) ω).1.2.2 p=s.2 p
    rw [observedRecycledPhases_succ]
    exact (observedScheduledPair_record_preserved cs ε M deadline start hn k _
      (observedRecycledPhaseState_consistent cs ε M deadline start hn s hs k ω) p
        (by change ((observedRecycledPhaseState cs ε M deadline start hn s k ω).2 p).1=true
            rw [ih]; exact hp)).trans ih

theorem observedRecycledPhaseState_witness_valid {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (hs : PhaseRecordsConsistent s) (e : Retention n) (k : ℕ) (ω : BoardClockPath n) :
    (phaseWitness e (observedRecycledPhaseState cs ε M deadline start hn s k ω)).Valid B :=
  phaseWitness_valid e _ (observedRecycledPhaseState_consistent cs ε M deadline start hn s hs k ω)

theorem observedRecycledPhaseState_expected_credit {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (hB : 0 < B)
    (s : PhaseObservation n B) (k : ℕ) (p : Grid n) :
    (∫ ω, validAugStateCredit B p (observedRecycledPhaseState cs ε M deadline start hn s k ω).1
      ∂boardClockMeasure n (B/n)) = validAugStateCredit B p s.1 := by
  simp only [observedRecycledPhaseState_base]
  exact recycledPhaseState_expected_credit cs ε M deadline start hn hB s.1 k p

theorem observedRecycledPhaseState_noThree {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0 < n) (s : PhaseObservation n B)
    (k : ℕ) (ω : BoardClockPath n) :
    NoThree (observedRecycledPhaseState cs ε M deadline start hn s k ω).1.val.physical.process.selected :=
  (observedRecycledPhaseState cs ε M deadline start hn s k ω).1.property.1.1.1

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedRecycledPhases_base
#print axioms NoThreeLine.BirthWitness.observedRecycledPhaseState_witness_valid
#print axioms NoThreeLine.BirthWitness.observedRecycledPhaseState_record_preserved
#print axioms NoThreeLine.BirthWitness.observedRecycledPhaseState_expected_credit
