import NoThreeLine.IteratedCandidateClocks
import Mathlib.MeasureTheory.Integral.Prod

/-! Integral interfaces for fresh finite candidate prefixes and for a
parameter-dependent no-arrival horizon. The parameter is independent of
the fresh clocks by the explicitly stated product source measure. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.RestartIntegralAPI
open FiniteClockRestart FirstEventSections WinnerSectionDensity VariableResidualSection
open IteratedCandidateClocks

theorem prefix_lintegral {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) (k : ℕ)
    (f : (Fin k → Event n) × BoardClockPath n → ℝ≥0∞) (hf : Measurable f) :
    (∫⁻ ω, f (candidatePrefix hn k ω) ∂boardClockMeasure n rate) =
      ∫⁻ z, ∫⁻ ω, f (z,ω) ∂boardClockMeasure n rate
        ∂Measure.pi (fun _ : Fin k => eventLaw hn rate) := by
  letI := boardClockMeasure_probability n rate hr
  rw [← lintegral_map hf (candidatePrefix_preserving hn rate hr k).measurable,
    (candidatePrefix_preserving hn rate hr k).map_eq, lintegral_prod _ hf.aemeasurable]

theorem prefix_integral {n : ℕ} (hn : 0 < n) (rate : ℝ) (hr : 0 < rate) (k : ℕ)
    (f : (Fin k → Event n) × BoardClockPath n → ℝ) (hf : Measurable f)
    (hfi : Integrable f ((Measure.pi (fun _ : Fin k => eventLaw hn rate)).prod
      (boardClockMeasure n rate))) :
    (∫ ω, f (candidatePrefix hn k ω) ∂boardClockMeasure n rate) =
      ∫ z, ∫ ω, f (z,ω) ∂boardClockMeasure n rate
        ∂Measure.pi (fun _ : Fin k => eventLaw hn rate) := by
  letI := boardClockMeasure_probability n rate hr
  letI := eventLaw_probability hn rate hr
  rw [← integral_map_of_stronglyMeasurable (candidatePrefix_preserving hn rate hr k).measurable
    hf.stronglyMeasurable, (candidatePrefix_preserving hn rate hr k).map_eq, integral_prod _ hfi]

theorem residual_section_lintegral {Θ ι : Type*} [MeasurableSpace Θ] [Fintype ι]
    (μ : Measure Θ) [IsFiniteMeasure μ] (time : Θ → ℝ) (htime : Measurable time)
    (hpos : ∀ᵐ θ ∂μ, 0 ≤ time θ) (rate : ℝ) (hr : 0 < rate)
    (f : Θ × (ι → MarkedClockPath) → ℝ≥0∞) (hf : Measurable f) :
    (∫⁻ z in {z : Θ × (ι → MarkedClockPath) | z.2 ∈ allSurvive (time z.1)},
      f (z.1,residualFamily (time z.1) z.2) ∂μ.prod (markedFamilyMeasure ι rate)) =
      ∫⁻ θ, survivorWeight (Fintype.card ι) rate (time θ) *
        (∫⁻ ω, f (θ,ω) ∂markedFamilyMeasure ι rate) ∂μ := by
  letI := family_probability ι rate hr
  have hF : Measurable (fun z : Θ × (ι → MarkedClockPath) =>
      (z.1,residualFamily (time z.1) z.2)) :=
    measurable_fst.prodMk ((residualFamily_joint_measurable ι).comp
      ((htime.comp measurable_fst).prodMk measurable_snd))
  have hc : Measurable (fun θ => survivorWeight (Fintype.card ι) rate (time θ)) :=
    (survivorWeight_measurable (Fintype.card ι) rate).comp htime
  have hi : Measurable (fun θ => ∫⁻ ω, f (θ,ω) ∂markedFamilyMeasure ι rate) :=
    hf.lintegral_prod_right'
  rw [← lintegral_map hf hF, residual_section_map μ time htime hpos rate hr,
    lintegral_prod _ hf.aemeasurable,
    lintegral_withDensity_eq_lintegral_mul μ hc hi]
  rfl

theorem residual_section_integral {Θ ι : Type*} [MeasurableSpace Θ] [Fintype ι]
    (μ : Measure Θ) [IsFiniteMeasure μ] (time : Θ → ℝ) (htime : Measurable time)
    (hpos : ∀ᵐ θ ∂μ, 0 ≤ time θ) (rate : ℝ) (hr : 0 < rate)
    (f : Θ × (ι → MarkedClockPath) → ℝ) (hf : Measurable f)
    (hfi : Integrable (fun z : Θ × (ι → MarkedClockPath) =>
      Real.exp (-((Fintype.card ι : ℝ)*rate*time z.1)) * f z)
      (μ.prod (markedFamilyMeasure ι rate))) :
    (∫ z in {z : Θ × (ι → MarkedClockPath) | z.2 ∈ allSurvive (time z.1)},
      f (z.1,residualFamily (time z.1) z.2) ∂μ.prod (markedFamilyMeasure ι rate)) =
      ∫ θ, Real.exp (-((Fintype.card ι : ℝ)*rate*time θ)) *
        (∫ ω, f (θ,ω) ∂markedFamilyMeasure ι rate) ∂μ := by
  letI := family_probability ι rate hr
  have hF : Measurable (fun z : Θ × (ι → MarkedClockPath) =>
      (z.1,residualFamily (time z.1) z.2)) :=
    measurable_fst.prodMk ((residualFamily_joint_measurable ι).comp
      ((htime.comp measurable_fst).prodMk measurable_snd))
  have hc : Measurable (fun θ => survivorWeight (Fintype.card ι) rate (time θ)) :=
    (survivorWeight_measurable (Fintype.card ι) rate).comp htime
  have hc' : Measurable (fun z : Θ × (ι → MarkedClockPath) =>
      survivorWeight (Fintype.card ι) rate (time z.1)) := hc.comp measurable_fst
  have hfinite : ∀ᵐ z : Θ × (ι → MarkedClockPath) ∂μ.prod (markedFamilyMeasure ι rate),
      survivorWeight (Fintype.card ι) rate (time z.1) < ∞ :=
    Filter.Eventually.of_forall (fun _ => ENNReal.ofReal_lt_top)
  rw [← integral_map_of_stronglyMeasurable hF hf.stronglyMeasurable,
    residual_section_map μ time htime hpos rate hr, prod_withDensity_left hc,
    integral_withDensity_eq_integral_toReal_smul hc' hfinite f]
  simp only [survivorWeight, ENNReal.toReal_ofReal (Real.exp_pos _).le, smul_eq_mul]
  rw [integral_prod _ hfi]
  simp only [integral_const_mul]

end NoThreeLine.RestartIntegralAPI

#print axioms NoThreeLine.RestartIntegralAPI.prefix_integral
#print axioms NoThreeLine.RestartIntegralAPI.residual_section_integral
