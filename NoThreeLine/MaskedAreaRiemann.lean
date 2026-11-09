import NoThreeLine.TypedAreaRiemann
import NoThreeLine.BoundaryGridCount

/-! Actual masked-board area Riemann sums, with an explicit uniform O(n)
error before normalization. The boundary grids need not align with n. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.GridArea
open PrimitiveLines FiniteDirections

def maskedTypeFieldSum {ι : Type*} (n : ℕ) (r : ZPoint) (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (V H : Finset ℝ) : ℝ :=
  ∑ q ∈ typePoints n r,
    eraseGrid V H (rectangleField S R w) ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n)

theorem eraseBoard_field_eq {n : ℕ} (V H : Finset ℝ) (F : ℝ → ℝ → ℝ) (q : Grid n) :
    eraseBoard V H (fun q => F ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n)) q =
      eraseGrid V H F ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n) := by
  classical
  simp [eraseBoard,boundaryPoints,eraseGrid]

theorem maskedTypedBoardWeight_eq_eraseBoard {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (q : Grid n) :
    maskedTypedBoardWeight S R w V H q = eraseBoard V H (typedBoardWeight S R w) q := by
  classical
  simp [maskedTypedBoardWeight,typedBoardWeight,eraseBoard,boundaryPoints,eraseGrid,
    GridChord.normX,GridChord.normY,gridEmbed]

theorem masked_type_area_error {ι : Type*} (n : ℕ) (r : ZPoint) (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (V H : Finset ℝ) (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M)
    (hr : (0 ≤ r.1 ∧ r.1 < 2) ∧ (0 ≤ r.2 ∧ r.2 < 2))
    (hsep : RectanglesSeparated S R) (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M) :
    |maskedTypeFieldSum n r S R w V H - (n : ℝ)^2/4*
      (∫ z : ℝ × ℝ, eraseGrid V H (rectangleField S R w) z.1 z.2)| ≤
        (n : ℝ)*M*(3*(S.card : ℝ)+(V.card : ℝ)+(H.card : ℝ)) := by
  have hraw := typeFieldSum_area_error n r S R w M hn hM hr hR
    (fun i hi => by rw [abs_of_nonneg (hw i hi).1]; exact (hw i hi).2)
  have hloss := sum_eraseBoard_loss (typePoints n r) V H
    (fun q => rectangleField S R w ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n)) M hn hM
    (fun q => rectangleField_point_bounds S R w M _ _ hM hsep hw)
  simp_rw [eraseBoard_field_eq] at hloss
  change 0 ≤ typeFieldSum n r S R w-maskedTypeFieldSum n r S R w V H ∧
    typeFieldSum n r S R w-maskedTypeFieldSum n r S R w V H ≤
      (n : ℝ)*((V.card : ℝ)+(H.card : ℝ))*M at hloss
  rw [eraseGrid_plane_integral_eq,abs_le]
  rw [abs_le] at hraw
  constructor <;> nlinarith [hloss.1,hloss.2,hraw.1,hraw.2]

def maskedTypedAreaIntegralSum {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) : ℝ :=
  ∑ t : GridType, ∫ z : ℝ × ℝ, eraseGrid V H (rectangleField S R (w (gridTypeZ t))) z.1 z.2

theorem maskedTypedAreaIntegralSum_eq {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) :
    maskedTypedAreaIntegralSum S R w V H = typedAreaIntegralSum S R w := by
  unfold maskedTypedAreaIntegralSum typedAreaIntegralSum
  apply Finset.sum_congr rfl
  intro t ht
  exact eraseGrid_plane_integral_eq V H _

theorem masked_board_area_error {ι : Type*} (n : ℕ) (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M) :
    |(∑ q : Grid n, maskedTypedBoardWeight S R w V H q) -
      (n : ℝ)^2/4*maskedTypedAreaIntegralSum S R w V H| ≤
        (n : ℝ)*M*(12*(S.card : ℝ)+(V.card : ℝ)+(H.card : ℝ)) := by
  have hraw := typedBoardWeight_area_error n S R w M hn hM hR
    (fun r i hi => by rw [abs_of_nonneg (hw r i hi).1]; exact (hw r i hi).2)
  have hloss := sum_eraseBoard_loss (Finset.univ : Finset (Grid n)) V H
    (typedBoardWeight S R w) M hn hM
    (fun q => rectangleField_point_bounds S R _ M _ _ hM hsep (hw _))
  simp_rw [← maskedTypedBoardWeight_eq_eraseBoard] at hloss
  rw [maskedTypedAreaIntegralSum_eq,abs_le]
  rw [abs_le] at hraw
  constructor <;> nlinarith [hloss.1,hloss.2,hraw.1,hraw.2]

theorem normalize_area_error (A I C n : ℝ) (hn : 0 < n)
    (he : |A-n^2/4*I| ≤ n*C) : |A/n^2-(1/4 : ℝ)*I| ≤ C/n := by
  have hid : A/n^2-(1/4 : ℝ)*I = (A-n^2/4*I)/n^2 := by
    field_simp [ne_of_gt hn]
    <;> ring
  rw [hid,abs_div,abs_of_nonneg (sq_nonneg n)]
  calc
    _ ≤ (n*C)/n^2 := div_le_div_of_nonneg_right he (sq_nonneg n)
    _ = C/n := by field_simp [ne_of_gt hn]

theorem masked_type_normalized_area_error {ι : Type*} (n : ℕ) (r : ZPoint) (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (V H : Finset ℝ) (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M)
    (hr : (0 ≤ r.1 ∧ r.1 < 2) ∧ (0 ≤ r.2 ∧ r.2 < 2))
    (hsep : RectanglesSeparated S R) (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hw : ∀ i ∈ S, 0 ≤ w i ∧ w i ≤ M) :
    |maskedTypeFieldSum n r S R w V H/(n : ℝ)^2 - (1/4 : ℝ)*
      (∫ z : ℝ × ℝ, eraseGrid V H (rectangleField S R w) z.1 z.2)| ≤
        M*(3*(S.card : ℝ)+(V.card : ℝ)+(H.card : ℝ))/(n : ℝ) := by
  apply normalize_area_error _ _ _ _ (by exact_mod_cast hn)
  simpa only [mul_assoc] using masked_type_area_error n r S R w V H M hn hM hr hsep hR hw

theorem masked_board_normalized_area_error {ι : Type*} (n : ℕ) (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M)
    (hsep : RectanglesSeparated S R) (hR : ∀ i ∈ S, (R i).InUnitSquare)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M) :
    |(∑ q : Grid n, maskedTypedBoardWeight S R w V H q)/(n : ℝ)^2 -
      (1/4 : ℝ)*maskedTypedAreaIntegralSum S R w V H| ≤
        M*(12*(S.card : ℝ)+(V.card : ℝ)+(H.card : ℝ))/(n : ℝ) := by
  apply normalize_area_error _ _ _ _ (by exact_mod_cast hn)
  simpa only [mul_assoc] using masked_board_area_error n S R w V H M hn hM hsep hR hw

end NoThreeLine.GridArea

#print axioms NoThreeLine.GridArea.masked_type_area_error
#print axioms NoThreeLine.GridArea.masked_board_normalized_area_error
