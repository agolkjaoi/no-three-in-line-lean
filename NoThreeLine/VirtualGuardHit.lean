import NoThreeLine.VirtualHitPhase

/-! A virtual contact at the actual selected guard endpoint, strictly
before the next candidate, is the raw virtual-hit event already transported
to the saved full-phase snapshot. Candidate-at-guard ties are kept separate. -/
set_option autoImplicit false
noncomputable section
namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def virtualGuardPhysical {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : TimedObservation cfg) : ExtendedState n :=
  selectedTrajectory cfg ((augTimedInput cfg s.1).1.1,augGuardTime cfg ε M (augTimedInput cfg s.1))

theorem virtualGuardPhysical_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (virtualGuardPhysical cfg ε M) := by
  exact (selectedTrajectory_measurable cfg).comp
    ((((augTimedInput_measurable cfg).comp measurable_fst).fst.fst).prodMk
      ((augGuardTime_measurable cfg ε M).comp ((augTimedInput_measurable cfg).comp measurable_fst)))

theorem augRawOutcome_physical_eq_guard_of_late {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg) (he : x.1.1.val.Valid cfg.B) (z : CandidateData n)
    (hlate : augGuardTime cfg ε M x<z.1.1) :
    (augRawOutcome cfg ε M (x,z)).physical=selectedTrajectory cfg (x.1.1,augGuardTime cfg ε M x) := by
  have ha : augAdvance cfg ε M (x,z.1.1)=augGuardTime cfg ε M x := by
    change max 0 (min (augGuardTime cfg ε M x) z.1.1)=_
    rw [min_eq_left hlate.le,max_eq_right (augGuardTime_mem cfg ε M x he).1]
  rw [augRawOutcome,if_neg (fun h=>(not_le.mpr hlate) h.2)]
  change selectedTrajectory cfg (x.1.1,augAdvance cfg ε M (x,z.1.1))=_
  rw [ha]

def virtualGuardBeforeCandidate {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n) : Prop :=
  ¬observationDone cfg x.1 ∧ augGuardTime cfg ε M (augTimedInput cfg x.1.1)<x.2.1.1 ∧
    M≤virtualMass (virtualGuardPhysical cfg ε M x.1).process cfg.directions
      (virtualGuardPhysical cfg ε M x.1).coordinates L q

theorem virtualGuardBeforeCandidate_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (L : LineIndex n) (q : Grid n) : Measurable (virtualGuardBeforeCandidate cfg ε M L q) := by
  exact ((observationDone_measurable cfg).comp measurable_fst).not.and
    ((((augGuardTime_measurable cfg ε M).comp ((augTimedInput_measurable cfg).comp measurable_fst.fst)).lt measurable_snd.fst.fst).and
      (measurable_const.le' ((ExtendedState.measurable_virtualMass cfg.directions L q).comp
        ((virtualGuardPhysical_measurable cfg ε M).comp measurable_fst))))

theorem virtualGuardBeforeCandidate_rawHit {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (q : Grid n) (x : TimedObservation cfg×CandidateData n)
    (hh : virtualGuardBeforeCandidate cfg ε M L q x) : virtualRawHit cfg ε M start L q x := by
  refine ⟨hh.1,?_⟩
  simp only [rawStepSaved,if_neg hh.1]
  rw [augRawOutcome_physical_eq_guard_of_late cfg ε M (augTimedInput cfg x.1.1)
    x.1.1.property.1.1 x.2 hh.2.1]
  exact hh.2.2

theorem rootObserverStep_virtualGuard_snapshot {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (q : Grid n) (s : RootObservation cfg) (z : CandidateData n)
    (hs : RootObserverInvariant cfg q s) (hM : 0<M) (L : LineIndex n)
    (hh : virtualGuardBeforeCandidate cfg ε M L q (s.1,z)) :
    (rootObserverStep cfg ε M start q (s,z)).2=(true,rawStepSaved cfg ε M start (s.1,z)) :=
  rootObserverStep_virtualHit_snapshot cfg ε M start q s z hs hM L
    (virtualGuardBeforeCandidate_rawHit cfg ε M start L q (s.1,z) hh)

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.virtualGuardBeforeCandidate_measurable
#print axioms NoThreeLine.BirthWitness.virtualGuardBeforeCandidate_rawHit
#print axioms NoThreeLine.BirthWitness.rootObserverStep_virtualGuard_snapshot
