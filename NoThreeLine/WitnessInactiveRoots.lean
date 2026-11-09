import NoThreeLine.ActualWitnessGuardEstimate

/-! No root becomes active again under an actual segment. This supplies
the zero branch for arbitrary C, including roots already retired or dead. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines MixedConnection EtaMixedGenerator

theorem augRawOutcome_active_subset {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × CandidateData n) :
    (augRawOutcome cfg ε M x).physical.process.activeEvents⊆x.1.1.1.val.process.activeEvents := by
  unfold augRawOutcome
  split_ifs
  · simp only [ExtendedState.candidateUpdate_eq]
    split_ifs
    · exact (augPreState cfg ε M x).physical.process.birth_activeEvents_subset _ _ _
    · exact Finset.Subset.refl _
  · exact Finset.Subset.refl _

theorem augOutcome_active_subset {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugmentedCappedInput cfg × CandidateData n) :
    (augOutcome cfg ε M x).physical.process.activeEvents⊆x.1.1.1.val.process.activeEvents :=
  (augmented_resolve_active_subset (augRawOutcome cfg ε M x) cfg.directions cfg.B cfg.K cfg.rho ε M).trans
    (augRawOutcome_active_subset cfg ε M x)

theorem observedStep_active_subset {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (x : TimedObservation cfg × CandidateData n) :
    (observedStep cfg ε M start x).1.val.1.physical.process.activeEvents⊆x.1.1.val.1.physical.process.activeEvents := by
  change (augTimedStepPair cfg ε M (x.1.1,x.2)).1.physical.process.activeEvents⊆_
  unfold augTimedStepPair
  split_ifs
  · exact Finset.Subset.refl _
  · exact augOutcome_active_subset cfg ε M (augTimedInput cfg x.1.1,x.2)

theorem mixed_eq_zero_of_not_active {n : ℕ} (a : WitnessState n) (Γ : Finset ZPoint)
    (C D L : Finset (Grid n)) (hC : ¬C⊆a.augmented.physical.process.activeEvents) :
    mixed Γ C D L a=0 := by simp only [mixed,correctedPhi,phi,if_neg hC,mul_zero]

theorem observedStep_mixed_zero {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (x : TimedObservation cfg × CandidateData n) (C D L : Finset (Grid n))
    (hC : ¬C⊆x.1.1.val.1.physical.process.activeEvents) :
    mixed cfg.directions C D L (observedWitness cfg e (observedStep cfg ε M start x))=0 :=
  mixed_eq_zero_of_not_active _ cfg.directions C D L (fun h=>hC (h.trans (observedStep_active_subset cfg ε M start x)))

theorem selectedSourceSum_zero_of_not_active {n : ℕ} (cfg : FlowConfig n) (x : EtaFlowInput cfg)
    (b : Grid n→ℝ) (C D L : Finset (Grid n)) (e : Retention n) (start t : ℝ)
    (hC : ¬C⊆x.1.val.process.activeEvents) : selectedSourceSum cfg x b C D L e start t=0 := by
  apply Finset.sum_eq_zero
  intro q _
  have hz : mixed cfg.directions (insert q C) (D.erase q) L (selectedWitnessCurve cfg x b t)=0 :=
    mixed_eq_zero_of_not_active _ _ _ _ _ (fun h=>hC ((Finset.subset_insert q C).trans h))
  simp only [hz,mul_zero]

theorem observedSourceIntegral_zero_of_not_active {n : ℕ} (cfg : FlowConfig n) (ε M start : ℝ)
    (e : Retention n) (s : TimedObservation cfg) (C D L : Finset (Grid n))
    (hC : ¬C⊆s.1.val.1.physical.process.activeEvents) : observedSourceIntegral cfg ε M start e s C D L=0 := by
  unfold observedSourceIntegral
  simp_rw [selectedSourceSum_zero_of_not_active cfg (augTimedInput cfg s.1).1 _ C D L e _ _ hC,mul_zero]
  simp

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.observedStep_active_subset
#print axioms NoThreeLine.BirthWitness.observedSourceIntegral_zero_of_not_active
