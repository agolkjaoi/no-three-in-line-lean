import NoThreeLine.Charts
import NoThreeLine.RectangleExpr

/-! A finite permutation certificate identifies separately sorted chart inputs
with four coordinate transforms of one original field. -/
set_option autoImplicit false
open scoped BigOperators Interval

namespace NoThreeLine

def QRect.qChart (R : QRect) (f : Fin 4) : QRect :=
  ![R,⟨1-R.x1,1-R.x0,R.y0,R.y1⟩,⟨R.y0,R.y1,R.x0,R.x1⟩,
    ⟨1-R.y1,1-R.y0,R.x0,R.x1⟩] f

theorem QRect.qChart_real (R : QRect) (f : Fin 4) :
    (R.qChart f).real = R.real.chart f := by
  fin_cases f <;> simp [qChart,QRect.real,Rect.chart,Rect.flipX,Rect.swapXY]

def qChartReindexCheck {n : ℕ} (R A : Fin n → QRect) (w v : Fin n → ℚ)
    (Q T : QRect) (f : Fin 4) (p : Fin n → Fin n) : Bool :=
  decide (Function.Bijective p ∧
    (∀ i, A i = (R (p i)).qChart f ∧ v i = w (p i)) ∧ T = Q.qChart f)

theorem qChartReindexCheck_chord {n : ℕ} (R A : Fin n → QRect) (w v : Fin n → ℚ)
    (Q T : QRect) (f : Fin 4) (p : Fin n → Fin n)
    (hc : qChartReindexCheck R A w v Q T f p = true) (x y u : ℝ) :
    actualChord A v (chartRootX f x y) (chartRootY f x y) u =
      directionalChord f (rectangleField Finset.univ (fun i => (R i).real)
        (fun i => (w i : ℝ))) x y u := by
  have hh : Function.Bijective p ∧
      (∀ i, A i = (R (p i)).qChart f ∧ v i = w (p i)) ∧ T = Q.qChart f := by
    simpa only [qChartReindexCheck,decide_eq_true_eq] using hc
  have hfield : rectangleField Finset.univ (fun i => (A i).real) (fun i => (v i : ℝ)) =
      rectangleField Finset.univ (fun i => (R i).real.chart f) (fun i => (w i : ℝ)) := by
    funext a b
    unfold rectangleField
    apply Fintype.sum_bijective p hh.1
    intro i
    dsimp only
    rw [(hh.2.1 i).1,(hh.2.1 i).2,QRect.qChart_real]
  change (∫ t : ℝ, rectangleField Finset.univ (fun i => (A i).real)
    (fun i => (v i : ℝ)) t (chartRootY f x y-u*chartRootX f x y+u*t)) = _
  rw [hfield]
  exact rectangleField_chartChord_eq Finset.univ (fun i => (R i).real)
    (fun i => (w i : ℝ)) f x y u

theorem qChartReindexCheck_integral_bound {n : ℕ} (R A : Fin n → QRect)
    (w v : Fin n → ℚ) (Q T : QRect) (f : Fin 4) (p : Fin n → Fin n)
    (hc : qChartReindexCheck R A w v Q T f p = true) (B : ℝ)
    (hb : ∀ a b : ℝ, a ∈ Set.Icc (T.x0 : ℝ) T.x1 →
      b ∈ Set.Icc (T.y0 : ℝ) T.y1 →
      (∫ u in (0 : ℝ)..1, (actualChord A v a b u)^2) ≤ B)
    (x y : ℝ) (hx : x ∈ Set.Icc (Q.x0 : ℝ) Q.x1)
    (hy : y ∈ Set.Icc (Q.y0 : ℝ) Q.y1) :
    (∫ u in (0 : ℝ)..1, (directionalChord f
      (rectangleField Finset.univ (fun i => (R i).real) (fun i => (w i : ℝ))) x y u)^2) ≤ B := by
  have hh : Function.Bijective p ∧
      (∀ i, A i = (R (p i)).qChart f ∧ v i = w (p i)) ∧ T = Q.qChart f := by
    simpa only [qChartReindexCheck,decide_eq_true_eq] using hc
  have hT : T.real = Q.real.chart f := by rw [hh.2.2,QRect.qChart_real]
  have hm := Rect.root_mem_chart f Q.real x y hx hy
  rw [← hT] at hm
  have hb' := hb (chartRootX f x y) (chartRootY f x y) hm.1 hm.2
  simpa only [qChartReindexCheck_chord R A w v Q T f p hc] using hb'

end NoThreeLine

#print axioms NoThreeLine.qChartReindexCheck_chord
#print axioms NoThreeLine.qChartReindexCheck_integral_bound
