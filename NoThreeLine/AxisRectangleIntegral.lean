import NoThreeLine.AngularChartsBV

/-! Exact actual axis integrals. Open transverse bands, including their zero
boundary value for a single cell, are retained explicitly. This is separate
from the positive-slope corner checker. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine

theorem Rect.horizontal_integral_eq (R : Rect) (w y : ℝ) :
    (∫ t : ℝ, R.field w t y) =
      if R.y0<y ∧ y<R.y1 then max 0 (R.x1-R.x0)*w else 0 := by
  by_cases hy : R.y0<y ∧ y<R.y1
  · have he : (fun t : ℝ=>R.field w t y)=(Ioo R.x0 R.x1).indicator (fun _=>w) := by
      funext t
      simp [Rect.field,Rect.contains,Set.indicator_apply,hy.1,hy.2]
    rw [he,if_pos hy,integral_indicator_const w measurableSet_Ioo]
    simp only [Real.volume_real_Ioo,smul_eq_mul,max_comm]
  · have he : (fun t : ℝ=>R.field w t y)=fun _=>0 := by
      funext t
      have hn : ¬R.contains t y := fun h=>hy ⟨h.2.2.1,h.2.2.2⟩
      simp [Rect.field,hn]
    rw [he,if_neg hy]
    simp

theorem Rect.vertical_integrable (R : Rect) (w x : ℝ) :
    Integrable (fun t : ℝ=>R.field w x t) := by
  simpa only [Rect.field_swapXY] using R.swapXY.horizontal_integrable w x

theorem Rect.vertical_integral_eq (R : Rect) (w x : ℝ) :
    (∫ t : ℝ, R.field w x t) =
      if R.x0<x ∧ x<R.x1 then max 0 (R.y1-R.y0)*w else 0 := by
  have h := R.swapXY.horizontal_integral_eq w x
  simp only [Rect.field_swapXY] at h
  simpa only [Rect.swapXY] using h

theorem rectangleField_horizontal_integral_eq {ι : Type*} (S : Finset ι)
    (R : ι→Rect) (w : ι→ℝ) (y : ℝ) :
    (∫ t : ℝ, rectangleField S R w t y) =
      ∑ i∈S, if (R i).y0<y ∧ y<(R i).y1 then max 0 ((R i).x1-(R i).x0)*w i else 0 := by
  unfold rectangleField
  rw [integral_finsetSum S (fun i _=>(R i).horizontal_integrable (w i) y)]
  apply Finset.sum_congr rfl
  intro i _
  exact (R i).horizontal_integral_eq (w i) y

theorem rectangleField_vertical_integral_eq {ι : Type*} (S : Finset ι)
    (R : ι→Rect) (w : ι→ℝ) (x : ℝ) :
    (∫ t : ℝ, rectangleField S R w x t) =
      ∑ i∈S, if (R i).x0<x ∧ x<(R i).x1 then max 0 ((R i).y1-(R i).y0)*w i else 0 := by
  unfold rectangleField
  rw [integral_finsetSum S (fun i _=>(R i).vertical_integrable (w i) x)]
  apply Finset.sum_congr rfl
  intro i _
  exact (R i).vertical_integral_eq (w i) x

end NoThreeLine
#print axioms NoThreeLine.rectangleField_horizontal_integral_eq
#print axioms NoThreeLine.rectangleField_vertical_integral_eq
