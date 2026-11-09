import NoThreeLine.Rectangle
import Mathlib.MeasureTheory.Measure.Prod

/-! Actual two-dimensional Lebesgue integrals of finite rectangle fields.
Finite vertical/horizontal boundary erasure preserves area integrals. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section
namespace NoThreeLine

def Rect.area (R : Rect) : ℝ := max 0 (R.x1-R.x0)*max 0 (R.y1-R.y0)

theorem Rect.field_on_plane (R : Rect) (w : ℝ) :
    (fun z : ℝ × ℝ => R.field w z.1 z.2) =
      (Ioo R.x0 R.x1 ×ˢ Ioo R.y0 R.y1).indicator (fun _ => w) := by
  funext z
  simp [Rect.field,Rect.contains,Set.indicator_apply,and_assoc]

theorem Rect.field_plane_integrable (R : Rect) (w : ℝ) :
    Integrable (fun z : ℝ × ℝ => R.field w z.1 z.2) := by
  rw [R.field_on_plane,integrable_indicator_iff (measurableSet_Ioo.prod measurableSet_Ioo)]
  exact integrableOn_const (by
    simp only [Measure.volume_eq_prod,Measure.prod_prod,Real.volume_Ioo]
    exact ENNReal.mul_ne_top (by simp) (by simp))

theorem Rect.field_plane_integral (R : Rect) (w : ℝ) :
    (∫ z : ℝ × ℝ, R.field w z.1 z.2) = w*R.area := by
  rw [R.field_on_plane,integral_indicator_const w (measurableSet_Ioo.prod measurableSet_Ioo),
    Measure.volume_eq_prod,measureReal_prod_prod,Real.volume_real_Ioo,Real.volume_real_Ioo,smul_eq_mul]
  simp only [Rect.area,max_comm]
  ring

theorem Rect.area_of_ordered (R : Rect) (hx : R.x0 ≤ R.x1) (hy : R.y0 ≤ R.y1) :
    R.area=(R.x1-R.x0)*(R.y1-R.y0) := by
  rw [Rect.area,max_eq_right (sub_nonneg.mpr hx),max_eq_right (sub_nonneg.mpr hy)]

theorem rectangleField_plane_integrable {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) : Integrable (fun z : ℝ × ℝ => rectangleField S R w z.1 z.2) :=
  integrable_finsetSum S (fun i _ => (R i).field_plane_integrable (w i))

theorem rectangleField_plane_integral {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) :
    (∫ z : ℝ × ℝ, rectangleField S R w z.1 z.2) = ∑ i ∈ S, w i*(R i).area := by
  unfold rectangleField
  rw [integral_finsetSum S (fun i _ => (R i).field_plane_integrable (w i))]
  apply Finset.sum_congr rfl
  intro i hi
  exact (R i).field_plane_integral (w i)

theorem eraseGrid_plane_ae (V H : Finset ℝ) (F : ℝ → ℝ → ℝ) :
    (fun z : ℝ × ℝ => eraseGrid V H F z.1 z.2) =ᵐ[volume] (fun z => F z.1 z.2) := by
  classical
  have hv : volume {z : ℝ × ℝ | z.1 ∈ V}=0 := by
    have he : {z : ℝ × ℝ | z.1 ∈ V} = (V : Set ℝ) ×ˢ (Set.univ : Set ℝ) := by ext z; simp
    rw [he,Measure.volume_eq_prod,Measure.prod_prod,V.measure_zero volume,zero_mul]
  have hh : volume {z : ℝ × ℝ | z.2 ∈ H}=0 := by
    have he : {z : ℝ × ℝ | z.2 ∈ H} = (Set.univ : Set ℝ) ×ˢ (H : Set ℝ) := by ext z; simp
    rw [he,Measure.volume_eq_prod,Measure.prod_prod,H.measure_zero volume,mul_zero]
  have hva : ∀ᵐ z : ℝ × ℝ, z.1 ∉ V := by simpa only [ae_iff,not_not] using hv
  have hha : ∀ᵐ z : ℝ × ℝ, z.2 ∉ H := by simpa only [ae_iff,not_not] using hh
  filter_upwards [hva,hha] with z hzv hzh
  simp [eraseGrid,hzv,hzh]

theorem eraseGrid_plane_integral_eq (V H : Finset ℝ) (F : ℝ → ℝ → ℝ) :
    (∫ z : ℝ × ℝ, eraseGrid V H F z.1 z.2) = ∫ z : ℝ × ℝ, F z.1 z.2 :=
  integral_congr_ae (eraseGrid_plane_ae V H F)

end NoThreeLine

#print axioms NoThreeLine.rectangleField_plane_integral
#print axioms NoThreeLine.eraseGrid_plane_integral_eq
