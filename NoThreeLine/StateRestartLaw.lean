import NoThreeLine.AugmentedClockRestart

/-! Integrate the proved state-dependent capped restart law against an
arbitrary finite initial-state law independent of the fresh board. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set
open scoped ENNReal

namespace NoThreeLine

theorem product_restart_of_sections {S W : Type*} [MeasurableSpace S] [MeasurableSpace W]
    (μ : Measure S) (ν : Measure W) [IsFiniteMeasure μ] [IsProbabilityMeasure ν]
    (F : S × W → S × W) (hF : Measurable F)
    (hsection : ∀ s, ν.map (fun ω => F (s,ω)) =
      (ν.map (fun ω => (F (s,ω)).1)).prod ν) :
    (μ.prod ν).map F = ((μ.prod ν).map (fun x => (F x).1)).prod ν := by
  apply Measure.ext_prod
  intro A D hA hD
  have hm (s : S) : Measurable (fun ω => F (s,ω)) := hF.comp (measurable_const.prodMk measurable_id)
  have hs (s : S) : ν ((fun ω => F (s,ω)) ⁻¹' (A ×ˢ D)) =
      ν ((fun ω => (F (s,ω)).1) ⁻¹' A) * ν D := by
    have hh := congrArg (fun m : Measure (S × W) => m (A ×ˢ D)) (hsection s)
    simpa only [Measure.map_apply (hm s) (hA.prod hD),Measure.prod_prod,
      Measure.map_apply (hm s).fst hA] using hh
  rw [Measure.map_apply hF (hA.prod hD),Measure.prod_prod,Measure.map_apply hF.fst hA,
    Measure.prod_apply ((hA.prod hD).preimage hF),Measure.prod_apply (hA.preimage hF.fst)]
  change (∫⁻ s, ν ((fun ω => F (s,ω)) ⁻¹' (A ×ˢ D)) ∂μ) =
    (∫⁻ s, ν ((fun ω => (F (s,ω)).1) ⁻¹' A) ∂μ) * ν D
  simp_rw [hs]
  exact lintegral_mul_const _ (measurable_measure_prodMk_left (hA.preimage hF.fst))

theorem augRestartStep_product_map {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (rate : ℝ) (hr : 0 < rate) (μ : Measure (AugTimedState cfg)) [IsFiniteMeasure μ] :
    (μ.prod (boardClockMeasure n rate)).map (augRestartStep cfg ε M hn) =
      ((μ.prod (boardClockMeasure n rate)).map (augTimedClockStep cfg ε M hn)).prod
        (boardClockMeasure n rate) := by
  letI := boardClockMeasure_probability n rate hr
  exact product_restart_of_sections μ (boardClockMeasure n rate) (augRestartStep cfg ε M hn)
    (augRestartStep_measurable cfg ε M hn) (augRestartStep_map cfg ε M hn rate hr)

end NoThreeLine

#print axioms NoThreeLine.product_restart_of_sections
#print axioms NoThreeLine.augRestartStep_product_map
