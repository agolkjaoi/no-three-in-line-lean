import NoThreeLine.StateRestartLaw

/-! Integrate a true residual law valid for almost every incoming payload.
The payload type may change; null exceptional incoming states are ignored
by the actual product integral, not replaced by an assumed pointwise law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
namespace NoThreeLine

theorem product_restart_of_ae_sections {S T W : Type*}
    [MeasurableSpace S] [MeasurableSpace T] [MeasurableSpace W]
    (μ : Measure S) (ν : Measure W) [IsFiniteMeasure μ] [IsProbabilityMeasure ν]
    (F : S×W→T×W) (hF : Measurable F)
    (hsection : ∀ᵐs ∂μ,ν.map (fun ω=>F (s,ω))=(ν.map (fun ω=>(F (s,ω)).1)).prod ν) :
    (μ.prod ν).map F=((μ.prod ν).map (fun x=>(F x).1)).prod ν := by
  apply Measure.ext_prod
  intro A D hA hD
  have hm (s : S) : Measurable (fun ω=>F (s,ω)) := hF.comp (measurable_const.prodMk measurable_id)
  have hs : ∀ᵐs ∂μ,ν ((fun ω=>F (s,ω)) ⁻¹' (A×ˢD))=
      ν ((fun ω=>(F (s,ω)).1) ⁻¹' A)*ν D := by
    filter_upwards [hsection] with s h
    have hh := congrArg (fun m : Measure (T×W)=>m (A×ˢD)) h
    simpa only [Measure.map_apply (hm s) (hA.prod hD),Measure.prod_prod,
      Measure.map_apply (hm s).fst hA] using hh
  rw [Measure.map_apply hF (hA.prod hD),Measure.prod_prod,Measure.map_apply hF.fst hA,
    Measure.prod_apply ((hA.prod hD).preimage hF),Measure.prod_apply (hA.preimage hF.fst)]
  change (∫⁻s,ν ((fun ω=>F (s,ω)) ⁻¹' (A×ˢD)) ∂μ)=
    (∫⁻s,ν ((fun ω=>(F (s,ω)).1) ⁻¹' A) ∂μ)*ν D
  rw [lintegral_congr_ae hs]
  exact lintegral_mul_const _ (measurable_measure_prodMk_left (hA.preimage hF.fst))

end NoThreeLine
#print axioms NoThreeLine.product_restart_of_ae_sections
