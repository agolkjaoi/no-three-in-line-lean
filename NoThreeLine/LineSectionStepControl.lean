import NoThreeLine.ScheduledSectionContinuousTail
import NoThreeLine.LineSectionJump

/-! Birth, resolution, and deadline retirement do not create an upper mass
jump. In the absence of an actual positive-time exceedance, a previously
controlled live-root mass remains controlled, including zero advances. -/
set_option autoImplicit false
set_option maxHeartbeats 1700000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE EtaMixedGenerator

theorem actualLineSectionMass_selected_initial {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (s : AugTimedState cfg) :
    actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg s).1 0) =
      actualLineSectionMass L p E s.val.1 := by
  rw [actualLineSectionMass_selected,(selectedCurve_spec cfg _ s.property.1.1.2.1).1]
  rfl

theorem observedStep_lineSectionMass_le_flow {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n))
    (s : TimedObservation cfg) (z : CandidateData n) (hd : ¬observationDone cfg s) :
    actualLineSectionMass L p E (observedStep cfg ε M start (s,z)).1.val.1 ≤
      actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg s.1).1
        (augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1))) := by
  change actualLineSectionMass L p E (augTimedStepPair cfg ε M (s.1,z)).1 ≤ _
  change ¬(s.1.val.2 ≤ 0 ∨ s.1.val.1.physical.process.stopped = true) at hd
  simp only [augTimedStepPair,if_neg hd]
  exact (resolve_lineSectionMass_le _ cfg.B
    (augRawOutcome_valid cfg ε M (augTimedInput cfg s.1) s.1.property.1.1 s.1.property.1.2 z)
      cfg.directions cfg.K cfg.rho ε M L p E).trans
        (augRawOutcome_lineSectionMass_le_pre cfg ε M L p E (augTimedInput cfg s.1) s.1.property.1.1 s.1.property.1.2 z)

def TimedSectionMassControlled {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ) (s : TimedObservation cfg) : Prop :=
  phaseRootClosed p (observedTimedProjection cfg s) ∨ actualLineSectionMass L p E s.1.val.1 ≤ A

theorem observedStep_sectionMassControlled {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : TimedObservation cfg) (z : CandidateData n)
    (hs : TimedSectionMassControlled cfg L p E A s)
    (hn : ¬lineSectionContinuousExceedance cfg ε M L p E A (s,z)) :
    TimedSectionMassControlled cfg L p E A (observedStep cfg ε M start (s,z)) := by
  rcases hs with hc | hb
  · exact Or.inl (observedStep_permanentRootClosed cfg ε M start p s z hc)
  by_cases hc : phaseRootClosed p (observedTimedProjection cfg s)
  · exact Or.inl (observedStep_permanentRootClosed cfg ε M start p s z hc)
  by_cases hd : observationDone cfg s
  · rw [observedStep_frozen cfg ε M start (s,z) hd]
    exact Or.inr hb
  right
  apply (observedStep_lineSectionMass_le_flow cfg ε M start L p E s z hd).trans
  let t := augAdvance cfg ε M (augTimedInput cfg s.1,z.1.1)
  have ht : 0 ≤ t := (augAdvance_mem cfg ε M _ s.1.property.1.1 z.1.1).1
  by_cases hz : t = 0
  · change actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg s.1).1 t) ≤ A
    rw [hz,actualLineSectionMass_selected_initial]
    exact hb
  · exact le_of_not_gt (fun h => hn ⟨hc,t,lt_of_le_of_ne ht (Ne.symm hz),le_rfl,h⟩)

theorem observedDeadline_lineSectionMass_le {n : ℕ} {B : ℝ}
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n))
    (deadline : Grid n → ℝ) (t : ℝ) (s : PhaseObservation n B) :
    actualLineSectionMass L p E (observedDeadline deadline t s).1.val ≤ actualLineSectionMass L p E s.1.val := by
  have hcoord : (augValidDeadlineRetirement deadline t s.1).val.physical.coordinates = s.1.val.physical.coordinates := by
    unfold augValidDeadlineRetirement
    split_ifs
    · rfl
    · exact s.1.val.physical.retire_coordinates _
  have hact : (augValidDeadlineRetirement deadline t s.1).val.physical.process.activeEvents ⊆
      s.1.val.physical.process.activeEvents := by
    unfold augValidDeadlineRetirement
    split_ifs
    · exact Finset.Subset.refl _
    · exact retire_activeEvents_subset _ _
  exact actualLineSectionMass_le_of_active_weight_le L p E _ _ hact
    (fun q => (s.1.property.1.2.1.1 q).1)
    (fun q => (congrArg (fun z : Coordinates n => z.1 q) hcoord).le)
    (congrArg (fun z : Coordinates n => z.2.2 L) hcoord)
    (s.1.property.1.2.1.2.2 L).1

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.observedStep_sectionMassControlled
#print axioms NoThreeLine.BirthWitness.observedDeadline_lineSectionMass_le
