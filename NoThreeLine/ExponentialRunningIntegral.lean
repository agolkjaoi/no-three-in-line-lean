import NoThreeLine.WitnessMeanBounds
import NoThreeLine.ExponentialFirstStep
import Mathlib.MeasureTheory.Integral.Prod

/-! Fubini/survival identity for the actual elapsed-time source integral.
Only measurability and a finite bound on the deterministic source are used. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set

namespace NoThreeLine

theorem running_integral_indicator (T w : ℝ) (S : ℝ→ℝ) :
    (∫u in (0:ℝ)..max 0 (min T w),S u)=∫u in Ioo 0 T,if u<w then S u else 0 := by
  have hset : Iio w ∩ Ioo 0 T=Ioo 0 (min T w) := by
    ext u
    simp only [mem_inter_iff,mem_Iio,mem_Ioo,lt_min_iff]
    tauto
  change _=∫u in Ioo 0 T,(Iio w).indicator S u
  rw [integral_indicator measurableSet_Iio,Measure.restrict_restrict measurableSet_Iio,hset]
  by_cases hm : 0≤min T w
  · rw [max_eq_right hm,intervalIntegral.integral_of_le hm,integral_Ioc_eq_integral_Ioo]
  · rw [max_eq_left (le_of_not_ge hm)]
    simp only [intervalIntegral.integral_same]
    rw [Ioo_eq_empty_of_le (le_of_not_ge hm),Measure.restrict_empty,integral_zero_measure]

theorem running_integral_measurable (T : ℝ) (S : ℝ→ℝ) (hS : Measurable S) :
    Measurable (fun w=>∫u in (0:ℝ)..max 0 (min T w),S u) := by
  have hf : Measurable (fun p : ℝ×ℝ=>if p.2<p.1 then S p.2 else 0) :=
    Measurable.ite (measurableSet_lt measurable_snd measurable_fst) (hS.comp measurable_snd) measurable_const
  simpa only [running_integral_indicator] using
    (hf.stronglyMeasurable.integral_prod_right' (ν := volume.restrict (Ioo 0 T))).measurable

theorem exponential_running_integral (rate T : ℝ) (hr : 0<rate) (hT : 0≤T)
    (S : ℝ→ℝ) (hS : Measurable S) (M : ℝ) (hM : 0≤M)
    (hb : ∀u∈Ioo 0 T,0≤S u ∧ S u≤M) :
    (∫w,(∫u in (0:ℝ)..max 0 (min T w),S u) ∂expMeasure rate)=
      ∫u in (0:ℝ)..T,Real.exp (-(rate*u))*S u := by
  letI := isProbabilityMeasure_expMeasure hr
  let ν : Measure ℝ := volume.restrict (Ioo 0 T)
  let c : ℝ→ℝ := (Ioo 0 T).indicator S
  have hc : Measurable c := hS.indicator measurableSet_Ioo
  have hcb (u : ℝ) : 0≤c u ∧ c u≤M := by
    by_cases hu : u∈Ioo 0 T
    · simpa only [c,indicator_of_mem hu] using hb u hu
    · simp only [c,indicator_of_notMem hu]
      exact ⟨le_rfl,hM⟩
  have hf : Measurable (fun p : ℝ×ℝ=>if p.2<p.1 then c p.2 else 0) :=
    Measurable.ite (measurableSet_lt measurable_snd measurable_fst) (hc.comp measurable_snd) measurable_const
  have hfi : Integrable (fun p : ℝ×ℝ=>if p.2<p.1 then c p.2 else 0) ((expMeasure rate).prod ν) := by
    apply GenericCreditIteration.bounded_nonnegative_integrable _ _ hf M
    intro p
    split_ifs
    · exact hcb p.2
    · exact ⟨le_rfl,hM⟩
  have hcut (w : ℝ) : (∫u in Ioo 0 T,if u<w then c u else 0)=
      ∫u in Ioo 0 T,if u<w then S u else 0 := by
    apply setIntegral_congr_fun measurableSet_Ioo
    intro u hu
    simp only [c,indicator_of_mem hu]
  calc
    _ = ∫w,(∫u,(if u<w then c u else 0) ∂ν) ∂expMeasure rate := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (fun w=>(running_integral_indicator T w S).trans (hcut w).symm)
    _ = ∫u,(∫w,(if u<w then c u else 0) ∂expMeasure rate) ∂ν := integral_integral_swap hfi
    _ = ∫u in Ioo 0 T,Real.exp (-(rate*u))*S u := by
      apply setIntegral_congr_fun measurableSet_Ioo
      intro u hu
      change (∫w,(Ioi u).indicator (fun _=>c u) w ∂expMeasure rate)=_
      rw [integral_indicator measurableSet_Ioi,setIntegral_const,smul_eq_mul,
        expMeasure_real_Ioi rate u hr hu.1.le]
      simp only [c,indicator_of_mem hu]
    _ = _ := by rw [intervalIntegral.integral_of_le hT,integral_Ioc_eq_integral_Ioo]

end NoThreeLine

#print axioms NoThreeLine.running_integral_indicator
#print axioms NoThreeLine.exponential_running_integral
