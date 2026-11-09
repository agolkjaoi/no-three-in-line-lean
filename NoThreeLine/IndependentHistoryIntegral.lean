import NoThreeLine.StateHistoryFiltration
import NoThreeLine.RecycledHistoryLaw

/-! Integrate a measurable update over an event in its observed history,
using a proved product law for that history and the actual residual noise. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem independent_history_setIntegral {Ω H W : Type*}
    [MeasurableSpace Ω] [MeasurableSpace H] [MeasurableSpace W]
    (μ : Measure Ω) (ν : Measure W) [IsProbabilityMeasure μ] [IsProbabilityMeasure ν]
    (h : Ω → H) (r : Ω → W) (hh : Measurable h) (hr : Measurable r)
    (hpair : μ.map (fun ω => (h ω,r ω)) = (μ.map h).prod ν)
    (f : H × W → ℝ) (g : H → ℝ) (hf : Measurable f) (hg : Measurable g)
    (hfi : Integrable f ((μ.map h).prod ν))
    (hmean : ∀ a, (∫ w, f (a,w) ∂ν) = g a) (A : Set H) (hA : MeasurableSet A) :
    (∫ ω in h ⁻¹' A, f (h ω,r ω) ∂μ) = ∫ ω in h ⁻¹' A, g (h ω) ∂μ := by
  letI : IsProbabilityMeasure (μ.map h) := Measure.isProbabilityMeasure_map hh.aemeasurable
  have hp : Measurable (fun ω => (h ω,r ω)) := hh.prodMk hr
  have hrestricted : (μ.restrict (h ⁻¹' A)).map (fun ω => (h ω,r ω)) = ((μ.map h).restrict A).prod ν := by
    calc
      _ = (μ.map (fun ω => (h ω,r ω))).restrict (A ×ˢ univ) := by
        rw [Measure.restrict_map hp (hA.prod MeasurableSet.univ)]
        congr 2
        ext ω
        simp
      _ = _ := by rw [hpair,← Measure.restrict_prod_eq_prod_univ]
  have hfiA : Integrable f (((μ.map h).restrict A).prod ν) := by
    rw [Measure.restrict_prod_eq_prod_univ]
    exact hfi.integrableOn
  rw [← integral_map_of_stronglyMeasurable hp hf.stronglyMeasurable,hrestricted,integral_prod _ hfiA]
  simp_rw [hmean]
  rw [← integral_map_of_stronglyMeasurable hh hg.stronglyMeasurable,← Measure.restrict_map hh hA]

end NoThreeLine

#print axioms NoThreeLine.independent_history_setIntegral
