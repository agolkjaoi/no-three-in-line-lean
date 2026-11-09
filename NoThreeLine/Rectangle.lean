import Mathlib.MeasureTheory.Integral.Bochner.Set
import Mathlib.MeasureTheory.Measure.Lebesgue.Basic
import Mathlib.Tactic

/-!
Exact chord geometry of finite sums of open rectangle indicators.
This module proves geometric semantics, not the stochastic existence theorem.
-/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators
noncomputable section

namespace NoThreeLine

structure Rect where
  x0 : ℝ
  x1 : ℝ
  y0 : ℝ
  y1 : ℝ

namespace Rect

def contains (R : Rect) (x y : ℝ) : Prop :=
  R.x0 < x ∧ x < R.x1 ∧ R.y0 < y ∧ y < R.y1

def field (R : Rect) (w x y : ℝ) : ℝ := by
  classical
  exact if R.contains x y then w else 0

def lower (R : Rect) (v u : ℝ) : ℝ := max R.x0 ((R.y0-v)/u)
def upper (R : Rect) (v u : ℝ) : ℝ := min R.x1 ((R.y1-v)/u)
def chordLength (R : Rect) (v u : ℝ) : ℝ :=
  max 0 (R.upper v u - R.lower v u)
def chord (R : Rect) (w v u : ℝ) : ℝ :=
  ∫ t : ℝ, R.field w t (v+u*t)

theorem line_mem_iff (R : Rect) (v u t : ℝ) (hu : 0 < u) :
    R.contains t (v+u*t) ↔ t ∈ Ioo (R.lower v u) (R.upper v u) := by
  simp only [contains, lower, upper, mem_Ioo, max_lt_iff, lt_min_iff]
  rw [div_lt_iff₀ hu, lt_div_iff₀ hu]
  constructor
  · rintro ⟨hx0,hx1,hy0,hy1⟩
    constructor <;> constructor <;> nlinarith
  · rintro ⟨⟨hx0,hy0⟩,hx1,hy1⟩
    exact ⟨hx0,hx1,by nlinarith,by nlinarith⟩

theorem field_on_line (R : Rect) (w v u : ℝ) (hu : 0 < u) :
    (fun t => R.field w t (v+u*t)) =
      (Ioo (R.lower v u) (R.upper v u)).indicator (fun _ => w) := by
  funext t
  simp only [field, Set.indicator_apply, line_mem_iff R v u t hu]

theorem field_on_line_integrable (R : Rect) (w v u : ℝ) (hu : 0 < u) :
    Integrable (fun t => R.field w t (v+u*t)) := by
  rw [field_on_line R w v u hu, integrable_indicator_iff measurableSet_Ioo]
  exact integrableOn_const (by simp [Real.volume_Ioo])

theorem chord_eq_length (R : Rect) (w v u : ℝ) (hu : 0 < u) :
    R.chord w v u = w * R.chordLength v u := by
  unfold chord
  rw [field_on_line R w v u hu, integral_indicator_const w measurableSet_Ioo,
    Real.volume_real_Ioo, smul_eq_mul]
  simp only [chordLength, max_comm (R.upper v u - R.lower v u) 0, mul_comm]

theorem chord_nonneg (R : Rect) (w v u : ℝ) (hw : 0 ≤ w) (hu : 0 < u) :
    0 ≤ R.chord w v u := by
  rw [chord_eq_length R w v u hu]
  exact mul_nonneg hw (le_max_left _ _)

/-- A closed root box gives an interval of intercepts for every positive slope. -/
theorem root_intercept_bounds (Q : Rect) (x y u : ℝ) (hu : 0 < u)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) :
    Q.y0-u*Q.x1 ≤ y-u*x ∧ y-u*x ≤ Q.y1-u*Q.x0 := by
  constructor <;> nlinarith [hx.1,hx.2,hy.1,hy.2]

/-- A simple cellwise upper bound, uniform on the entire closed root rectangle.
It can be weaker than the frozen vertex/jump envelope; it is an independently
proved route from actual rectangle data to an a+b/u expression tree. -/
def boxEnvelope (R Q : Rect) (u : ℝ) : ℝ :=
  max 0 (min R.x1 (Q.x1+(R.y1-Q.y0)/u) -
    max R.x0 (Q.x0+(R.y0-Q.y1)/u))

theorem chordLength_le_boxEnvelope (R Q : Rect) (x y u : ℝ) (hu : 0 < u)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) :
    R.chordLength (y-u*x) u ≤ R.boxEnvelope Q u := by
  have hb := root_intercept_bounds Q x y u hu hx hy
  have hlo : Q.x0+(R.y0-Q.y1)/u ≤ (R.y0-(y-u*x))/u := by
    apply (le_div_iff₀ hu).2
    field_simp
    nlinarith [hy.2,hx.1]
  have hhi : (R.y1-(y-u*x))/u ≤ Q.x1+(R.y1-Q.y0)/u := by
    apply (div_le_iff₀ hu).2
    field_simp
    nlinarith [hy.1,hx.2]
  apply max_le_max (le_refl 0)
  exact sub_le_sub (min_le_min (le_refl _) hhi) (max_le_max (le_refl _) hlo)

theorem chord_le_boxEnvelope (R Q : Rect) (w x y u : ℝ)
    (hw : 0 ≤ w) (hu : 0 < u)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) :
    R.chord w (y-u*x) u ≤ w * R.boxEnvelope Q u := by
  rw [chord_eq_length R w (y-u*x) u hu]
  exact mul_le_mul_of_nonneg_left (chordLength_le_boxEnvelope R Q x y u hu hx hy) hw

theorem chordLength_continuousOn (R : Rect) (x y : ℝ) :
    ContinuousOn (fun u => R.chordLength (y-u*x) u) (Ioi 0) := by
  intro u hu
  have hne : u ≠ 0 := ne_of_gt hu
  unfold chordLength upper lower
  fun_prop

theorem boxEnvelope_continuousOn (R Q : Rect) :
    ContinuousOn (R.boxEnvelope Q) (Ioi 0) := by
  intro u hu
  have hne : u ≠ 0 := ne_of_gt hu
  unfold boxEnvelope
  fun_prop

theorem chord_continuousOn (R : Rect) (w x y : ℝ) :
    ContinuousOn (fun u => R.chord w (y-u*x) u) (Ioi 0) := by
  apply (continuousOn_const.mul (R.chordLength_continuousOn x y)).congr
  intro u hu
  exact R.chord_eq_length w (y-u*x) u hu

end Rect

/-- A finite superposition. Overlaps are counted additively, exactly as defined. -/
def rectangleField {ι : Type*} (S : Finset ι) (R : ι → Rect) (w : ι → ℝ)
    (x y : ℝ) : ℝ := ∑ i ∈ S, (R i).field (w i) x y

theorem rectangleField_chord {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (v u : ℝ) (hu : 0 < u) :
    (∫ t : ℝ, rectangleField S R w t (v+u*t)) =
      ∑ i ∈ S, w i * (R i).chordLength v u := by
  unfold rectangleField
  rw [integral_finsetSum S (fun i _ => (R i).field_on_line_integrable (w i) v u hu)]
  exact Finset.sum_congr rfl (fun i _ => (R i).chord_eq_length (w i) v u hu)

theorem rectangleField_chord_le {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (Q : Rect) (x y u : ℝ) (hu : 0 < u)
    (hw : ∀ i ∈ S, 0 ≤ w i)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) :
    (∫ t : ℝ, rectangleField S R w t (y-u*x+u*t)) ≤
      ∑ i ∈ S, w i * (R i).boxEnvelope Q u := by
  rw [rectangleField_chord S R w (y-u*x) u hu]
  exact Finset.sum_le_sum (fun i hi => mul_le_mul_of_nonneg_left
    ((R i).chordLength_le_boxEnvelope Q x y u hu hx hy) (hw i hi))

/-- Zero the field on any additional finite vertical and horizontal grid. -/
def eraseGrid (vertical horizontal : Finset ℝ) (F : ℝ → ℝ → ℝ) (x y : ℝ) : ℝ := by
  classical
  exact if x ∈ vertical ∨ y ∈ horizontal then 0 else F x y

/-- A nonaxis line meets the erased grid only finitely often. No assumption
about values of the original field, or its integrability, is needed here. -/
theorem eraseGrid_on_line_ae (vertical horizontal : Finset ℝ) (F : ℝ → ℝ → ℝ)
    (v u : ℝ) (hu : 0 < u) :
    (fun t => eraseGrid vertical horizontal F t (v+u*t)) =ᵐ[volume]
      (fun t => F t (v+u*t)) := by
  classical
  have hfinite : ((vertical : Set ℝ) ∪
      (fun h : ℝ => (h-v)/u) '' (horizontal : Set ℝ)).Finite :=
    vertical.finite_toSet.union (horizontal.finite_toSet.image _)
  filter_upwards [hfinite.countable.ae_notMem volume] with t ht
  have hv : t ∉ vertical := fun h => ht (Or.inl h)
  have hh : v+u*t ∉ horizontal := by
    intro h
    apply ht
    right
    refine ⟨v+u*t,h,?_⟩
    apply (div_eq_iff (ne_of_gt hu)).2
    ring
  simp only [eraseGrid, if_neg (not_or.mpr ⟨hv,hh⟩)]

theorem eraseGrid_chord_eq (vertical horizontal : Finset ℝ) (F : ℝ → ℝ → ℝ)
    (v u : ℝ) (hu : 0 < u) :
    (∫ t : ℝ, eraseGrid vertical horizontal F t (v+u*t)) =
      ∫ t : ℝ, F t (v+u*t) := by
  exact integral_congr_ae (eraseGrid_on_line_ae vertical horizontal F v u hu)

end NoThreeLine

#print axioms NoThreeLine.Rect.line_mem_iff
#print axioms NoThreeLine.Rect.chord_eq_length
#print axioms NoThreeLine.Rect.chord_le_boxEnvelope
#print axioms NoThreeLine.rectangleField_chord
#print axioms NoThreeLine.rectangleField_chord_le
#print axioms NoThreeLine.eraseGrid_chord_eq
