import NoThreeLine.RootFreezeTerminal
import NoThreeLine.VirtualMassExpansion

/-! A live actual postgeometry virtual hit stops the physical process and
freezes exactly that pre-resolution snapshot for its active external root.
The root's prior-open flag is derived, not imposed as an extra event. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def virtualRawHit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n) : Prop :=
  ¬observationDone cfg x.1 ∧ M≤virtualMass (rawStepSaved cfg ε M start x).1.physical.process
    cfg.directions (rawStepSaved cfg ε M start x).1.physical.coordinates L q

theorem virtualRawHit_measurable {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (q : Grid n) : Measurable (virtualRawHit cfg ε M start L q) := by
  have hm := (AugmentedState.measurable_physical n).comp
    (rawStepSaved_measurable cfg ε M start).fst
  exact ((observationDone_measurable cfg).comp measurable_fst).not.and
    (measurable_const.le' ((ExtendedState.measurable_virtualMass cfg.directions L q).comp hm))

theorem virtualRawHit_enabled {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n)
    (hM : 0<M) (hh : virtualRawHit cfg ε M start L q x) :
    VirtualWitness.enabled (rawStepSaved cfg ε M start x).1.physical.process cfg.directions L q := by
  by_contra hn
  have hz := VirtualWitness.virtualMass_eq_zero_of_disabled
    (rawStepSaved cfg ε M start x).1.physical.process cfg.directions
    (rawStepSaved cfg ε M start x).1.physical.coordinates L q hn
  exact (not_le_of_gt hM) (hz ▸ hh.2)

theorem virtualRawHit_stops {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n)
    (hh : virtualRawHit cfg ε M start L q x) :
    (observedStep cfg ε M start x).1.val.1.physical.process.stopped=true := by
  rw [rawStepSaved_resolved cfg ε M start x hh.1]
  apply AugmentedState.resolve_stops_aux
  right
  exact mem_iUnion.mpr ⟨L,mem_iUnion.mpr ⟨q,hh.2⟩⟩

theorem rootObserverStep_virtualHit_snapshot {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg q s) (hM : 0<M) (L : LineIndex n)
    (hh : virtualRawHit cfg ε M start L q (s.1,z)) :
    (rootObserverStep cfg ε M start q (s,z)).2=(true,rawStepSaved cfg ε M start (s.1,z)) := by
  have he := virtualRawHit_enabled cfg ε M start L q (s.1,z) hM hh
  have ha : (s.1.1.val.1.physical.process.accounts q).status=.active := by
    have hr : ((augRawOutcome cfg ε M (augTimedInput cfg s.1.1,z)).physical.process.accounts q).status=.active := by
      simpa only [rawStepSaved,if_neg hh.1] using he.2.2.2.2
    exact (ProcessState.mem_activeEvents _ _).mp
      (augRawOutcome_active_subset cfg ε M (augTimedInput cfg s.1.1,z)
        ((ProcessState.mem_activeEvents _ _).mpr hr))
  have hf : s.2.1=false := by
    apply Bool.eq_false_iff.mpr
    intro h
    rcases hs.closed_iff.mp h with hd|hi
    · exact hh.1 hd
    · exact hi ha
  apply rootObserverStep_first_closure cfg ε M start q (s,z) hf
  exact Or.inl (Or.inr (virtualRawHit_stops cfg ε M start L q (s.1,z) hh))

theorem rootObserverStep_virtualHit_mass {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg q s) (hM : 0<M) (L : LineIndex n)
    (hh : virtualRawHit cfg ε M start L q (s.1,z)) :
    M≤virtualMass (rootObserverStep cfg ε M start q (s,z)).2.2.1.physical.process
      cfg.directions (rootObserverStep cfg ε M start q (s,z)).2.2.1.physical.coordinates L q := by
  rw [rootObserverStep_virtualHit_snapshot cfg ε M start q s z hs hM L hh]
  exact hh.2

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.virtualRawHit_measurable
#print axioms NoThreeLine.BirthWitness.rootObserverStep_virtualHit_snapshot
#print axioms NoThreeLine.BirthWitness.rootObserverStep_virtualHit_mass
