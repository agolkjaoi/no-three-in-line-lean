import NoThreeLine.Rectangle
import Mathlib.MeasureTheory.Integral.IntervalIntegral.Basic

/-! Angular integrability of actual finite rectangle fields, including angle zero
as a null endpoint. No geometric domination or integrability is assumed for the
actual chord. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators Interval
noncomputable section

namespace NoThreeLine

def fieldChord {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (x y u : ℝ) : ℝ := ∫ t : ℝ, rectangleField S R w t (y-u*x+u*t)

/-- A globally measurable formula; its value at zero need not be the geometric
axis chord. Equality with the actual chord is needed only at positive slopes. -/
def lengthChord {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (x y u : ℝ) : ℝ := ∑ i ∈ S, w i * (R i).chordLength (y-u*x) u

def chordCap {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ) : ℝ :=
  ∑ i ∈ S, |w i| * max 0 ((R i).x1-(R i).x0)

theorem fieldChord_eq_lengthChord {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (x y u : ℝ) (hu : 0 < u) :
    fieldChord S R w x y u = lengthChord S R w x y u :=
  rectangleField_chord S R w (y-u*x) u hu

theorem Rect.chordLength_le_width (R : Rect) (v u : ℝ) :
    R.chordLength v u ≤ max 0 (R.x1-R.x0) := by
  apply max_le_max (le_refl 0)
  exact sub_le_sub (min_le_left _ _) (le_max_left _ _)

theorem chordCap_nonneg {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ) :
    0 ≤ chordCap S R w := by
  exact Finset.sum_nonneg (fun _ _ => mul_nonneg (abs_nonneg _) (le_max_left _ _))

theorem lengthChord_abs_le {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (x y u : ℝ) :
    |lengthChord S R w x y u| ≤ chordCap S R w := by
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  apply Finset.sum_le_sum
  intro i _
  rw [abs_mul]
  change |w i| * |max 0 ((R i).upper (y-u*x) u - (R i).lower (y-u*x) u)| ≤ _
  rw [abs_of_nonneg (le_max_left (0:ℝ) ((R i).upper (y-u*x) u - (R i).lower (y-u*x) u))]
  exact mul_le_mul_of_nonneg_left ((R i).chordLength_le_width (y-u*x) u) (abs_nonneg _)

theorem lengthChord_measurable {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (x y : ℝ) : Measurable (lengthChord S R w x y) := by
  unfold lengthChord Rect.chordLength Rect.lower Rect.upper
  fun_prop

theorem fieldChord_continuousOn {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (x y : ℝ) : ContinuousOn (fieldChord S R w x y) (Ioi 0) := by
  have hc : ContinuousOn (lengthChord S R w x y) (Ioi 0) := by
    exact continuousOn_finsetSum S (fun i _ => continuousOn_const.mul
      ((R i).chordLength_continuousOn x y))
  apply hc.congr
  intro u hu
  exact fieldChord_eq_lengthChord S R w x y u hu

theorem lengthChord_square_intervalIntegrable {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y : ℝ) :
    IntervalIntegrable (fun u => (lengthChord S R w x y u)^2) volume 0 1 := by
  rw [intervalIntegrable_iff_integrableOn_Ioc_of_le (by norm_num : (0:ℝ) ≤ 1)]
  apply Measure.integrableOn_of_bounded (by simp [Real.volume_Ioc])
    ((lengthChord_measurable S R w x y).pow_const 2).aestronglyMeasurable
  filter_upwards with u
  simpa only [Real.norm_eq_abs, abs_pow, sq_abs] using
    (pow_le_pow_left₀ (abs_nonneg _) (lengthChord_abs_le S R w x y u) 2)

theorem fieldChord_square_intervalIntegrable {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y : ℝ) :
    IntervalIntegrable (fun u => (fieldChord S R w x y u)^2) volume 0 1 := by
  apply (lengthChord_square_intervalIntegrable S R w x y).congr
  intro u hu
  have hu' : u ∈ Ioc (0:ℝ) 1 := by simpa only [uIoc_of_le (by norm_num : (0:ℝ) ≤ 1)] using hu
  dsimp only
  rw [fieldChord_eq_lengthChord S R w x y u hu'.1]

theorem fieldChord_nonneg {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (x y u : ℝ) (hu : 0 < u) (hw : ∀ i ∈ S, 0 ≤ w i) :
    0 ≤ fieldChord S R w x y u := by
  rw [fieldChord_eq_lengthChord S R w x y u hu]
  exact Finset.sum_nonneg (fun i hi => mul_nonneg (hw i hi) (le_max_left _ _))

theorem fieldChord_square_integral_le {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (x y : ℝ) (E : ℝ → ℝ) (hw : ∀ i ∈ S, 0 ≤ w i)
    (hE : IntervalIntegrable (fun u => (E u)^2) volume 0 1)
    (hdom : ∀ u ∈ Ioo (0:ℝ) 1, fieldChord S R w x y u ≤ E u) :
    (∫ u in (0:ℝ)..1, (fieldChord S R w x y u)^2) ≤
      ∫ u in (0:ℝ)..1, (E u)^2 := by
  apply intervalIntegral.integral_mono_on_of_le_Ioo (by norm_num)
    (fieldChord_square_intervalIntegrable S R w x y) hE
  intro u hu
  exact pow_le_pow_left₀ (fieldChord_nonneg S R w x y u hu.1 hw) (hdom u hu) 2

/-- The only remaining analytic input here is the envelope's integrability,
which an accepted finite branch partition can supply independently. -/
theorem fieldChord_square_integral_le_box {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (Q : Rect) (x y : ℝ) (E : ℝ → ℝ)
    (hw : ∀ i ∈ S, 0 ≤ w i)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1)
    (hE : IntervalIntegrable (fun u => (E u)^2) volume 0 1)
    (he : ∀ u ∈ Ioo (0:ℝ) 1, (∑ i ∈ S, w i * (R i).boxEnvelope Q u) ≤ E u) :
    (∫ u in (0:ℝ)..1, (fieldChord S R w x y u)^2) ≤
      ∫ u in (0:ℝ)..1, (E u)^2 := by
  apply fieldChord_square_integral_le S R w x y E hw hE
  intro u hu
  exact (rectangleField_chord_le S R w Q x y u hu.1 hw hx hy).trans (he u hu)

theorem erased_fieldChord_square_intervalIntegrable {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y : ℝ) (vertical horizontal : Finset ℝ) :
    IntervalIntegrable (fun u => (∫ t : ℝ,
      eraseGrid vertical horizontal (rectangleField S R w) t (y-u*x+u*t))^2) volume 0 1 := by
  apply (fieldChord_square_intervalIntegrable S R w x y).congr
  intro u hu
  have hu' : u ∈ Ioc (0:ℝ) 1 := by simpa only [uIoc_of_le (by norm_num : (0:ℝ) ≤ 1)] using hu
  dsimp only
  rw [eraseGrid_chord_eq vertical horizontal (rectangleField S R w) (y-u*x) u hu'.1]
  rfl

theorem erased_fieldChord_square_integral_eq {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (x y : ℝ) (vertical horizontal : Finset ℝ) :
    (∫ u in (0:ℝ)..1, (∫ t : ℝ,
      eraseGrid vertical horizontal (rectangleField S R w) t (y-u*x+u*t))^2) =
      ∫ u in (0:ℝ)..1, (fieldChord S R w x y u)^2 := by
  apply intervalIntegral.integral_congr_uIoo
  intro u hu
  have hu' : u ∈ Ioo (0:ℝ) 1 := by simpa only [uIoo_of_le (by norm_num : (0:ℝ) ≤ 1)] using hu
  dsimp only
  rw [eraseGrid_chord_eq vertical horizontal (rectangleField S R w) (y-u*x) u hu'.1]
  rfl

end NoThreeLine

#print axioms NoThreeLine.fieldChord_square_intervalIntegrable
#print axioms NoThreeLine.fieldChord_square_integral_le_box
#print axioms NoThreeLine.erased_fieldChord_square_intervalIntegrable
#print axioms NoThreeLine.erased_fieldChord_square_integral_eq
