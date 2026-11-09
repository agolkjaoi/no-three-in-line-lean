import NoThreeLine.FourFamilyPairBound

/-! Boundary erasure for the one-sided board-pair bound. The discrete
weights decrease; the non-axis main chords agree exactly. No equality of
discrete weights or of axis chords is assumed or asserted. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FiniteDirections
open PrimitiveLines GridChord

theorem collinearPairSum_mono {n : ℕ} (p : Grid n) (a b : Grid n → ℝ)
    (ha : ∀ q, 0 ≤ a q) (hab : ∀ q, a q ≤ b q) :
    collinearPairSum p a ≤ collinearPairSum p b := by
  classical
  apply Finset.sum_le_sum
  intro q hq
  apply Finset.sum_le_sum
  intro r hr
  split_ifs
  · exact mul_le_mul (hab q) (hab r) (ha r) ((ha q).trans (hab q))
  · exact le_refl 0

theorem normalizedPairSum_mono {n : ℕ} (p : Grid n) (a b : Grid n → ℝ)
    (ha : ∀ q, 0 ≤ a q) (hab : ∀ q, a q ≤ b q) :
    normalizedPairSum p a ≤ normalizedPairSum p b :=
  div_le_div_of_nonneg_right (collinearPairSum_mono p a b ha hab) (by positivity)

def maskedTypedBoardWeight {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (q : Grid n) : ℝ :=
  eraseGrid V H (rectangleField S R (w (parity (gridEmbed q))))
    (normX n (gridEmbed q)) (normY n (gridEmbed q))

theorem maskedTypedBoardWeight_bounds {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (q : Grid n)
    (hq : 0 ≤ typedBoardWeight S R w q) :
    0 ≤ maskedTypedBoardWeight S R w V H q ∧
      maskedTypedBoardWeight S R w V H q ≤ typedBoardWeight S R w q := by
  classical
  unfold maskedTypedBoardWeight eraseGrid
  split_ifs
  · exact ⟨le_refl 0,hq⟩
  · exact ⟨hq,le_refl _⟩

def maskedFamilyChord {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n) (z : FamilyLabel) : ℝ :=
  directionalChord z.1 (eraseGrid V H
    (rectangleField S R (directionPairWeight w p (familyVector z))))
    (normX n (gridEmbed p)) (normY n (gridEmbed p)) ((z.2.1 : ℝ)/(z.2.2 : ℝ))

/-- Positive `a/h` is derived from the actual family-label membership. -/
theorem maskedFamilyChord_eq {ι : Type*} {n : ℕ} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n) (N : ℕ)
    (z : FamilyLabel) (hz : z ∈ familyLabels N) :
    maskedFamilyChord S R w V H p z = familyChord S R w p z := by
  have hpos : 0 < z.2.1 ∧ 0 < z.2.2 := by
    simp only [familyLabels,familyDomain,Finset.product_eq_sprod,Finset.mem_product,
      Finset.mem_univ,true_and,Finset.mem_filter,Finset.mem_Ico] at hz
    omega
  apply directionalChord_eraseGrid
  apply ne_of_gt
  exact div_pos (by exact_mod_cast hpos.1) (by exact_mod_cast hpos.2)

theorem masked_four_family_pair_bound {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n)
    (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    normalizedPairSum p (maskedTypedBoardWeight S R w V H) ≤
      (1/8 : ℝ)*(∑ z ∈ familyLabels n, (maskedFamilyChord S R w V H p z)^2/(z.2.2 : ℝ)^2) +
        ((4*S.card+1)*M)^2 + 4*M*((4*S.card+1)*M) + M^2 := by
  have hb (q : Grid n) := maskedTypedBoardWeight_bounds S R w V H q
    (rectangleField_point_bounds S R _ M _ _ hM hsep (hw _)).1
  apply (normalizedPairSum_mono p _ _ (fun q => (hb q).1) (fun q => (hb q).2)).trans
  have he : (∑ z ∈ familyLabels n, (maskedFamilyChord S R w V H p z)^2/(z.2.2 : ℝ)^2) =
      ∑ z ∈ familyLabels n, (familyChord S R w p z)^2/(z.2.2 : ℝ)^2 := by
    apply Finset.sum_congr rfl
    intro z hz
    rw [maskedFamilyChord_eq S R w V H p n z hz]
  rw [he]
  exact typed_four_family_pair_bound S R w p M hn hM hsep hw hR

theorem masked_four_family_pair_bound_safe {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (V H : Finset ℝ) (p : Grid n)
    (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    normalizedPairSum p (maskedTypedBoardWeight S R w V H) ≤
      (1/8 : ℝ)*(∑ z ∈ familyLabels (n+1),
        (maskedFamilyChord S R w V H p z)^2/(z.2.2 : ℝ)^2) +
        ((4*S.card+1)*M)^2 + 5*M*((4*S.card+1)*M) + 10*M^2 := by
  have hb (q : Grid n) := maskedTypedBoardWeight_bounds S R w V H q
    (rectangleField_point_bounds S R _ M _ _ hM hsep (hw _)).1
  apply (normalizedPairSum_mono p _ _ (fun q => (hb q).1) (fun q => (hb q).2)).trans
  have he : (∑ z ∈ familyLabels (n+1), (maskedFamilyChord S R w V H p z)^2/(z.2.2 : ℝ)^2) =
      ∑ z ∈ familyLabels (n+1), (familyChord S R w p z)^2/(z.2.2 : ℝ)^2 := by
    apply Finset.sum_congr rfl
    intro z hz
    rw [maskedFamilyChord_eq S R w V H p (n+1) z hz]
  rw [he]
  exact typed_four_family_pair_bound_safe S R w p M hn hM hsep hw hR

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.collinearPairSum_mono
#print axioms NoThreeLine.FiniteDirections.maskedFamilyChord_eq
#print axioms NoThreeLine.FiniteDirections.masked_four_family_pair_bound_safe
