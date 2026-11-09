import NoThreeLine.BirthObservation
import NoThreeLine.AugmentedTerminalKernel

/-! Actual board-noise iteration of the timestamp observer. Physical/eta
projection agrees pathwise with the original augmented iteration and terminal.
Birth-time records are permanent along every consistent observed path. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def observedClockStep {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : TimedObservation cfg × BoardClockPath n) : TimedObservation cfg :=
  observedStep cfg ε M start (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem observedClockStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) :
    Measurable (observedClockStep cfg ε M start hn) :=
  (observedStep_measurable cfg ε M start).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

def observedNoiseState {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) : TimedObservation cfg :=
  GenericCreditIteration.noiseState (observedClockStep cfg ε M start hn) s k ω

theorem observedNoiseState_zero {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (ω : ℕ → BoardClockPath n) :
    observedNoiseState cfg ε M start hn s 0 ω=s := rfl

theorem observedNoiseState_succ {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) :
    observedNoiseState cfg ε M start hn s (k+1) ω=
      observedStep cfg ε M start (observedNoiseState cfg ε M start hn s k ω,WinnerMarkLaw.firstMarkedRace hn (ω k)) := rfl

theorem observedNoiseState_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (k : ℕ) (ω : ℕ → BoardClockPath n) :
    (observedNoiseState cfg ε M start hn s k ω).1=augTimedNoiseState cfg ε M hn s.1 k ω := by
  induction k with
  | zero => rfl
  | succ k ih =>
    rw [observedNoiseState_succ,observedStep_base,ih]
    rfl

theorem observedNoiseState_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (k : ℕ) : Measurable (fun x : TimedObservation cfg × (ℕ → BoardClockPath n)=>
      observedNoiseState cfg ε M start hn x.1 k x.2) :=
  (GenericCreditIteration.finiteState_measurable _ (observedClockStep_measurable cfg ε M start hn) k).comp
    (measurable_fst.prodMk ((GenericCreditIteration.noisePrefix_measurable k).comp measurable_snd))

theorem observedNoiseState_consistent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) (k : ℕ) (ω : ℕ → BoardClockPath n) :
    RecordsConsistent cfg (observedNoiseState cfg ε M start hn s k ω) := by
  induction k with
  | zero => exact hs
  | succ k ih => exact observedStep_consistent cfg ε M start _ ih

theorem observedNoiseState_record_stable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (s : TimedObservation cfg) (hs : RecordsConsistent cfg s) (ω : ℕ → BoardClockPath n)
    (p : Grid n) (j : ℕ) (hp : ((observedNoiseState cfg ε M start hn s j ω).2 p).1=true) :
    ∀k,j≤k→(observedNoiseState cfg ε M start hn s k ω).2 p=
      (observedNoiseState cfg ε M start hn s j ω).2 p := by
  intro k hk
  induction k, hk using Nat.le_induction with
  | base => rfl
  | succ k hk ih =>
    rw [observedNoiseState_succ]
    exact (observedStep_record_preserved cfg ε M start _
      (observedNoiseState_consistent cfg ε M start hn s hs k ω) p (by rw [ih]; exact hp)).trans ih

theorem observed_birth_value_stable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (e : Retention n) (s : TimedObservation cfg) (hs : RecordsConsistent cfg s)
    (ω : ℕ → BoardClockPath n) (j k : ℕ) (hjk : j+1≤k)
    (hb : timedBirth cfg ε M (augTimedNoiseState cfg ε M hn s.1 j ω,WinnerMarkLaw.firstMarkedRace hn (ω j))) :
    (observedWitness cfg e (observedNoiseState cfg ε M start hn s k ω)).retained
        (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.2=
      e.value (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.2
        (observationTime cfg start (augTimedNoiseState cfg ε M hn s.1 (j+1) ω)) := by
  have hb' : timedBirth cfg ε M ((observedNoiseState cfg ε M start hn s j ω).1,
      WinnerMarkLaw.firstMarkedRace hn (ω j)) := by rw [observedNoiseState_base]; exact hb
  have hr := observedStep_record_of_birth cfg ε M start
    (observedNoiseState cfg ε M start hn s j ω,WinnerMarkLaw.firstMarkedRace hn (ω j)) hb'
  have hborn : ((observedNoiseState cfg ε M start hn s (j+1) ω).2
      (WinnerMarkLaw.firstMarkedRace hn (ω j)).1.2).1=true := by
    rw [observedNoiseState_succ,hr]
  have heq := observedNoiseState_record_stable cfg ε M start hn s hs ω _ (j+1) hborn k hjk
  change recordedValue e _ _=_
  unfold recordedValue
  rw [heq]
  change (observedWitness cfg e (observedNoiseState cfg ε M start hn s (j+1) ω)).retained _=_
  rw [observedNoiseState_succ,observedStep_retention_at_birth cfg ε M start e _ hb',observedNoiseState_base]
  rfl

def observedTerminal {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : TimedObservation cfg × (ℕ → BoardClockPath n)) : TimedObservation cfg :=
  observedNoiseState cfg ε M start hn x.1 (augTimedCompletionIndex cfg ε M hn x.1.1 x.2) x.2

theorem observedTerminal_base {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : TimedObservation cfg × (ℕ → BoardClockPath n)) :
    (observedTerminal cfg ε M start hn x).1=augTimedTerminal cfg ε M hn x.1.1 x.2 :=
  observedNoiseState_base cfg ε M start hn x.1 _ x.2

theorem observedTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n) :
    Measurable (observedTerminal cfg ε M start hn) := by
  classical
  exact Measurable.find (observedNoiseState_joint_measurable cfg ε M start hn)
    (fun k=>measurableSet_setOf.mpr ((augTimedCompletionPredicate_joint_measurable cfg ε M hn k).comp
      (measurable_fst.fst.prodMk measurable_snd)))
    (fun x : TimedObservation cfg × (ℕ → BoardClockPath n)=>
      augTimedCompletionPredicate_exists cfg ε M hn x.1.1 x.2)

theorem observedTerminal_consistent {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (x : TimedObservation cfg × (ℕ → BoardClockPath n)) (hx : RecordsConsistent cfg x.1) :
    RecordsConsistent cfg (observedTerminal cfg ε M start hn x) :=
  observedNoiseState_consistent cfg ε M start hn x.1 hx _ x.2

theorem observedTerminal_witness_valid {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ) (hn : 0<n)
    (e : Retention n) (x : TimedObservation cfg × (ℕ → BoardClockPath n)) (hx : RecordsConsistent cfg x.1) :
    (observedWitness cfg e (observedTerminal cfg ε M start hn x)).Valid cfg.B :=
  observedWitness_valid cfg e _ (observedTerminal_consistent cfg ε M start hn x hx)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedNoiseState_base
#print axioms NoThreeLine.BirthWitness.observed_birth_value_stable
#print axioms NoThreeLine.BirthWitness.observedTerminal_measurable
