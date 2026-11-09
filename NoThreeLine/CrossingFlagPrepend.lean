import NoThreeLine.ScheduledCrossingStageWeight

/-! Compose a first crossing bit with the crossing bit of a suffix.
On the first-hit branch the suffix only transports a harmonic value;
on the other branch it uses the suffix estimate. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory
namespace NoThreeLine

theorem crossingFlagValue_prepend_sections_le {W S : Type*}
    [MeasurableSpace W] [MeasurableSpace S] (μ : Measure W) [IsProbabilityMeasure μ]
    (F : W→S×Bool) (G : W×W→S×Bool) (hF : Measurable F) (hG : Measurable G)
    (V : S→ℝ) (hV : Measurable V) (c C : ℝ) (hc : 0≤c ∧ c≤C) (hC : ∀ s,0≤V s ∧ V s≤C)
    (hfirst : (∫w,crossingFlagValue c (F w).2 ∂μ)≤∫w,crossingFlagValue (V (F w).1) (F w).2 ∂μ)
    (hmean : ∀w,(∫v,V (G (w,v)).1 ∂μ)=V (F w).1)
    (htail : ∀w,(∫v,crossingFlagValue c (G (w,v)).2 ∂μ)≤
      ∫v,crossingFlagValue (V (G (w,v)).1) (G (w,v)).2 ∂μ) :
    (∫w,∫v,crossingFlagValue c ((F w).2 || (G (w,v)).2) ∂μ ∂μ)≤
      ∫w,∫v,crossingFlagValue (V (G (w,v)).1) ((F w).2 || (G (w,v)).2) ∂μ ∂μ := by
  let H := fun x : W×W=>(F x.1).2 || (G x).2
  have hH : Measurable H :=
    (measurable_of_countable (fun x : Bool×Bool=>x.1 || x.2)).comp
      ((hF.snd.comp measurable_fst).prodMk hG.snd)
  let f := fun x : W×W=>crossingFlagValue c (H x)
  let g := fun x : W×W=>crossingFlagValue (V (G x).1) (H x)
  let f₀ := fun w=>crossingFlagValue c (F w).2
  let g₀ := fun w=>crossingFlagValue (V (F w).1) (F w).2
  have hf : Measurable f := crossingFlagValue_measurable.comp (measurable_const.prodMk hH)
  have hg : Measurable g := crossingFlagValue_measurable.comp ((hV.comp hG.fst).prodMk hH)
  have hf₀ : Measurable f₀ := crossingFlagValue_measurable.comp (measurable_const.prodMk hF.snd)
  have hg₀ : Measurable g₀ := crossingFlagValue_measurable.comp ((hV.comp hF.fst).prodMk hF.snd)
  have hfi := (GenericCreditIteration.bounded_nonnegative_integrable (μ.prod μ) f hf C
    (fun x=>crossingFlagValue_bounds hc (H x))).integral_prod_left
  have hgi := (GenericCreditIteration.bounded_nonnegative_integrable (μ.prod μ) g hg C
    (fun x=>crossingFlagValue_bounds (hC (G x).1) (H x))).integral_prod_left
  have hf₀i := GenericCreditIteration.bounded_nonnegative_integrable μ f₀ hf₀ C
    (fun w=>crossingFlagValue_bounds hc (F w).2)
  have hg₀i := GenericCreditIteration.bounded_nonnegative_integrable μ g₀ hg₀ C
    (fun w=>crossingFlagValue_bounds (hC (F w).1) (F w).2)
  have hp (w : W) : (∫v,f (w,v) ∂μ)-f₀ w≤(∫v,g (w,v) ∂μ)-g₀ w := by
    cases hb : (F w).2
    · simpa [f,g,f₀,g₀,H,hb,crossingFlagValue] using htail w
    · simp only [f,g,f₀,g₀,H,hb,Bool.true_or,crossingFlagValue,ite_true]
      rw [hmean]
      simp
  have hdiff := integral_mono (hfi.sub hf₀i) (hgi.sub hg₀i) hp
  change (∫ w,(∫ v,f (w,v) ∂μ)-f₀ w ∂μ)≤∫ w,(∫ v,g (w,v) ∂μ)-g₀ w ∂μ at hdiff
  rw [integral_sub hfi hf₀i,integral_sub hgi hg₀i] at hdiff
  change (∫w,f₀ w ∂μ)≤∫w,g₀ w ∂μ at hfirst
  change (∫ w,∫ v,f (w,v) ∂μ ∂μ)≤∫ w,∫ v,g (w,v) ∂μ ∂μ
  linarith

end NoThreeLine

#print axioms NoThreeLine.crossingFlagValue_prepend_sections_le

