import NoThreeLine.CalendarMeanBound

/-! A two-time mean comparison controls a bounded future weight times the
past running integral. Only a.e. comparisons on the open time interval are
needed; the diagonal integral can be enlarged to the whole phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.CalendarIntegral

theorem bounded_calendar_mean {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (f : Ω × ℝ → ℝ) (hf : Measurable f)
    (A : ℝ) (hb : ∀ x, 0 ≤ f x ∧ f x ≤ A) :
    Measurable (fun t => ∫ ω, f (ω,t) ∂μ) ∧
      ∀ t, 0 ≤ (∫ ω, f (ω,t) ∂μ) ∧ (∫ ω, f (ω,t) ∂μ) ≤ A := by
  refine ⟨(hf.comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable,?_⟩
  intro t
  have hi := GenericCreditIteration.bounded_nonnegative_integrable μ (fun ω => f (ω,t))
    (hf.comp (measurable_id.prodMk measurable_const)) A (fun ω => hb (ω,t))
  refine ⟨integral_nonneg (fun ω => (hb (ω,t)).1),?_⟩
  simpa only [integral_const,probReal_univ,one_smul] using
    integral_mono hi (integrable_const A) (fun ω => (hb (ω,t)).2)

theorem expected_weighted_prefix_le_full {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (H v η : ℝ) (hv : 0 ≤ v) (hvH : v ≤ H) (hη : 0 < η)
    (w : Ω → ℝ) (hw : Measurable w) (A : ℝ) (hwb : ∀ ω, 0 ≤ w ω ∧ w ω ≤ A)
    (r g : Ω × ℝ → ℝ) (hr : Measurable r) (hg : Measurable g)
    (R G : ℝ) (hrb : ∀ x, 0 ≤ r x ∧ r x ≤ R) (hgb : ∀ x, 0 ≤ g x ∧ g x ≤ G)
    (hc : ∀ᵐ u : ℝ ∂volume, u ∈ Ioo 0 v →
      (∫ ω, w ω*r (ω,u) ∂μ) ≤ (∫ ω, g (ω,u) ∂μ)/η) :
    (∫ ω, w ω*(∫ u in (0 : ℝ)..v, r (ω,u)) ∂μ) ≤
      (∫ ω, (∫ u in (0 : ℝ)..H, g (ω,u)) ∂μ)/η := by
  let f : Ω × ℝ → ℝ := fun x => w x.1*r x
  have hf : Measurable f := (hw.comp measurable_fst).mul hr
  have hfb (x : Ω × ℝ) : 0 ≤ f x ∧ f x ≤ A*R :=
    ⟨mul_nonneg (hwb x.1).1 (hrb x).1,
      mul_le_mul (hwb x.1).2 (hrb x).2 (hrb x).1 ((hwb x.1).1.trans (hwb x.1).2)⟩
  let mf := fun u => ∫ ω, f (ω,u) ∂μ
  let mg := fun u => ∫ ω, g (ω,u) ∂μ
  have hmf := bounded_calendar_mean μ f hf (A*R) hfb
  have hmg := bounded_calendar_mean μ g hg G hgb
  have hmi : IntegrableOn mf (Ioo 0 v) volume :=
    BirthWitness.integrableOn_of_nonneg_bound volume (Ioo 0 v) measurableSet_Ioo _ hmf.1 (A*R)
      (fun u _ => hmf.2 u)
  have hgi : IntegrableOn (fun u => mg u/η) (Ioo 0 v) volume :=
    BirthWitness.integrableOn_of_nonneg_bound volume (Ioo 0 v) measurableSet_Ioo _ (hmg.1.div_const η) (G/η)
      (fun u _ => ⟨div_nonneg (hmg.2 u).1 hη.le,div_le_div_of_nonneg_right (hmg.2 u).2 hη.le⟩)
  have hgiH : IntervalIntegrable mg volume 0 H :=
    (intervalIntegrable_iff_integrableOn_Ioo_of_le (hv.trans hvH)).mpr
      (BirthWitness.integrableOn_of_nonneg_bound volume (Ioo 0 H) measurableSet_Ioo _ hmg.1 G
        (fun u _ => hmg.2 u))
  calc
    _ = ∫ ω, (∫ u in (0 : ℝ)..v, f (ω,u)) ∂μ := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (fun ω => (intervalIntegral.integral_const_mul _ _).symm)
    _ = ∫ u in (0 : ℝ)..v, mf u := expected_interval_integral_swap μ v hv f hf (A*R) hfb
    _ ≤ ∫ u in (0 : ℝ)..v, mg u/η := by
      simp_rw [intervalIntegral.integral_of_le hv,integral_Ioc_eq_integral_Ioo]
      exact integral_mono_ae hmi hgi ((ae_restrict_iff' measurableSet_Ioo).mpr hc)
    _ = (∫ u in (0 : ℝ)..v, mg u)/η := intervalIntegral.integral_div η mg
    _ ≤ (∫ u in (0 : ℝ)..H, mg u)/η := div_le_div_of_nonneg_right
      (intervalIntegral.integral_mono_interval le_rfl hv hvH
        (Filter.Eventually.of_forall (fun u => (hmg.2 u).1)) hgiH) hη.le
    _ = _ := by rw [expected_interval_integral_swap μ H (hv.trans hvH) g hg G hgb]

end NoThreeLine.CalendarIntegral

#print axioms NoThreeLine.CalendarIntegral.expected_weighted_prefix_le_full
