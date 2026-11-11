import NoThreeLine.AngularSieve

/-! The four coordinate maps used by the external integer checker.
They integrate with respect to the same major coordinate as the
formal squared-chord risk. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine481
open NoThreeLine

def replayChartRect (f : Fin 4) (R : Rect) : Rect :=
  ![R,R.swapXY.flipX.swapXY,R.swapXY,R.flipX.swapXY] f

def replayChartField (f : Fin 4) (F : ℝ → ℝ → ℝ) (x y : ℝ) : ℝ :=
  ![F x y,F x (1-y),F y x,F (1-y) x] f

def replayRootX (f : Fin 4) (x y : ℝ) : ℝ := ![x,x,y,y] f
def replayRootY (f : Fin 4) (x y : ℝ) : ℝ := ![y,1-y,x,1-x] f

theorem replay_root_mem (f : Fin 4) (Q : Rect) (x y : ℝ)
    (hx : x ∈ Icc Q.x0 Q.x1) (hy : y ∈ Icc Q.y0 Q.y1) :
    replayRootX f x y ∈ Icc (replayChartRect f Q).x0 (replayChartRect f Q).x1 ∧
      replayRootY f x y ∈ Icc (replayChartRect f Q).y0 (replayChartRect f Q).y1 := by
  fin_cases f
  · exact ⟨hx,hy⟩
  · change x ∈ Icc Q.x0 Q.x1 ∧ 1-y ∈ Icc (1-Q.y1) (1-Q.y0)
    exact ⟨hx,⟨by linarith [hy.2],by linarith [hy.1]⟩⟩
  · exact ⟨hy,hx⟩
  · change y ∈ Icc Q.y0 Q.y1 ∧ 1-x ∈ Icc (1-Q.x1) (1-Q.x0)
    exact ⟨hy,⟨by linarith [hx.2],by linarith [hx.1]⟩⟩

private theorem replayChartRect_field (f : Fin 4) (R : Rect) (w x y : ℝ) :
    (replayChartRect f R).field w x y = replayChartField f (R.field w) x y := by
  fin_cases f
  · rfl
  · change R.swapXY.flipX.swapXY.field w x y = R.field w x (1-y)
    rw [Rect.field_swapXY,Rect.field_flipX,Rect.field_swapXY]
  · exact R.field_swapXY w x y
  · change R.flipX.swapXY.field w x y = R.field w (1-y) x
    rw [Rect.field_swapXY,Rect.field_flipX]

theorem replayChart_rectangleField_eq {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) (f : Fin 4) (x y : ℝ) :
    rectangleField S (fun i => replayChartRect f (R i)) w x y =
      replayChartField f (rectangleField S R w) x y := by
  unfold rectangleField
  simp_rw [replayChartRect_field]
  fin_cases f <;> rfl

theorem lineChord_replayChart_eq (f : Fin 4) (F : ℝ → ℝ → ℝ) (x y u : ℝ) :
    lineChord (replayChartField f F) (replayRootX f x y) (replayRootY f x y) u =
      directionalChord f F x y u := by
  fin_cases f
  · change (∫ t : ℝ, F t (y-u*x+u*t)) = ∫ t : ℝ, F t (y+u*(t-x))
    congr 1
    funext t
    congr 1
    ring
  · change (∫ t : ℝ, F t (1-(1-y-u*x+u*t))) = ∫ t : ℝ, F t (y-u*(t-x))
    congr 1
    funext t
    congr 1
    ring
  · change (∫ t : ℝ, F (x-u*y+u*t) t) = ∫ t : ℝ, F (x+u*(t-y)) t
    congr 1
    funext t
    congr 1
    ring
  · change (∫ t : ℝ, F (1-(1-x-u*y+u*t)) t) = ∫ t : ℝ, F (x-u*(t-y)) t
    congr 1
    funext t
    congr 1
    ring

theorem pairAngularSquare_eq_replay {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w w' : ι → ℝ) (f : Fin 4) (V H : Finset ℝ) (x y u : ℝ) (hu : u ≠ 0) :
    pairAngularSquare S R w w' f V H x y u =
      (lineChord (rectangleField S (fun i => replayChartRect f (R i)) (fun i => w i+w' i))
        (replayRootX f x y) (replayRootY f x y) u)^2 := by
  rw [pairAngularSquare_eq_add_weights]
  unfold angularSquare
  rw [directionalChord_eraseGrid _ _ _ _ _ _ _ hu, ← lineChord_replayChart_eq]
  congr 2
  funext a b
  exact (replayChart_rectangleField_eq S R _ f a b).symm

#print axioms replay_root_mem
#print axioms pairAngularSquare_eq_replay

end NoThreeLine481
