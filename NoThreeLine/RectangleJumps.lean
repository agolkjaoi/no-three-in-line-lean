import NoThreeLine.JumpEnvelope

set_option autoImplicit false
open Set MeasureTheory
noncomputable section

namespace NoThreeLine
namespace Rect

def bottomEdge (R : Rect) (w : ℝ) : HEdge := ⟨R.x0,R.x1,R.y0,w⟩
def topEdge (R : Rect) (w : ℝ) : HEdge := ⟨R.x0,R.x1,R.y1,-w⟩

/-- Rectangle indicators are the difference of their two actual horizontal
steps. Only the upper horizontal boundary is an exceptional set. -/
theorem field_eq_horizontal_edges (R : Rect) (w x y : ℝ)
    (hR : R.y0 ≤ R.y1) (hy : y ≠ R.y1) :
    R.field w x y = (R.bottomEdge w).field x y + (R.topEdge w).field x y := by
  classical
  by_cases ha : R.x0 < x
  · by_cases hb : x < R.x1
    · by_cases hc : R.y0 < y
      · by_cases hd : y < R.y1
        · have he : ¬R.y1 < y := by linarith
          simp [Rect.field, Rect.contains, bottomEdge, topEdge, HEdge.field, ha,hb,hc,hd,he]
        · have he : R.y1 < y := lt_of_le_of_ne (le_of_not_gt hd) (Ne.symm hy)
          simp [Rect.field, Rect.contains, bottomEdge, topEdge, HEdge.field, ha,hb,hc,hd,he]
      · have he : ¬R.y1 < y := by intro hh; apply hc; linarith
        simp [Rect.field, Rect.contains, bottomEdge, topEdge, HEdge.field, ha,hb,hc,he]
    · simp [Rect.field, Rect.contains, bottomEdge, topEdge, HEdge.field, hb]
  · simp [Rect.field, Rect.contains, bottomEdge, topEdge, HEdge.field, ha]

theorem line_eq_horizontal_edges_ae (R : Rect) (w v u : ℝ)
    (hR : R.y0 ≤ R.y1) (hu : 0 < u) :
    (fun t => R.field w t (v+u*t)) =ᵐ[volume]
      (fun t => (R.bottomEdge w).field t (v+u*t) + (R.topEdge w).field t (v+u*t)) := by
  filter_upwards [(Set.finite_singleton ((R.y1-v)/u)).countable.ae_notMem volume] with t ht
  apply R.field_eq_horizontal_edges w t (v+u*t) hR
  intro he
  apply ht
  apply Set.mem_singleton_iff.mpr
  apply (eq_div_iff hu.ne').mpr
  nlinarith

theorem chord_eq_horizontal_edges (R : Rect) (w v u : ℝ)
    (hR : R.y0 ≤ R.y1) (hu : 0 < u) :
    R.chord w v u = (R.bottomEdge w).chord v u + (R.topEdge w).chord v u := by
  unfold Rect.chord
  rw [integral_congr_ae (R.line_eq_horizontal_edges_ae w v u hR hu),
    integral_add ((R.bottomEdge w).line_integrable v u hu)
      ((R.topEdge w).line_integrable v u hu)]
  rfl

end Rect

theorem rectangleField_chord_eq_horizontal_edges {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (v u : ℝ)
    (hR : ∀ i ∈ S, (R i).y0 ≤ (R i).y1) (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) =
      ∑ i ∈ S, (((R i).bottomEdge (w i)).chord v u + ((R i).topEdge (w i)).chord v u) := by
  unfold rectangleField
  rw [integral_finsetSum S (fun i _ => (R i).field_on_line_integrable (w i) v u hu)]
  exact Finset.sum_congr rfl fun i hi => (R i).chord_eq_horizontal_edges (w i) v u (hR i hi) hu

/-- This ungrouped upper bound follows directly from the rectangles. Combining
equal edges into their signed total jump can make the bound sharper. -/
theorem rectangleField_horizontal_band_upper {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (l h v u : ℝ)
    (hR : ∀ i ∈ S, (R i).y0 ≤ (R i).y1) (hu : 0 < u)
    (hlv : l ≤ v) (hvh : v ≤ h) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) ≤
      (∫ t : ℝ, rectangleField S R w t (l+u*t)) +
      ∑ i ∈ S,
        (max 0 (w i) * ((R i).bottomEdge (w i)).bandLength l h u +
         max 0 (-w i) * ((R i).topEdge (w i)).bandLength l h u) := by
  rw [rectangleField_chord_eq_horizontal_edges S R w v u hR hu,
    rectangleField_chord_eq_horizontal_edges S R w l u hR hu,
    ← Finset.sum_add_distrib]
  apply Finset.sum_le_sum
  intro i hi
  have hb := ((R i).bottomEdge (w i)).chord_band_upper l h v u hu hlv hvh
  have ht := ((R i).topEdge (w i)).chord_band_upper l h v u hu hlv hvh
  change _ ≤ _ + max 0 (w i) * _ at hb
  change _ ≤ _ + max 0 (-w i) * _ at ht
  linarith

end NoThreeLine

#print axioms NoThreeLine.Rect.chord_eq_horizontal_edges
#print axioms NoThreeLine.rectangleField_horizontal_band_upper
