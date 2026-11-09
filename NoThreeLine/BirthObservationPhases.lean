import NoThreeLine.BirthObservationOrigin
import NoThreeLine.BirthObservationTime
import NoThreeLine.AugmentedInitialization

/-! Carry the same actual-time birth records through measurable phase
terminal kernels and actual deadline retirement. Each phase uses its true
absolute left endpoint; existing physical/eta finite-phase states are unchanged. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

abbrev PhaseObservation (n : ℕ) (B : ℝ) := ValidAugmentedState n B × BirthRecords n

def PhaseRecordsConsistent {n : ℕ} {B : ℝ} (s : PhaseObservation n B) : Prop :=
  ∀p,(s.2 p).1=true ↔ p∈s.1.val.physical.process.selected

def observedPhaseStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : PhaseObservation n cfg.B) : TimedObservation cfg := (augPhaseStart cfg ε M s.1,s.2)

theorem observedPhaseStart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (observedPhaseStart cfg ε M) :=
  ((augPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd

theorem observedPhaseStart_time {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (s : PhaseObservation n cfg.B) : observationTime cfg start (observedPhaseStart cfg ε M s).1=start := by
  simp [observationTime,observedPhaseStart,augPhaseStart]

def observedPhaseTerminal {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : PhaseObservation n cfg.B × PhaseNoise n) : PhaseObservation n cfg.B :=
  (augPhaseTerminal cfg ε M hn (x.1.1,x.2),
    (observedTerminal cfg ε M start hn (observedPhaseStart cfg ε M x.1,x.2)).2)

theorem observedPhaseTerminal_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : PhaseObservation n cfg.B × PhaseNoise n) :
    (observedPhaseTerminal cfg ε M start hn x).1=augPhaseTerminal cfg ε M hn (x.1.1,x.2) := rfl

theorem observedPhaseTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) :
    Measurable (observedPhaseTerminal cfg ε M start hn) :=
  ((augPhaseTerminal_measurable cfg ε M hn).comp (measurable_fst.fst.prodMk measurable_snd)).prodMk
    (((observedTerminal_measurable cfg ε M start hn).comp
      (((observedPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd)).snd)

theorem observedPhaseTerminal_consistent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : PhaseObservation n cfg.B × PhaseNoise n) (hx : PhaseRecordsConsistent x.1) :
    PhaseRecordsConsistent (observedPhaseTerminal cfg ε M start hn x) := by
  have h := observedTerminal_consistent cfg ε M start hn (observedPhaseStart cfg ε M x.1,x.2) hx
  intro p
  have hp := h p
  rw [observedTerminal_base] at hp
  exact hp

def observedDeadline {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (s : PhaseObservation n B) : PhaseObservation n B := (augValidDeadlineRetirement deadline t s.1,s.2)

theorem observedDeadline_measurable {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ) :
    Measurable (observedDeadline (B:=B) deadline t) :=
  ((augValidDeadlineRetirement_measurable deadline t).comp measurable_fst).prodMk measurable_snd

theorem observedDeadline_consistent {n : ℕ} {B : ℝ} (deadline : Grid n → ℝ) (t : ℝ)
    (s : PhaseObservation n B) (hs : PhaseRecordsConsistent s) :
    PhaseRecordsConsistent (observedDeadline deadline t s) := by
  intro p
  change (s.2 p).1=true ↔ p∈(augValidDeadlineRetirement deadline t s.1).val.physical.process.selected
  unfold augValidDeadlineRetirement
  split_ifs <;> exact hs p

def observedScheduledPhase {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (j : ℕ)
    (x : PhaseObservation n B × PhaseNoise n) : PhaseObservation n B :=
  observedDeadline deadline (phaseEndpoint cs start (j+1))
    (observedPhaseTerminal (cs j).config ε M (phaseEndpoint cs start j) hn x)

theorem observedScheduledPhase_base {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (j : ℕ) (x : PhaseObservation n B × PhaseNoise n) :
    (observedScheduledPhase cs ε M deadline start hn j x).1=
      augScheduledPhase cs ε M deadline start hn j (x.1.1,x.2) := rfl

theorem observedScheduledPhase_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (j : ℕ) :
    Measurable (observedScheduledPhase cs ε M deadline start hn j) :=
  (observedDeadline_measurable deadline _).comp (observedPhaseTerminal_measurable (cs j).config ε M _ hn)

theorem observedScheduledPhase_consistent {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (j : ℕ)
    (x : PhaseObservation n B × PhaseNoise n) (hx : PhaseRecordsConsistent x.1) :
    PhaseRecordsConsistent (observedScheduledPhase cs ε M deadline start hn j x) :=
  observedDeadline_consistent deadline _ _ (observedPhaseTerminal_consistent (cs j).config ε M _ hn x hx)

def observedFinitePhase {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) :
    (k : ℕ) → PhaseObservation n B → (Fin k → PhaseNoise n) → PhaseObservation n B
  | 0,s,_=>s
  | k+1,s,v=>observedScheduledPhase cs ε M deadline start hn k
      (observedFinitePhase cs ε M deadline start hn k s (fun i=>v i.castSucc),v (Fin.last k))

theorem observedFinitePhase_base {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (k : ℕ)
    (s : PhaseObservation n B) (v : Fin k → PhaseNoise n) :
    (observedFinitePhase cs ε M deadline start hn k s v).1=
      augFinitePhaseState cs ε M deadline start hn k s.1 v := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [observedFinitePhase,observedScheduledPhase_base,ih,augFinitePhaseState_succ]

theorem observedFinitePhase_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (k : ℕ) :
    Measurable (fun x : PhaseObservation n B × (Fin k → PhaseNoise n)=>
      observedFinitePhase cs ε M deadline start hn k x.1 x.2) := by
  induction k with
  | zero => exact measurable_fst
  | succ k ih =>
    exact (observedScheduledPhase_measurable cs ε M deadline start hn k).comp
      ((ih.comp (measurable_fst.prodMk
        (measurable_pi_lambda _ (fun i=>(measurable_pi_apply i.castSucc).comp measurable_snd)))).prodMk
          ((measurable_pi_apply (Fin.last k)).comp measurable_snd))

theorem observedFinitePhase_consistent {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (k : ℕ)
    (s : PhaseObservation n B) (hs : PhaseRecordsConsistent s) (v : Fin k → PhaseNoise n) :
    PhaseRecordsConsistent (observedFinitePhase cs ε M deadline start hn k s v) := by
  induction k with
  | zero => exact hs
  | succ k ih => exact observedScheduledPhase_consistent cs ε M deadline start hn k _ (ih _)

def observedInitial {n : ℕ} (B : ℝ) (hB : 1≤B) (deadline : Grid n → ℝ) (start : ℝ) :
    PhaseObservation n B := (augInitialState B hB deadline start,fun _=>(false,0))

theorem observedInitial_consistent {n : ℕ} (B : ℝ) (hB : 1≤B) (deadline : Grid n → ℝ) (start : ℝ) :
    PhaseRecordsConsistent (observedInitial B hB deadline start) := by
  intro p
  simp [observedInitial,augInitialState_selected]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedFinitePhase_base
#print axioms NoThreeLine.BirthWitness.observedFinitePhase_measurable
#print axioms NoThreeLine.BirthWitness.observedFinitePhase_consistent
