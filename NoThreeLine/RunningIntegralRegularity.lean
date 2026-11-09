import NoThreeLine.ExponentialRunningIntegral

/-! Measurable variable-horizon running integrals and deterministic bounds. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine

theorem variable_running_integral_measurable {X : Type*} [MeasurableSpace X]
    (A : X→ℝ) (hA : Measurable A) (hA0 : ∀x,0≤A x) (f : X×ℝ→ℝ) (hf : Measurable f) :
    Measurable (fun x=>∫t in (0:ℝ)..A x,f (x,t)) := by
  let g : X×ℝ→ℝ := fun z=>if 0<z.2 ∧ z.2<A z.1 then f z else 0
  have hg : Measurable g := Measurable.ite
    ((measurableSet_lt measurable_const measurable_snd).inter
      (measurableSet_lt measurable_snd (hA.comp measurable_fst))) hf measurable_const
  have hi : Measurable (fun x=>∫t,g (x,t)) := hg.stronglyMeasurable.integral_prod_right'.measurable
  convert hi using 1
  funext x
  rw [intervalIntegral.integral_of_le (hA0 x),integral_Ioc_eq_integral_Ioo]
  simpa only [g,indicator,mem_Ioo] using
    (integral_indicator (μ := volume) (s := Ioo (0:ℝ) (A x)) (f := fun t=>f (x,t)) measurableSet_Ioo).symm

theorem integral_initial_segment_bounds (A T : ℝ) (hA : 0≤A) (hAT : A≤T)
    (S : ℝ→ℝ) (hS : Measurable S) (M : ℝ) (hM : 0≤M)
    (hb : ∀u∈Ioo 0 T,0≤S u ∧ S u≤M) :
    0≤∫u in (0:ℝ)..A,S u ∧ (∫u in (0:ℝ)..A,S u)≤T*M := by
  have hbA (u : ℝ) (hu : u∈Ioo 0 A) := hb u ⟨hu.1,hu.2.trans_le hAT⟩
  have hSi : IntervalIntegrable S volume 0 A :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le hA).mpr
      (BirthWitness.integrableOn_of_nonneg_bound volume (Ioo 0 A) measurableSet_Ioo S hS M hbA)
  constructor
  · rw [intervalIntegral.integral_of_le hA,integral_Ioc_eq_integral_Ioo]
    exact setIntegral_nonneg measurableSet_Ioo (fun u hu=>(hbA u hu).1)
  · calc
      _ ≤ ∫_u in (0:ℝ)..A,M := intervalIntegral.integral_mono_on_of_le_Ioo hA hSi intervalIntegrable_const
        (fun u hu=>(hbA u hu).2)
      _ = A*M := by simp
      _ ≤ T*M := mul_le_mul_of_nonneg_right hAT hM

end NoThreeLine

#print axioms NoThreeLine.variable_running_integral_measurable
#print axioms NoThreeLine.integral_initial_segment_bounds
