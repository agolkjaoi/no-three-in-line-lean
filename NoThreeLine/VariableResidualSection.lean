import NoThreeLine.FirstEventSections

/-! Integrate deterministic residual-clock section laws against a measurable
nonnegative time parameter. This is used for a fixed winning site's head. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter Function
open scoped ENNReal Topology BigOperators

namespace NoThreeLine.VariableResidualSection
open ClockRestartBase DeterministicClockRestart FiniteClockRestart
open FirstEventSections WinnerSectionDensity

theorem residual_joint_measurable : Measurable (fun z : ℝ × ClockPath => residual z.1 z.2) := by
  apply measurable_pi_lambda
  intro k
  cases k with
  | zero => exact ((measurable_pi_apply 0).comp measurable_snd).sub measurable_fst
  | succ k =>
    change Measurable (fun z : ℝ × ClockPath => z.2 (k+1))
    exact (measurable_pi_apply (k+1)).comp measurable_snd

theorem residualFamily_joint_measurable (ι : Type*) :
    Measurable (fun z : ℝ × (ι → MarkedClockPath) => residualFamily z.1 z.2) := by
  apply measurable_pi_lambda
  intro i
  change Measurable (fun z : ℝ × (ι → MarkedClockPath) =>
    (residual z.1 (z.2 i).1, (z.2 i).2))
  exact (residual_joint_measurable.comp (measurable_fst.prodMk
    (measurable_fst.comp ((measurable_pi_apply i).comp measurable_snd)))).prodMk
      (measurable_snd.comp ((measurable_pi_apply i).comp measurable_snd))

theorem allSurvive_joint_measurable (ι : Type*) [Countable ι] :
    MeasurableSet {z : ℝ × (ι → MarkedClockPath) | z.2 ∈ allSurvive z.1} := by
  have he : {z : ℝ × (ι → MarkedClockPath) | z.2 ∈ allSurvive z.1} =
      ⋂ i : ι, {z | z.1 < (z.2 i).1 0} := by ext z; simp [allSurvive]
  rw [he]
  apply MeasurableSet.iInter
  intro i
  exact measurableSet_lt measurable_fst
    ((measurable_pi_apply 0).comp (measurable_fst.comp ((measurable_pi_apply i).comp measurable_snd)))

theorem residual_section_map {Θ ι : Type*} [MeasurableSpace Θ] [Fintype ι]
    (μ : Measure Θ) [IsFiniteMeasure μ] (time : Θ → ℝ) (htime : Measurable time)
    (hpos : ∀ᵐ θ ∂μ, 0 ≤ time θ) (rate : ℝ) (hr : 0 < rate) :
    ((μ.prod (markedFamilyMeasure ι rate)).restrict
      {z : Θ × (ι → MarkedClockPath) | z.2 ∈ allSurvive (time z.1)}).map
        (fun z => (z.1, residualFamily (time z.1) z.2)) =
      (μ.withDensity (fun θ => survivorWeight (Fintype.card ι) rate (time θ))).prod
        (markedFamilyMeasure ι rate) := by
  letI := family_probability ι rate hr
  let ν := markedFamilyMeasure ι rate
  let c : Θ → ℝ≥0∞ := fun θ => survivorWeight (Fintype.card ι) rate (time θ)
  have hc : Measurable c := (survivorWeight_measurable _ rate).comp htime
  let S : Set (Θ × (ι → MarkedClockPath)) := {z | z.2 ∈ allSurvive (time z.1)}
  let F : Θ × (ι → MarkedClockPath) → Θ × (ι → MarkedClockPath) :=
    fun z => (z.1, residualFamily (time z.1) z.2)
  have hS : MeasurableSet S := (allSurvive_joint_measurable ι).preimage
    ((htime.comp measurable_fst).prodMk measurable_snd)
  have hF : Measurable F := measurable_fst.prodMk
    ((residualFamily_joint_measurable ι).comp ((htime.comp measurable_fst).prodMk measurable_snd))
  change ((μ.prod ν).restrict S).map F = (μ.withDensity c).prod ν
  apply Measure.ext_prod
  intro A B hA hB
  rw [Measure.map_apply hF (hA.prod hB), Measure.restrict_apply ((hA.prod hB).preimage hF),
    Measure.prod_apply (((hA.prod hB).preimage hF).inter hS), Measure.prod_prod]
  have hsec (θ : Θ) (ht : 0 ≤ time θ) :
      ν (Prod.mk θ ⁻¹' (F ⁻¹' (A ×ˢ B) ∩ S)) = A.indicator (fun θ => c θ * ν B) θ := by
    by_cases hθ : θ ∈ A
    · have he : Prod.mk θ ⁻¹' (F ⁻¹' (A ×ˢ B) ∩ S) =
          residualFamily (time θ) ⁻¹' B ∩ allSurvive (time θ) := by
        ext ω
        simp [F, S, hθ]
      rw [he, Set.indicator_of_mem hθ]
      have hm := congrArg (fun σ : Measure (ι → MarkedClockPath) => σ B)
        (finite_residual_restrict_map_exp ι rate (time θ) hr ht)
      rw [Measure.map_apply (residualFamily_measurable ι (time θ)) hB,
        Measure.restrict_apply (hB.preimage (residualFamily_measurable ι (time θ))),
        Measure.smul_apply, smul_eq_mul] at hm
      exact hm
    · have he : Prod.mk θ ⁻¹' (F ⁻¹' (A ×ˢ B) ∩ S) = ∅ := by
        ext ω
        simp [F, hθ]
      rw [he, measure_empty, Set.indicator_of_notMem hθ]
  calc
    (∫⁻ θ, ν (Prod.mk θ ⁻¹' (F ⁻¹' (A ×ˢ B) ∩ S)) ∂μ) =
        ∫⁻ θ, A.indicator (fun θ => c θ * ν B) θ ∂μ := by
          apply lintegral_congr_ae
          filter_upwards [hpos] with θ hθ
          exact hsec θ hθ
    _ = (μ.withDensity c) A * ν B := by
      rw [lintegral_indicator hA, lintegral_mul_const _ hc, withDensity_apply _ hA]

end NoThreeLine.VariableResidualSection

#print axioms NoThreeLine.VariableResidualSection.residual_section_map
