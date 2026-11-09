import NoThreeLine.ChordIntegral
import Mathlib.MeasureTheory.Group.Integral

/-! The four slope charts are actual chords of one field. The reflection
change of variables preserves one-dimensional Lebesgue measure, so there is
no additional Jacobian or length factor. -/
set_option autoImplicit false
open Set MeasureTheory
open scoped BigOperators Interval
noncomputable section

namespace NoThreeLine

/-- The needed reflection invariance follows directly from real scaling by -1.
This avoids the general locally compact Haar uniqueness route. -/
local instance : Measure.IsNegInvariant (volume : Measure ℝ) := by
  constructor
  change Measure.map (fun x : ℝ => -x) volume = volume
  simpa using Real.map_volume_mul_left (a := (-1:ℝ)) (by norm_num)

def chartField (f : Fin 4) (F : ℝ → ℝ → ℝ) (x y : ℝ) : ℝ :=
  ![F x y, F (1-x) y, F y x, F y (1-x)] f

def chartRootX (f : Fin 4) (x y : ℝ) : ℝ := ![x,1-x,y,1-y] f
def chartRootY (f : Fin 4) (x y : ℝ) : ℝ := ![y,y,x,x] f

def lineChord (F : ℝ → ℝ → ℝ) (x y u : ℝ) : ℝ :=
  ∫ t : ℝ, F t (y-u*x+u*t)

def directionalChord (f : Fin 4) (F : ℝ → ℝ → ℝ) (x y u : ℝ) : ℝ :=
  ![(∫ t : ℝ, F t (y+u*(t-x))),
    (∫ t : ℝ, F t (y-u*(t-x))),
    (∫ t : ℝ, F (x+u*(t-y)) t),
    (∫ t : ℝ, F (x-u*(t-y)) t)] f

theorem chartChord_eq_directional (f : Fin 4) (F : ℝ → ℝ → ℝ) (x y u : ℝ) :
    lineChord (chartField f F) (chartRootX f x y) (chartRootY f x y) u =
      directionalChord f F x y u := by
  fin_cases f
  · change (∫ t : ℝ, F t (y-u*x+u*t)) = ∫ t : ℝ, F t (y+u*(t-x))
    congr 1
    funext t
    congr 1
    ring
  · change (∫ t : ℝ, F (1-t) (y-u*(1-x)+u*t)) = ∫ t : ℝ, F t (y-u*(t-x))
    calc
      _ = ∫ t : ℝ, (fun s => F s (y-u*(s-x))) (1-t) := by
        congr 1
        funext t
        congr 1
        ring
      _ = _ := integral_sub_left_eq_self (fun s : ℝ => F s (y-u*(s-x))) volume (1:ℝ)
  · change (∫ t : ℝ, F (x-u*y+u*t) t) = ∫ t : ℝ, F (x+u*(t-y)) t
    congr 1
    funext t
    congr 1
    ring
  · change (∫ t : ℝ, F (x-u*(1-y)+u*t) (1-t)) = ∫ t : ℝ, F (x-u*(t-y)) t
    calc
      _ = ∫ t : ℝ, (fun s => F (x-u*(s-y)) s) (1-t) := by
        congr 1
        funext t
        congr 1
        ring
      _ = _ := integral_sub_left_eq_self (fun s : ℝ => F (x-u*(s-y)) s) volume (1:ℝ)

namespace Rect

def flipX (R : Rect) : Rect := ⟨1-R.x1,1-R.x0,R.y0,R.y1⟩
def swapXY (R : Rect) : Rect := ⟨R.y0,R.y1,R.x0,R.x1⟩
def chart (f : Fin 4) (R : Rect) : Rect := ![R,R.flipX,R.swapXY,R.swapXY.flipX] f

theorem field_flipX (R : Rect) (w x y : ℝ) :
    R.flipX.field w x y = R.field w (1-x) y := by
  have h : R.flipX.contains x y ↔ R.contains (1-x) y := by
    simp only [contains,flipX]
    constructor
    · rintro ⟨h0,h1,h2,h3⟩
      exact ⟨by linarith,by linarith,h2,h3⟩
    · rintro ⟨h0,h1,h2,h3⟩
      exact ⟨by linarith,by linarith,h2,h3⟩
  unfold field
  split_ifs with h1 h2 h2
  · rfl
  · exact False.elim (h2 (h.mp h1))
  · exact False.elim (h1 (h.mpr h2))
  · rfl

theorem field_swapXY (R : Rect) (w x y : ℝ) :
    R.swapXY.field w x y = R.field w y x := by
  have h : R.swapXY.contains x y ↔ R.contains y x := by
    simp only [contains,swapXY]
    tauto
  unfold field
  split_ifs with h1 h2 h2
  · rfl
  · exact False.elim (h2 (h.mp h1))
  · exact False.elim (h1 (h.mpr h2))
  · rfl

theorem field_chart (f : Fin 4) (R : Rect) (w x y : ℝ) :
    (R.chart f).field w x y = chartField f (R.field w) x y := by
  fin_cases f
  · rfl
  · exact field_flipX R w x y
  · exact field_swapXY R w x y
  · exact (field_flipX R.swapXY w x y).trans (field_swapXY R w (1-x) y)

theorem root_mem_chart (f : Fin 4) (Q : Rect) (x y : ℝ)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) :
    chartRootX f x y ∈ Icc (Q.chart f).x0 (Q.chart f).x1 ∧
      chartRootY f x y ∈ Icc (Q.chart f).y0 (Q.chart f).y1 := by
  fin_cases f
  · exact ⟨hx,hy⟩
  · change 1-x ∈ Icc (1-Q.x1) (1-Q.x0) ∧ y ∈ Icc Q.y0 Q.y1
    exact ⟨⟨by linarith [hx.2],by linarith [hx.1]⟩,hy⟩
  · exact ⟨hy,hx⟩
  · change 1-y ∈ Icc (1-Q.y1) (1-Q.y0) ∧ x ∈ Icc Q.x0 Q.x1
    exact ⟨⟨by linarith [hy.2],by linarith [hy.1]⟩,hx⟩

end Rect

theorem rectangleField_chart {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (f : Fin 4) (x y : ℝ) :
    rectangleField S (fun i => (R i).chart f) w x y =
      chartField f (rectangleField S R w) x y := by
  fin_cases f
  · rfl
  · exact Finset.sum_congr rfl (fun i _ => (R i).field_flipX (w i) x y)
  · exact Finset.sum_congr rfl (fun i _ => (R i).field_swapXY (w i) x y)
  · exact Finset.sum_congr rfl (fun i _ =>
      ((R i).swapXY.field_flipX (w i) x y).trans ((R i).field_swapXY (w i) (1-x) y))

theorem rectangleField_chartChord_eq {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (f : Fin 4) (x y u : ℝ) :
    fieldChord S (fun i => (R i).chart f) w (chartRootX f x y) (chartRootY f x y) u =
      directionalChord f (rectangleField S R w) x y u := by
  have hfield : rectangleField S (fun i => (R i).chart f) w =
      chartField f (rectangleField S R w) := by
    funext x y
    exact rectangleField_chart S R w f x y
  unfold fieldChord
  rw [hfield]
  exact chartChord_eq_directional f (rectangleField S R w) x y u

theorem directionalChord_square_intervalIntegrable {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (x y : ℝ) :
    IntervalIntegrable (fun u => (directionalChord f (rectangleField S R w) x y u)^2)
      volume 0 1 := by
  have he : (fun u => (directionalChord f (rectangleField S R w) x y u)^2) =
      (fun u => (fieldChord S (fun i => (R i).chart f) w
        (chartRootX f x y) (chartRootY f x y) u)^2) := by
    funext u
    rw [rectangleField_chartChord_eq]
  rw [he]
  exact fieldChord_square_intervalIntegrable S (fun i => (R i).chart f) w _ _

/-- Each nonaxis affine parametrization meets a finite grid finitely often. -/
theorem eraseGrid_affine_line_ae (vertical horizontal : Finset ℝ)
    (F : ℝ → ℝ → ℝ) (a b c d : ℝ) (hb : b ≠ 0) (hd : d ≠ 0) :
    (fun t => eraseGrid vertical horizontal F (a+b*t) (c+d*t)) =ᵐ[volume]
      (fun t => F (a+b*t) (c+d*t)) := by
  classical
  have hfinite : ((fun h : ℝ => (h-a)/b) '' (vertical : Set ℝ) ∪
      (fun h : ℝ => (h-c)/d) '' (horizontal : Set ℝ)).Finite :=
    (vertical.finite_toSet.image _).union (horizontal.finite_toSet.image _)
  filter_upwards [hfinite.countable.ae_notMem volume] with t ht
  have hv : a+b*t ∉ vertical := by
    intro h
    apply ht
    left
    refine ⟨a+b*t,h,?_⟩
    apply (div_eq_iff hb).2
    ring
  have hh : c+d*t ∉ horizontal := by
    intro h
    apply ht
    right
    refine ⟨c+d*t,h,?_⟩
    apply (div_eq_iff hd).2
    ring
  simp only [eraseGrid,if_neg (not_or.mpr ⟨hv,hh⟩)]

theorem eraseGrid_affine_line_integral_eq (vertical horizontal : Finset ℝ)
    (F : ℝ → ℝ → ℝ) (a b c d : ℝ) (hb : b ≠ 0) (hd : d ≠ 0) :
    (∫ t : ℝ, eraseGrid vertical horizontal F (a+b*t) (c+d*t)) =
      ∫ t : ℝ, F (a+b*t) (c+d*t) :=
  integral_congr_ae (eraseGrid_affine_line_ae vertical horizontal F a b c d hb hd)

theorem directionalChord_eraseGrid (f : Fin 4) (vertical horizontal : Finset ℝ)
    (F : ℝ → ℝ → ℝ) (x y u : ℝ) (hu : u ≠ 0) :
    directionalChord f (eraseGrid vertical horizontal F) x y u =
      directionalChord f F x y u := by
  fin_cases f
  · change (∫ t : ℝ, eraseGrid vertical horizontal F t (y+u*(t-x))) =
      ∫ t : ℝ, F t (y+u*(t-x))
    convert eraseGrid_affine_line_integral_eq vertical horizontal F 0 1 (y-u*x) u
      (by norm_num) hu using 1 <;> congr 1 <;> funext t <;> congr 1 <;> ring
  · change (∫ t : ℝ, eraseGrid vertical horizontal F t (y-u*(t-x))) =
      ∫ t : ℝ, F t (y-u*(t-x))
    convert eraseGrid_affine_line_integral_eq vertical horizontal F 0 1 (y+u*x) (-u)
      (by norm_num) (neg_ne_zero.mpr hu) using 1 <;> congr 1 <;> funext t <;> congr 1 <;> ring
  · change (∫ t : ℝ, eraseGrid vertical horizontal F (x+u*(t-y)) t) =
      ∫ t : ℝ, F (x+u*(t-y)) t
    convert eraseGrid_affine_line_integral_eq vertical horizontal F (x-u*y) u 0 1
      hu (by norm_num) using 1 <;> congr 1 <;> funext t <;> congr 1 <;> ring
  · change (∫ t : ℝ, eraseGrid vertical horizontal F (x-u*(t-y)) t) =
      ∫ t : ℝ, F (x-u*(t-y)) t
    convert eraseGrid_affine_line_integral_eq vertical horizontal F (x+u*y) (-u) 0 1
      (neg_ne_zero.mpr hu) (by norm_num) using 1 <;> congr 1 <;> funext t <;> congr 1 <;> ring

theorem directionalChord_eraseGrid_square_integral_eq (f : Fin 4)
    (vertical horizontal : Finset ℝ) (F : ℝ → ℝ → ℝ) (x y : ℝ) :
    (∫ u in (0:ℝ)..1, (directionalChord f (eraseGrid vertical horizontal F) x y u)^2) =
      ∫ u in (0:ℝ)..1, (directionalChord f F x y u)^2 := by
  apply intervalIntegral.integral_congr_uIoo
  intro u hu
  have hu' : u ∈ Ioo (0:ℝ) 1 := by
    simpa only [uIoo_of_le (by norm_num : (0:ℝ) ≤ 1)] using hu
  dsimp only
  rw [directionalChord_eraseGrid f vertical horizontal F x y u (ne_of_gt hu'.1)]

end NoThreeLine

#print axioms NoThreeLine.chartChord_eq_directional
#print axioms NoThreeLine.Rect.root_mem_chart
#print axioms NoThreeLine.rectangleField_chartChord_eq
#print axioms NoThreeLine.directionalChord_square_intervalIntegrable
#print axioms NoThreeLine.directionalChord_eraseGrid_square_integral_eq
