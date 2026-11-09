import NoThreeLine.CalendarPrefixComparison

/-! Integrate a two-phase future-weight/past-rate comparison over its
rectangular time domain, using one common point probability throughout. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.CalendarIntegral

theorem expected_weighted_rectangle_le {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (H U η : ℝ) (hH : 0 ≤ H) (hU : 0 ≤ U) (hη : 0 < η)
    (w r g : Ω × ℝ → ℝ) (hw : Measurable w) (hr : Measurable r) (hg : Measurable g)
    (A R G : ℝ) (hR : 0 ≤ R)
    (hwb : ∀ x, 0 ≤ w x ∧ w x ≤ A) (hrb : ∀ x, 0 ≤ r x ∧ r x ≤ R)
    (hgb : ∀ x, 0 ≤ g x ∧ g x ≤ G)
    (hc : ∀ᵐ v : ℝ ∂volume, ∀ᵐ u : ℝ ∂volume, v ∈ Ioo 0 H → u ∈ Ioo 0 U →
      (∫ ω, w (ω,v)*r (ω,u) ∂μ) ≤ (∫ ω, g (ω,u) ∂μ)/η) :
    (∫ ω, (∫ v in (0 : ℝ)..H, w (ω,v)*(∫ u in (0 : ℝ)..U, r (ω,u))) ∂μ) ≤
      H/η*(∫ ω, (∫ u in (0 : ℝ)..U, g (ω,u)) ∂μ) := by
  let a : Ω → ℝ := fun ω => ∫ u in (0 : ℝ)..U, r (ω,u)
  have ha : Measurable a := variable_running_integral_measurable (fun _ : Ω => U) measurable_const
    (fun _ => hU) r hr
  have hab (ω : Ω) : 0 ≤ a ω ∧ a ω ≤ U*R :=
    integral_initial_segment_bounds U U hU le_rfl _
      (hr.comp (measurable_const.prodMk measurable_id)) R hR (fun u _ => hrb (ω,u))
  let f : Ω × ℝ → ℝ := fun x => w x*a x.1
  have hf : Measurable f := hw.mul (ha.comp measurable_fst)
  have hfb (x : Ω × ℝ) : 0 ≤ f x ∧ f x ≤ A*(U*R) :=
    ⟨mul_nonneg (hwb x).1 (hab x.1).1,
      mul_le_mul (hwb x).2 (hab x.1).2 (hab x.1).1 ((hwb x).1.trans (hwb x).2)⟩
  have hmean : ∀ᵐ v : ℝ ∂volume, v ∈ Ioo 0 H →
      (∫ ω, f (ω,v) ∂μ) ≤ (∫ ω, (∫ u in (0 : ℝ)..U, g (ω,u)) ∂μ)/η := by
    filter_upwards [hc] with v hv hvI
    exact expected_weighted_prefix_le_full μ U U η hU le_rfl hη
      (fun ω => w (ω,v)) (hw.comp (measurable_id.prodMk measurable_const)) A (fun ω => hwb (ω,v))
      r g hr hg R G hrb hgb (hv.mono (fun u hu => hu hvI))
  calc
    _ ≤ H*((∫ ω, (∫ u in (0 : ℝ)..U, g (ω,u)) ∂μ)/η) :=
      (expected_interval_integral_bounds_ae μ H hH f hf (A*(U*R)) hfb _ hmean).2
    _ = _ := by ring

end NoThreeLine.CalendarIntegral

#print axioms NoThreeLine.CalendarIntegral.expected_weighted_rectangle_le
