import NoThreeLine.CalendarRectangleComparison

/-! Swap the two calendar a.e. quantifiers only after proving joint
measurability of the integrated comparison event. No time regularity of an
arbitrary family of history tests is silently assumed. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.CalendarIntegral

theorem weighted_time_comparison_commute {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsFiniteMeasure μ] (H U η : ℝ)
    (w r g : Ω × ℝ → ℝ) (hw : Measurable w) (hr : Measurable r) (hg : Measurable g)
    (hc : ∀ᵐ u : ℝ ∂volume, ∀ᵐ v : ℝ ∂volume, u ∈ Ioo 0 U → v ∈ Ioo 0 H →
      (∫ ω, w (ω,v)*r (ω,u) ∂μ) ≤ (∫ ω, g (ω,u) ∂μ)/η) :
    ∀ᵐ v : ℝ ∂volume, ∀ᵐ u : ℝ ∂volume, v ∈ Ioo 0 H → u ∈ Ioo 0 U →
      (∫ ω, w (ω,v)*r (ω,u) ∂μ) ≤ (∫ ω, g (ω,u) ∂μ)/η := by
  let f : (ℝ × ℝ) × Ω → ℝ := fun x => w (x.2,x.1.2)*r (x.2,x.1.1)
  have hf : Measurable f := (hw.comp (measurable_snd.prodMk measurable_fst.snd)).mul
    (hr.comp (measurable_snd.prodMk measurable_fst.fst))
  let left : ℝ × ℝ → ℝ := fun x => ∫ ω, f (x,ω) ∂μ
  have hl : Measurable left := hf.stronglyMeasurable.integral_prod_right'.measurable
  let right : ℝ × ℝ → ℝ := fun x => (∫ ω, g (ω,x.1) ∂μ)/η
  have hm : Measurable (fun u => ∫ ω, g (ω,u) ∂μ) :=
    (hg.comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable
  have hrgt : Measurable right := (hm.comp measurable_fst).div_const η
  have hU : MeasurableSet {x : ℝ × ℝ | x.1 ∈ Ioo 0 U} :=
    (measurableSet_Ioo : MeasurableSet (Ioo (0 : ℝ) U)).preimage measurable_fst
  have hH : MeasurableSet {x : ℝ × ℝ | x.2 ∈ Ioo 0 H} :=
    (measurableSet_Ioo : MeasurableSet (Ioo (0 : ℝ) H)).preimage measurable_snd
  have hP : MeasurableSet {x : ℝ × ℝ | x.1 ∈ Ioo 0 U → x.2 ∈ Ioo 0 H → left x ≤ right x} := by
    convert hU.compl.union (hH.compl.union (measurableSet_le hl hrgt)) using 1
    ext x
    simp only [mem_setOf_eq,mem_union,mem_compl_iff,imp_iff_not_or]
  have hh := (Measure.ae_ae_comm hP).mp hc
  exact hh.mono (fun v hv => hv.mono (fun u hu hvI huI => hu huI hvI))

theorem expected_weighted_rectangle_le_old_first {Ω : Type*} [MeasurableSpace Ω]
    (μ : Measure Ω) [IsProbabilityMeasure μ] (H U η : ℝ) (hH : 0 ≤ H) (hU : 0 ≤ U) (hη : 0 < η)
    (w r g : Ω × ℝ → ℝ) (hw : Measurable w) (hr : Measurable r) (hg : Measurable g)
    (A R G : ℝ) (hR : 0 ≤ R)
    (hwb : ∀ x, 0 ≤ w x ∧ w x ≤ A) (hrb : ∀ x, 0 ≤ r x ∧ r x ≤ R)
    (hgb : ∀ x, 0 ≤ g x ∧ g x ≤ G)
    (hc : ∀ᵐ u : ℝ ∂volume, ∀ᵐ v : ℝ ∂volume, u ∈ Ioo 0 U → v ∈ Ioo 0 H →
      (∫ ω, w (ω,v)*r (ω,u) ∂μ) ≤ (∫ ω, g (ω,u) ∂μ)/η) :
    (∫ ω, (∫ v in (0 : ℝ)..H, w (ω,v)*(∫ u in (0 : ℝ)..U, r (ω,u))) ∂μ) ≤
      H/η*(∫ ω, (∫ u in (0 : ℝ)..U, g (ω,u)) ∂μ) :=
  expected_weighted_rectangle_le μ H U η hH hU hη w r g hw hr hg A R G hR hwb hrb hgb
    (weighted_time_comparison_commute μ H U η w r g hw hr hg hc)

end NoThreeLine.CalendarIntegral

#print axioms NoThreeLine.CalendarIntegral.weighted_time_comparison_commute
#print axioms NoThreeLine.CalendarIntegral.expected_weighted_rectangle_le_old_first
