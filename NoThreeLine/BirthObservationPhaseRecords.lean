import NoThreeLine.BirthObservationPhases

/-! Record inheritance and actual birth origins across the phase kernels.
Deadline retirement and later phases retain the original absolute timestamp. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def phaseWitness {n : ℕ} {B : ℝ} (e : Retention n) (s : PhaseObservation n B) : WitnessState n :=
  ⟨s.1.val,recordedValue e s.2⟩

theorem phaseWitness_measurable {n : ℕ} {B : ℝ} (e : Retention n) :
    Measurable (phaseWitness (B:=B) e) :=
  WitnessState.measurable_mk _ _ (measurable_subtype_coe.comp measurable_fst)
    ((recordedValue_measurable e).comp measurable_snd)

theorem phaseWitness_valid {n : ℕ} {B : ℝ} (e : Retention n) (s : PhaseObservation n B)
    (hs : PhaseRecordsConsistent s) : (phaseWitness e s).Valid B := by
  refine ⟨s.1.property,recordedValue_bounds e s.2,?_⟩
  intro p hp
  exact if_neg (fun h=>hp ((hs p).mp h))

theorem observedPhaseTerminal_record_preserved {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : PhaseObservation n cfg.B × PhaseNoise n) (hx : PhaseRecordsConsistent x.1)
    (p : Grid n) (hp : (x.1.2 p).1=true) : (observedPhaseTerminal cfg ε M start hn x).2 p=x.1.2 p :=
  observedNoiseState_record_stable cfg ε M start hn (observedPhaseStart cfg ε M x.1) hx x.2 p 0 hp _
    (Nat.zero_le _)

theorem observedPhaseTerminal_record_origin {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : PhaseObservation n cfg.B × PhaseNoise n) (p : Grid n) :
    (observedPhaseTerminal cfg ε M start hn x).2 p=x.1.2 p ∨
      ∃j<augTimedCompletionIndex cfg ε M hn (augPhaseStart cfg ε M x.1.1) x.2,
        timedBirth cfg ε M (augTimedNoiseState cfg ε M hn (augPhaseStart cfg ε M x.1.1) j x.2,
          WinnerMarkLaw.firstMarkedRace hn (x.2 j)) ∧
        (WinnerMarkLaw.firstMarkedRace hn (x.2 j)).1.2=p ∧
        (observedPhaseTerminal cfg ε M start hn x).2 p=
          (true,observationTime cfg start
            (augTimedNoiseState cfg ε M hn (augPhaseStart cfg ε M x.1.1) (j+1) x.2)) :=
  observedNoiseState_record_origin cfg ε M start hn (observedPhaseStart cfg ε M x.1) x.2 p _

theorem observedScheduledPhase_record_preserved {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (j : ℕ)
    (x : PhaseObservation n B × PhaseNoise n) (hx : PhaseRecordsConsistent x.1)
    (p : Grid n) (hp : (x.1.2 p).1=true) :
    (observedScheduledPhase cs ε M deadline start hn j x).2 p=x.1.2 p :=
  observedPhaseTerminal_record_preserved (cs j).config ε M _ hn x hx p hp

theorem observedFinitePhase_record_preserved {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (k : ℕ)
    (s : PhaseObservation n B) (hs : PhaseRecordsConsistent s) (v : Fin k → PhaseNoise n)
    (p : Grid n) (hp : (s.2 p).1=true) :
    (observedFinitePhase cs ε M deadline start hn k s v).2 p=s.2 p := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [observedFinitePhase]
    exact (observedScheduledPhase_record_preserved cs ε M deadline start hn k _
      (observedFinitePhase_consistent cs ε M deadline start hn k s hs _) p
      (by rw [ih]; exact hp)).trans (ih _)

theorem observedFinitePhase_witness_valid {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (k : ℕ) (e : Retention n)
    (s : PhaseObservation n B) (hs : PhaseRecordsConsistent s) (v : Fin k → PhaseNoise n) :
    (phaseWitness e (observedFinitePhase cs ε M deadline start hn k s v)).Valid B :=
  phaseWitness_valid e _ (observedFinitePhase_consistent cs ε M deadline start hn k s hs v)

theorem observedFinitePhase_retention_preserved {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n → ℝ) (start : ℝ) (hn : 0<n) (k : ℕ) (e : Retention n)
    (s : PhaseObservation n B) (hs : PhaseRecordsConsistent s) (v : Fin k → PhaseNoise n)
    (p : Grid n) (hp : (s.2 p).1=true) :
    (phaseWitness e (observedFinitePhase cs ε M deadline start hn k s v)).retained p=e.value p (s.2 p).2 := by
  change recordedValue e _ p=_
  unfold recordedValue
  rw [observedFinitePhase_record_preserved cs ε M deadline start hn k s hs v p hp,if_pos hp]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedPhaseTerminal_record_origin
#print axioms NoThreeLine.BirthWitness.observedFinitePhase_retention_preserved
