import NoThreeLine.CalendarPrefixComparison

/-! Integrate an a.e. future-weight/past-rate comparison over the time
triangle. Measurability is established with a bounded extension of the
running integral, which agrees with the original integral on the phase. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.CalendarIntegral

theorem expected_weighted_triangle_le {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (H η : ℝ) (hH : 0 ≤ H) (hη : 0 < η)
    (w r g : Ω × ℝ → ℝ) (hw : Measurable w) (hr : Measurable r) (hg : Measurable g)
    (A R G : ℝ) (hR : 0 ≤ R)
    (hwb : ∀ x, 0 ≤ w x ∧ w x ≤ A) (hrb : ∀ x, 0 ≤ r x ∧ r x ≤ R)
    (hgb : ∀ x, 0 ≤ g x ∧ g x ≤ G)
    (hc : ∀ᵐ v : ℝ ∂volume, ∀ᵐ u : ℝ ∂volume, v ∈ Ioo 0 H → u ∈ Ioo 0 v →
      (∫ ω, w (ω,v)*r (ω,u) ∂μ) ≤ (∫ ω, g (ω,u) ∂μ)/η) :
    (∫ ω, (∫ v in (0 : ℝ)..H, w (ω,v)*(∫ u in (0 : ℝ)..v, r (ω,u))) ∂μ) ≤
      H/η*(∫ ω, (∫ u in (0 : ℝ)..H, g (ω,u)) ∂μ) := by
  let d : Ω × ℝ → ℝ := fun x => min H (max 0 x.2)
  have hd : Measurable d := measurable_const.min (measurable_const.max measurable_snd)
  have hd0 (x : Ω × ℝ) : 0 ≤ d x := le_min hH (le_max_left _ _)
  let rr : (Ω × ℝ) × ℝ → ℝ := fun x => r (x.1.1,x.2)
  have hrr : Measurable rr := hr.comp (measurable_fst.fst.prodMk measurable_snd)
  let a : Ω × ℝ → ℝ := fun x => ∫ u in (0 : ℝ)..d x, rr (x,u)
  have ha : Measurable a := variable_running_integral_measurable d hd hd0 rr hrr
  have hab (x : Ω × ℝ) : 0 ≤ a x ∧ a x ≤ H*R :=
    integral_initial_segment_bounds (d x) H (hd0 x) (min_le_left _ _) _
      (hr.comp (measurable_const.prodMk measurable_id)) R hR (fun u _ => hrb (x.1,u))
  let f : Ω × ℝ → ℝ := fun x => w x*a x
  have hf : Measurable f := hw.mul ha
  have hfb (x : Ω × ℝ) : 0 ≤ f x ∧ f x ≤ A*(H*R) :=
    ⟨mul_nonneg (hwb x).1 (hab x).1,
      mul_le_mul (hwb x).2 (hab x).2 (hab x).1 ((hwb x).1.trans (hwb x).2)⟩
  have he (ω : Ω) (v : ℝ) (hv : v ∈ Ioo 0 H) :
      f (ω,v) = w (ω,v)*(∫ u in (0 : ℝ)..v, r (ω,u)) := by
    simp only [f,a,d,rr,max_eq_right hv.1.le,min_eq_right hv.2.le]
  have hmean : ∀ᵐ v : ℝ ∂volume, v ∈ Ioo 0 H →
      (∫ ω, f (ω,v) ∂μ) ≤ (∫ ω, (∫ u in (0 : ℝ)..H, g (ω,u)) ∂μ)/η := by
    filter_upwards [hc] with v hv hvI
    have hh := expected_weighted_prefix_le_full μ H v η hvI.1.le hvI.2.le hη
      (fun ω => w (ω,v)) (hw.comp (measurable_id.prodMk measurable_const)) A (fun ω => hwb (ω,v))
      r g hr hg R G hrb hgb (hv.mono (fun u hu => hu hvI))
    have heq : (fun ω => f (ω,v)) = fun ω => w (ω,v)*(∫ u in (0 : ℝ)..v, r (ω,u)) :=
      funext (fun ω => he ω v hvI)
    rw [heq]
    exact hh
  calc
    _ = ∫ ω, (∫ v in (0 : ℝ)..H, f (ω,v)) ∂μ := by
      apply integral_congr_ae
      exact Filter.Eventually.of_forall (fun ω =>
        intervalIntegral.integral_congr_Ioo_of_le hH (fun v hv => (he ω v hv).symm))
    _ ≤ H*((∫ ω, (∫ u in (0 : ℝ)..H, g (ω,u)) ∂μ)/η) :=
      (expected_interval_integral_bounds_ae μ H hH f hf (A*(H*R)) hfb _ hmean).2
    _ = _ := by ring

end NoThreeLine.CalendarIntegral

#print axioms NoThreeLine.CalendarIntegral.expected_weighted_triangle_le
