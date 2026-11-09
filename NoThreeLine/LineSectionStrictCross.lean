import NoThreeLine.LineSectionContactCapture

/-! A strict exceedance at a positive executed time forces an earlier closed
contact. Hence candidate/contact ties are not needed for this strict-crossing
capture statement. The physical advance is unchanged. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine
open AuxiliaryODE

theorem selectedLineSectionTime_lt_of_mass_gt {n : ℕ} (cfg : FlowConfig n)
    (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (x : StateBall n cfg.box) (t : ℝ) (ht : 0 < t)
    (hm : A < lineSectionMass x.val.process L p E (selectedCurve cfg (x,t))) :
    selectedLineSectionTime cfg L p E A x < t := by
  by_contra h
  have hle : t ≤ selectedLineSectionTime cfg L p E A x := le_of_not_gt h
  have hc : IsClosed {u : ℝ | lineSectionMass x.val.process L p E (selectedCurve cfg (x,u)) ≤ A} :=
    isClosed_le ((lineSectionMass_continuous x.val.process L p E).comp
      (selectedLineSectionCurve_continuous cfg x)) continuous_const
  have hsub : Ico (0:ℝ) t ⊆ {u : ℝ | lineSectionMass x.val.process L p E (selectedCurve cfg (x,u)) ≤ A} := by
    intro u hu
    exact (selectedLineSectionTime_before cfg L p E A x u hu.1 (hu.2.trans_le hle)).le
  have hcl := closure_minimal hsub hc
  rw [closure_Ico ht.ne] at hcl
  exact (not_lt_of_ge (hcl ⟨ht.le,le_rfl⟩)) hm

namespace BirthWitness
open EtaMixedGenerator

theorem lineSectionObserverStep_strict_exceedance {n : ℕ} (cfg : FlowConfig n)
    (ε M start : ℝ) (L : LineIndex n) (p : Grid n) (E : Finset (Grid n)) (A : ℝ)
    (s : LineSectionObservation cfg) (z : CandidateData n)
    (hs : LineSectionInvariant cfg p s) (hf : s.2.1 = false)
    (t : ℝ) (ht : 0 < t)
    (hta : t ≤ augAdvance cfg ε M (augTimedInput cfg s.1.1,z.1.1))
    (hm : A < actualLineSectionMass L p E (selectedAugmentedCurve cfg (augTimedInput cfg s.1.1).1 t)) :
    (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.1 = true ∧
      (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2 =
        selectedAugmentedCurve cfg (augTimedInput cfg s.1.1).1
          (selectedLineSectionTime cfg L p E A (augTimedInput cfg s.1.1).1.1) ∧
      A ≤ actualLineSectionMass L p E (lineSectionObserverStep cfg ε M start L p E A (s,z)).2.2 := by
  rw [actualLineSectionMass_selected] at hm
  exact lineSectionObserverStep_interior_contact cfg ε M start L p E A s z hs hf
    ((selectedLineSectionTime_lt_of_mass_gt cfg L p E A _ t ht hm).trans_le hta)

end BirthWitness
end NoThreeLine

#print axioms NoThreeLine.selectedLineSectionTime_lt_of_mass_gt
#print axioms NoThreeLine.BirthWitness.lineSectionObserverStep_strict_exceedance
