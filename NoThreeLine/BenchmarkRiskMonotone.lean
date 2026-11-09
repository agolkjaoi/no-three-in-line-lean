import NoThreeLine.AngularChartsBV

/-! Transfer a reference-field certificate to a nonnegative finite rectangle
field dominated off the common erased grid. The pointwise domination is the
schedule/input bridge; no chord or integral bound is assumed. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval

namespace NoThreeLine

theorem rectangleField_mul {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (c x y : ℝ) :
    rectangleField S R (fun i => c*w i) x y = c*rectangleField S R w x y := by
  classical
  simp only [rectangleField,Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro i _
  by_cases h : (R i).contains x y <;> simp [Rect.field,h]

theorem finiteField_line_integrable {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (x y u : ℝ) (hu : 0 < u) :
    Integrable (fun t => rectangleField S R w t (y-u*x+u*t)) := by
  simpa only [rectangleField] using integrable_finsetSum S
    (fun i _ => (R i).field_on_line_integrable (w i) (y-u*x) u hu)

theorem fieldChord_le_of_erased_domination {ι κ : Type*}
    (S : Finset ι) (T : Finset κ) (R : ι → Rect) (Q : κ → Rect)
    (w : ι → ℝ) (v : κ → ℝ) (V H : Finset ℝ)
    (hdom : ∀ a b, eraseGrid V H (rectangleField S R w) a b ≤
      eraseGrid V H (rectangleField T Q v) a b)
    (x y u : ℝ) (hu : 0 < u) :
    fieldChord S R w x y u ≤ fieldChord T Q v x y u := by
  unfold fieldChord
  apply integral_mono_ae (finiteField_line_integrable S R w x y u hu)
    (finiteField_line_integrable T Q v x y u hu)
  filter_upwards [eraseGrid_on_line_ae V H (rectangleField S R w) (y-u*x) u hu,
    eraseGrid_on_line_ae V H (rectangleField T Q v) (y-u*x) u hu] with t htS htT
  rw [← htS,← htT]
  exact hdom t (y-u*x+u*t)

theorem directional_square_integral_le_of_erased_domination {ι κ : Type*}
    (S : Finset ι) (T : Finset κ) (R : ι → Rect) (Q : κ → Rect)
    (w : ι → ℝ) (v : κ → ℝ) (V H : Finset ℝ)
    (hw : ∀ i ∈ S, 0 ≤ w i)
    (hdom : ∀ a b, eraseGrid V H (rectangleField S R w) a b ≤
      eraseGrid V H (rectangleField T Q v) a b)
    (f : Fin 4) (x y : ℝ) :
    (∫ u in (0 : ℝ)..1, (directionalChord f (rectangleField S R w) x y u)^2) ≤
      ∫ u in (0 : ℝ)..1, (directionalChord f (rectangleField T Q v) x y u)^2 := by
  have hs : rectangleField S (fun i => (R i).chart f) w = chartField f (rectangleField S R w) := by
    funext a b
    exact rectangleField_chart S R w f a b
  have ht : rectangleField T (fun i => (Q i).chart f) v = chartField f (rectangleField T Q v) := by
    funext a b
    exact rectangleField_chart T Q v f a b
  have hc (a b : ℝ) : eraseGrid (chartVertical f V H) (chartHorizontal f V H)
      (rectangleField S (fun i => (R i).chart f) w) a b ≤
      eraseGrid (chartVertical f V H) (chartHorizontal f V H)
        (rectangleField T (fun i => (Q i).chart f) v) a b := by
    rw [hs,ht,← chartField_eraseGrid,← chartField_eraseGrid]
    fin_cases f
    · exact hdom a b
    · exact hdom (1-a) b
    · exact hdom b a
    · exact hdom b (1-a)
  have hi := fieldChord_square_integral_le S (fun i => (R i).chart f) w
    (chartRootX f x y) (chartRootY f x y)
    (fieldChord T (fun i => (Q i).chart f) v (chartRootX f x y) (chartRootY f x y)) hw
    (fieldChord_square_intervalIntegrable T (fun i => (Q i).chart f) v _ _) (by
      intro u hu
      exact fieldChord_le_of_erased_domination S T (fun i => (R i).chart f)
        (fun i => (Q i).chart f) w v (chartVertical f V H) (chartHorizontal f V H)
        hc _ _ u hu.1)
  simpa only [rectangleField_chartChord_eq] using hi

theorem erased_directional_square_integral_le_of_erased_domination {ι κ : Type*}
    (S : Finset ι) (T : Finset κ) (R : ι → Rect) (Q : κ → Rect)
    (w : ι → ℝ) (v : κ → ℝ) (V H : Finset ℝ)
    (hw : ∀ i ∈ S, 0 ≤ w i)
    (hdom : ∀ a b, eraseGrid V H (rectangleField S R w) a b ≤
      eraseGrid V H (rectangleField T Q v) a b)
    (f : Fin 4) (x y : ℝ) :
    (∫ u in (0 : ℝ)..1, (directionalChord f (eraseGrid V H (rectangleField S R w)) x y u)^2) ≤
      ∫ u in (0 : ℝ)..1, (directionalChord f (eraseGrid V H (rectangleField T Q v)) x y u)^2 := by
  rw [directionalChord_eraseGrid_square_integral_eq,directionalChord_eraseGrid_square_integral_eq]
  exact directional_square_integral_le_of_erased_domination S T R Q w v V H hw hdom f x y

end NoThreeLine

#print axioms NoThreeLine.fieldChord_le_of_erased_domination
#print axioms NoThreeLine.erased_directional_square_integral_le_of_erased_domination
