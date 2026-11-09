import NoThreeLine.AngularBV
import NoThreeLine.Charts

/-! G12 for the four actual direction charts, also after finite grid erasure.
The axis endpoint is transported exactly under each chart. -/
set_option autoImplicit false
noncomputable section
open Set
open scoped ENNReal

namespace NoThreeLine

theorem Rect.InUnitSquare.flipX {R : Rect} (h : R.InUnitSquare) : R.flipX.InUnitSquare := by
  rcases h with ⟨h0,h1,h2,h3,h4,h5⟩
  exact ⟨by dsimp [Rect.flipX]; linarith,by dsimp [Rect.flipX]; linarith,
    by dsimp [Rect.flipX]; linarith,h3,h4,h5⟩

theorem Rect.InUnitSquare.swapXY {R : Rect} (h : R.InUnitSquare) : R.swapXY.InUnitSquare := by
  rcases h with ⟨h0,h1,h2,h3,h4,h5⟩
  exact ⟨h3,h4,h5,h0,h1,h2⟩

theorem Rect.InUnitSquare.chart {R : Rect} (h : R.InUnitSquare) (f : Fin 4) :
    (R.chart f).InUnitSquare := by
  fin_cases f
  · exact h
  · exact h.flipX
  · exact h.swapXY
  · exact h.swapXY.flipX

theorem Rect.Separated.flipX {R Q : Rect} (h : R.Separated Q) : R.flipX.Separated Q.flipX := by
  rcases h with h | h | h | h
  · right; left; dsimp [Rect.flipX]; linarith
  · left; dsimp [Rect.flipX]; linarith
  · right; right; left; exact h
  · right; right; right; exact h

theorem Rect.Separated.swapXY {R Q : Rect} (h : R.Separated Q) : R.swapXY.Separated Q.swapXY := by
  simp only [Rect.Separated,Rect.swapXY] at *
  tauto

theorem Rect.Separated.chart {R Q : Rect} (h : R.Separated Q) (f : Fin 4) :
    (R.chart f).Separated (Q.chart f) := by
  fin_cases f
  · exact h
  · exact h.flipX
  · exact h.swapXY
  · exact h.swapXY.flipX

theorem rectanglesSeparated_chart {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (hsep : RectanglesSeparated S R) (f : Fin 4) :
    RectanglesSeparated S (fun i => (R i).chart f) := by
  intro i hi j hj hij
  exact (hsep i hi j hj hij).chart f

theorem directionalChord_square_eVariation {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    eVariationOn (fun u => (directionalChord f (rectangleField S R w) x y u)^2)
      (Icc (0 : ℝ) 1) ≤ ENNReal.ofReal ((4*(S.card : ℝ)+2)*M^2) := by
  have hv := fieldChord_square_eVariation S (fun i => (R i).chart f) w M
    (chartRootX f x y) (chartRootY f x y) hM (rectanglesSeparated_chart S R hsep f) hw
    (fun i hi => (hR i hi).chart f)
  simpa only [rectangleField_chartChord_eq] using hv

theorem directionalChord_square_bounds {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (M x y u : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    0 ≤ (directionalChord f (rectangleField S R w) x y u)^2 ∧
      (directionalChord f (rectangleField S R w) x y u)^2 ≤ M^2 := by
  have hb := fieldChord_square_bounds S (fun i => (R i).chart f) w M
    (chartRootX f x y) (chartRootY f x y) u hM (rectanglesSeparated_chart S R hsep f) hw
    (fun i hi => (hR i hi).chart f)
  simpa only [rectangleField_chartChord_eq] using hb

def reflectGrid (V : Finset ℝ) : Finset ℝ := V.image (fun t => 1-t)

@[simp] theorem mem_reflectGrid (V : Finset ℝ) (t : ℝ) : t ∈ reflectGrid V ↔ 1-t ∈ V := by
  classical
  simp only [reflectGrid,Finset.mem_image]
  constructor
  · rintro ⟨s,hs,rfl⟩
    simpa using hs
  · intro ht
    exact ⟨1-t,ht,by ring⟩

def chartVertical (f : Fin 4) (V H : Finset ℝ) : Finset ℝ :=
  ![V,reflectGrid V,H,reflectGrid H] f

def chartHorizontal (f : Fin 4) (V H : Finset ℝ) : Finset ℝ := ![H,H,V,V] f

theorem chartField_eraseGrid (f : Fin 4) (V H : Finset ℝ) (F : ℝ → ℝ → ℝ) :
    chartField f (eraseGrid V H F) =
      eraseGrid (chartVertical f V H) (chartHorizontal f V H) (chartField f F) := by
  funext x y
  fin_cases f <;> simp [chartField,chartVertical,chartHorizontal,eraseGrid,or_comm]

theorem erased_rectangleField_chartChord_eq {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (V H : Finset ℝ) (x y u : ℝ) :
    erasedFieldChord S (fun i => (R i).chart f) w
      (chartVertical f V H) (chartHorizontal f V H) (chartRootX f x y) (chartRootY f x y) u =
      directionalChord f (eraseGrid V H (rectangleField S R w)) x y u := by
  have he : rectangleField S (fun i => (R i).chart f) w = chartField f (rectangleField S R w) := by
    funext a b
    exact rectangleField_chart S R w f a b
  unfold erasedFieldChord
  rw [he,← chartField_eraseGrid]
  exact chartChord_eq_directional f (eraseGrid V H (rectangleField S R w)) x y u

theorem erased_directionalChord_square_eVariation {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (V H : Finset ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    eVariationOn (fun u => (directionalChord f (eraseGrid V H (rectangleField S R w)) x y u)^2)
      (Icc (0 : ℝ) 1) ≤ ENNReal.ofReal ((4*(S.card : ℝ)+2)*M^2) := by
  have hv := erasedFieldChord_square_eVariation S (fun i => (R i).chart f) w
    (chartVertical f V H) (chartHorizontal f V H) M (chartRootX f x y) (chartRootY f x y)
    hM (rectanglesSeparated_chart S R hsep f) hw (fun i hi => (hR i hi).chart f)
  simpa only [erased_rectangleField_chartChord_eq] using hv

theorem erased_directionalChord_square_boundedVariationOn {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (V H : Finset ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    BoundedVariationOn (fun u => (directionalChord f (eraseGrid V H (rectangleField S R w)) x y u)^2)
      (Icc (0 : ℝ) 1) :=
  ne_of_lt ((erased_directionalChord_square_eVariation S R w f V H M x y hM hsep hw hR).trans_lt
    ENNReal.ofReal_lt_top)

theorem erased_directionalChord_square_bounds {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (V H : Finset ℝ) (M x y u : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    0 ≤ (directionalChord f (eraseGrid V H (rectangleField S R w)) x y u)^2 ∧
      (directionalChord f (eraseGrid V H (rectangleField S R w)) x y u)^2 ≤ M^2 := by
  have hb := erasedFieldChord_bounds_all_slopes S (fun i => (R i).chart f) w
    (chartVertical f V H) (chartHorizontal f V H) M (chartRootX f x y) (chartRootY f x y) u
    hM (rectanglesSeparated_chart S R hsep f) hw (fun i hi => (hR i hi).chart f)
  rw [erased_rectangleField_chartChord_eq] at hb
  exact ⟨sq_nonneg _,pow_le_pow_left₀ hb.1 hb.2 2⟩

theorem erased_directionalChord_square_variation_real {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (f : Fin 4) (V H : Finset ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    (eVariationOn (fun u => (directionalChord f (eraseGrid V H (rectangleField S R w)) x y u)^2)
      (Icc (0 : ℝ) 1)).toReal ≤ (4*(S.card : ℝ)+2)*M^2 := by
  have hv := erased_directionalChord_square_eVariation S R w f V H M x y hM hsep hw hR
  exact ENNReal.toReal_le_of_le_ofReal (by positivity) hv

theorem rectangleField_add_weights {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w w' : ι → ℝ) :
    rectangleField S R (fun i => w i+w' i) =
      fun x y => rectangleField S R w x y + rectangleField S R w' x y := by
  funext x y
  unfold rectangleField
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i _
  unfold Rect.field
  split_ifs <;> ring

/-- The paired-type field on the same fixed cells has cap `2*M`, giving
exactly the amplitude and variation constants used in the finite sieve substitution. -/
theorem erased_directionalChord_pair_G12 {ι : Type*} (S : Finset ι)
    (R : ι → Rect) (w w' : ι → ℝ) (f : Fin 4) (V H : Finset ℝ) (M x y : ℝ) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M) (hw' : ∀ i ∈ S, 0 ≤ w' i ∧ w' i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    let F := fun a b => rectangleField S R w a b + rectangleField S R w' a b
    (∀ u, 0 ≤ (directionalChord f (eraseGrid V H F) x y u)^2 ∧
      (directionalChord f (eraseGrid V H F) x y u)^2 ≤ 4*M^2) ∧
    eVariationOn (fun u => (directionalChord f (eraseGrid V H F) x y u)^2)
      (Icc (0 : ℝ) 1) ≤ ENNReal.ofReal ((4*(S.card : ℝ)+2)*(4*M^2)) := by
  dsimp only
  rw [← rectangleField_add_weights]
  have hww : ∀ i ∈ S, 0 ≤ w i+w' i ∧ w i+w' i ≤ 2*M := by
    intro i hi
    have h1 := hw i hi
    have h2 := hw' i hi
    constructor <;> linarith
  have hsq : (2*M)^2 = 4*M^2 := by ring
  constructor
  · intro u
    simpa only [hsq] using erased_directionalChord_square_bounds S R (fun i => w i+w' i)
      f V H (2*M) x y u (by positivity) hsep hww hR
  · simpa only [hsq] using erased_directionalChord_square_eVariation S R (fun i => w i+w' i)
      f V H (2*M) x y (by positivity) hsep hww hR

end NoThreeLine

#print axioms NoThreeLine.directionalChord_square_eVariation
#print axioms NoThreeLine.erased_directionalChord_square_eVariation
#print axioms NoThreeLine.erased_directionalChord_square_boundedVariationOn
#print axioms NoThreeLine.erased_directionalChord_pair_G12
