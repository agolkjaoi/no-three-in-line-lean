import NoThreeLine.SavedCreditMeasure
import Mathlib.MeasureTheory.Integral.Prod

/-! A joint density on an actual state/residual product is a mixture of
the section densities. No independence under the changed law is assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory

namespace NoThreeLine

theorem savedCreditMeasure_product_mixture
    {Ω X W : Type*} [MeasurableSpace Ω] [MeasurableSpace X] [MeasurableSpace W]
    (P : Measure Ω) (ρ : Measure X) (ν : Measure W) [SFinite ρ] [SFinite ν]
    (r : Ω→X×W) (hr : Measurable r) (hmap : P.map r=ρ.prod ν)
    (D : X×W→ℝ) (hD : Measurable D) (hD0 : ∀x,0≤D x)
    (f : X×W→ℝ) (hf : Measurable f)
    (hI : Integrable (fun x=>D x*f x) (ρ.prod ν)) :
    (∫ω,f (r ω) ∂savedCreditMeasure P (fun ω=>D (r ω))) =
      ∫x,∫w,f (x,w) ∂savedCreditMeasure ν (fun w=>D (x,w)) ∂ρ := by
  have hDm : Measurable (fun ω=>D (r ω)) := hD.comp hr
  rw [savedCreditMeasure_integral P (fun ω=>D (r ω)) hDm (fun ω=>hD0 (r ω)) (fun ω=>f (r ω))]
  calc
    _ = ∫x,D x*f x ∂P.map r :=
      (integral_map hr.aemeasurable (hD.mul hf).aestronglyMeasurable).symm
    _ = ∫x,D x*f x ∂ρ.prod ν := by rw [hmap]
    _ = ∫x,∫w,D (x,w)*f (x,w) ∂ν ∂ρ := integral_prod _ hI
    _ = _ := by
      apply integral_congr_ae
      exact ae_of_all _ (fun x=>(savedCreditMeasure_integral ν (fun w=>D (x,w))
        (hD.comp (measurable_const.prodMk measurable_id)) (fun w=>hD0 (x,w))
        (fun w=>f (x,w))).symm)

end NoThreeLine

#print axioms NoThreeLine.savedCreditMeasure_product_mixture
