import NoThreeLine.CalendarIntegralFubini

/-! An almost-everywhere calendar bound on the mean of an actual bounded
observable controls its expected time integral. The strong bound is only
required on the open time interval; endpoint null sets are kept explicit. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.CalendarIntegral

theorem expected_interval_integral_bounds_ae {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (H : ℝ) (hH : 0 ≤ H)
    (f : Ω × ℝ → ℝ) (hf : Measurable f) (A : ℝ)
    (hb : ∀ x, 0 ≤ f x ∧ f x ≤ A) (C : ℝ)
    (hc : ∀ᵐ t : ℝ ∂volume, t ∈ Ioo 0 H → (∫ ω, f (ω,t) ∂μ) ≤ C) :
    0 ≤ (∫ ω, (∫ t in (0 : ℝ)..H, f (ω,t)) ∂μ) ∧
    (∫ ω, (∫ t in (0 : ℝ)..H, f (ω,t)) ∂μ) ≤ H*C := by
  rw [expected_interval_integral_swap μ H hH f hf A hb]
  let g := fun t : ℝ => ∫ ω, f (ω,t) ∂μ
  have hg : Measurable g :=
    (hf.comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable
  have hgb (t : ℝ) : 0 ≤ g t ∧ g t ≤ A := by
    have hi := GenericCreditIteration.bounded_nonnegative_integrable μ (fun ω => f (ω,t))
      (hf.comp (measurable_id.prodMk measurable_const)) A (fun ω => hb (ω,t))
    refine ⟨integral_nonneg (fun ω => (hb (ω,t)).1), ?_⟩
    simpa only [integral_const, probReal_univ, one_smul] using
      integral_mono hi (integrable_const A) (fun ω => (hb (ω,t)).2)
  have hi : IntegrableOn g (Ioo 0 H) volume :=
    BirthWitness.integrableOn_of_nonneg_bound volume (Ioo 0 H) measurableSet_Ioo g hg A
      (fun t _ => hgb t)
  constructor
  · exact intervalIntegral.integral_nonneg hH (fun t _ => (hgb t).1)
  · rw [intervalIntegral.integral_of_le hH, integral_Ioc_eq_integral_Ioo]
    calc
      (∫ t in Ioo 0 H, g t) ≤ ∫ _t in Ioo 0 H, C :=
        integral_mono_ae hi (integrable_const C) ((ae_restrict_iff' measurableSet_Ioo).mpr hc)
      _ = H*C := by
        rw [←integral_Ioc_eq_integral_Ioo, ←intervalIntegral.integral_of_le hH,
          intervalIntegral.integral_const]
        simp only [sub_zero, smul_eq_mul]

end NoThreeLine.CalendarIntegral

#print axioms NoThreeLine.CalendarIntegral.expected_interval_integral_bounds_ae
