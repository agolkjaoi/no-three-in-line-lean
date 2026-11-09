import NoThreeLine.RunningIntegralRegularity
import NoThreeLine.SavedCreditMeasure

/-! Bounded weighted Fubini for a real elapsed running integral. A
separate application must supply the actual weighted survival function;
this analytic identity assumes no stochastic compensation law. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

theorem weighted_running_integral {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (T : ℝ) (hT : 0≤T)
    (wait Z : Ω→ℝ) (S : ℝ→ℝ) (hw : Measurable wait) (hZ : Measurable Z) (hS : Measurable S)
    (A B : ℝ) (hA : 0≤A) (hB : 0≤B) (hZb : ∀ω,0≤Z ω ∧ Z ω≤A)
    (hSb : ∀u∈Ioo 0 T,0≤S u ∧ S u≤B) :
    (∫ω,Z ω*(∫u in (0:ℝ)..max 0 (min T (wait ω)),S u) ∂μ)=
      ∫u in (0:ℝ)..T,(∫ω,(if u<wait ω then Z ω else 0) ∂μ)*S u := by
  let ν : Measure ℝ := volume.restrict (Ioo 0 T)
  let c : ℝ→ℝ := (Ioo 0 T).indicator S
  have hc : Measurable c := hS.indicator measurableSet_Ioo
  have hcb (u : ℝ) : 0≤c u ∧ c u≤B := by
    by_cases hu : u∈Ioo 0 T
    · simpa only [c,indicator_of_mem hu] using hSb u hu
    · simp only [c,indicator_of_notMem hu]
      exact ⟨le_rfl,hB⟩
  let f : Ω×ℝ→ℝ := fun z=>if z.2<wait z.1 then Z z.1*c z.2 else 0
  have hfm : Measurable f := Measurable.ite
    (measurableSet_lt measurable_snd (hw.comp measurable_fst))
    ((hZ.comp measurable_fst).mul (hc.comp measurable_snd)) measurable_const
  have hfi : Integrable f (μ.prod ν) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ hfm (A*B)
    intro z
    dsimp only [f]
    split_ifs
    · exact ⟨mul_nonneg (hZb z.1).1 (hcb z.2).1,
        mul_le_mul (hZb z.1).2 (hcb z.2).2 (hcb z.2).1 hA⟩
    · exact ⟨le_rfl,mul_nonneg hA hB⟩
  have hpath (ω : Ω) : Z ω*(∫u in (0:ℝ)..max 0 (min T (wait ω)),S u)=∫u,f (ω,u) ∂ν := by
    rw [running_integral_indicator,←integral_const_mul]
    apply setIntegral_congr_fun measurableSet_Ioo
    intro u hu
    simp only [f,c,indicator_of_mem hu]
    split_ifs <;> simp
  calc
    _ = ∫ω,(∫u,f (ω,u) ∂ν) ∂μ := integral_congr_ae (ae_of_all _ hpath)
    _ = ∫u,(∫ω,f (ω,u) ∂μ) ∂ν := integral_integral_swap hfi
    _ = ∫u in Ioo 0 T,(∫ω,(if u<wait ω then Z ω else 0) ∂μ)*S u := by
      apply setIntegral_congr_fun measurableSet_Ioo
      intro u hu
      dsimp only
      rw [←integral_mul_const]
      apply integral_congr_ae
      exact ae_of_all _ (fun ω=>by simp only [f,c,indicator_of_mem hu]; split_ifs <;> simp)
    _ = _ := by rw [intervalIntegral.integral_of_le hT,integral_Ioc_eq_integral_Ioo]

theorem savedCreditMeasure_running_integral {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (T : ℝ) (hT : 0≤T)
    (wait Z : Ω→ℝ) (S : ℝ→ℝ) (hw : Measurable wait) (hZ : Measurable Z) (hS : Measurable S)
    (A B : ℝ) (hA : 0≤A) (hB : 0≤B) (hZb : ∀ω,0≤Z ω ∧ Z ω≤A)
    (hSb : ∀u∈Ioo 0 T,0≤S u ∧ S u≤B) :
    (∫ω,(∫u in (0:ℝ)..max 0 (min T (wait ω)),S u) ∂savedCreditMeasure μ Z)=
      ∫u in (0:ℝ)..T,(∫ω,(if u<wait ω then Z ω else 0) ∂μ)*S u := by
  rw [savedCreditMeasure_integral μ Z hZ (fun ω=>(hZb ω).1)]
  exact weighted_running_integral μ T hT wait Z S hw hZ hS A B hA hB hZb hSb

end NoThreeLine

#print axioms NoThreeLine.weighted_running_integral
#print axioms NoThreeLine.savedCreditMeasure_running_integral
