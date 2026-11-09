import NoThreeLine.VirtualGuardHit

/-! A continuous virtual contact inside the actually executed segment
must be at its endpoint and at the actual auxiliary/combined guard. The
physical guard, remaining time and candidate cap are all retained. -/
set_option autoImplicit false
set_option maxHeartbeats 1200000
noncomputable section
open MeasureTheory Set
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem selectedTrajectory_virtualMass {n : ℕ} (cfg : FlowConfig n)
    (x : StateBall n cfg.box) (t : ℝ) (L : LineIndex n) (q : Grid n) :
    virtualMass (selectedTrajectory cfg (x,t)).process cfg.directions
      (selectedTrajectory cfg (x,t)).coordinates L q=
      virtualMass x.val.process cfg.directions (selectedCurve cfg (x,t)) L q := by
  change virtualMass (x.val.withCoordinates (selectedCurve cfg (x,t))).process cfg.directions
    (x.val.withCoordinates (selectedCurve cfg (x,t))).coordinates L q=_
  rw [ExtendedState.withCoordinates_coordinates]
  rfl

theorem virtualContact_eq_actual_endpoint {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (wait t : ℝ)
    (ht : t∈Icc (0:ℝ) (augAdvance cfg ε M (x,wait))) (L : LineIndex n) (q : Grid n)
    (hh : M≤virtualMass x.1.1.val.process cfg.directions (selectedCurve cfg (x.1.1,t)) L q) :
    t=augAdvance cfg ε M (x,wait) ∧ t=augGuardTime cfg ε M x ∧ t=selectedAuxTime cfg ε M x.1 := by
  have ha := augAdvance_mem cfg ε M x he wait
  have hg := augGuardTime_le_aux cfg ε M x
  have hle : t≤selectedAuxTime cfg ε M x.1 := ht.2.trans (ha.2.trans hg)
  have hge : selectedAuxTime cfg ε M x.1≤t := by
    by_contra hn
    exact (not_le_of_gt ((selectedAuxTime_before cfg ε M x.1 t ht.1 (lt_of_not_ge hn)).2 L q)) hh
  exact ⟨le_antisymm ht.2 (ha.2.trans (hg.trans hge)),
    le_antisymm (ht.2.trans ha.2) (hg.trans hge),le_antisymm hle hge⟩

def virtualSegmentContact {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n) : Prop :=
  ¬observationDone cfg x.1 ∧ ∃t,t∈Icc (0:ℝ) (augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1)) ∧
    M≤virtualMass x.1.1.val.1.physical.process cfg.directions
      (selectedCurve cfg ((augTimedInput cfg x.1.1).1.1,t)) L q

theorem virtualSegmentContact_iff_endpoint {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n) :
    virtualSegmentContact cfg ε M L q x ↔ ¬observationDone cfg x.1 ∧
      augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1)=augGuardTime cfg ε M (augTimedInput cfg x.1.1) ∧
      M≤virtualMass (virtualGuardPhysical cfg ε M x.1).process cfg.directions
        (virtualGuardPhysical cfg ε M x.1).coordinates L q := by
  constructor
  · rintro ⟨hd,t,ht,hh⟩
    have he := virtualContact_eq_actual_endpoint cfg ε M (augTimedInput cfg x.1.1)
      x.1.1.property.1.1 x.2.1.1 t ht L q hh
    refine ⟨hd,he.1.symm.trans he.2.1,?_⟩
    rw [virtualGuardPhysical,selectedTrajectory_virtualMass,←he.2.1]
    exact hh
  · rintro ⟨hd,ha,hh⟩
    refine ⟨hd,augGuardTime cfg ε M (augTimedInput cfg x.1.1),?_,?_⟩
    · rw [ha]
      exact ⟨(augGuardTime_mem cfg ε M (augTimedInput cfg x.1.1) x.1.1.property.1.1).1,le_rfl⟩
    · rw [virtualGuardPhysical,selectedTrajectory_virtualMass] at hh
      exact hh

theorem virtualSegmentContact_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (q : Grid n) : Measurable (virtualSegmentContact cfg ε M L q) := by
  have he : virtualSegmentContact cfg ε M L q=(fun x : TimedObservation cfg×CandidateData n=>
      ¬observationDone cfg x.1 ∧
      augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1)=augGuardTime cfg ε M (augTimedInput cfg x.1.1) ∧
      M≤virtualMass (virtualGuardPhysical cfg ε M x.1).process cfg.directions
        (virtualGuardPhysical cfg ε M x.1).coordinates L q) := by
    funext x
    exact propext (virtualSegmentContact_iff_endpoint cfg ε M L q x)
  rw [he]
  have hi : Measurable (fun x : TimedObservation cfg×CandidateData n=>augTimedInput cfg x.1.1) :=
    (augTimedInput_measurable cfg).comp measurable_fst.fst
  exact ((observationDone_measurable cfg).comp measurable_fst).not.and
    ((((augAdvance_measurable cfg ε M).comp (hi.prodMk measurable_snd.fst.fst)).eq
      ((augGuardTime_measurable cfg ε M).comp hi)).and
      (measurable_const.le' ((ExtendedState.measurable_virtualMass cfg.directions L q).comp
        ((virtualGuardPhysical_measurable cfg ε M).comp measurable_fst))))

theorem virtualSegmentContact_guardBeforeCandidate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n)
    (hh : virtualSegmentContact cfg ε M L q x) (hw : 0≤x.2.1.1)
    (hne : x.2.1.1≠augGuardTime cfg ε M (augTimedInput cfg x.1.1)) :
    virtualGuardBeforeCandidate cfg ε M L q x := by
  obtain ⟨hd,ha,hm⟩ := (virtualSegmentContact_iff_endpoint cfg ε M L q x).mp hh
  have hle : augAdvance cfg ε M (augTimedInput cfg x.1.1,x.2.1.1)≤x.2.1.1 :=
    max_le hw (min_le_right _ _)
  rw [ha] at hle
  exact ⟨hd,lt_of_le_of_ne hle hne.symm,hm⟩

theorem virtualSegmentContact_rawHit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n)
    (hh : virtualSegmentContact cfg ε M L q x) (hw : 0≤x.2.1.1)
    (hne : x.2.1.1≠augGuardTime cfg ε M (augTimedInput cfg x.1.1)) :
    virtualRawHit cfg ε M start L q x :=
  virtualGuardBeforeCandidate_rawHit cfg ε M start L q x
    (virtualSegmentContact_guardBeforeCandidate cfg ε M L q x hh hw hne)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.virtualContact_eq_actual_endpoint
#print axioms NoThreeLine.BirthWitness.virtualSegmentContact_measurable
#print axioms NoThreeLine.BirthWitness.virtualSegmentContact_rawHit
