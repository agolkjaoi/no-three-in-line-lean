import NoThreeLine.FourDirectionFamilies
import NoThreeLine.AxisMainBound

/-! G14 as a one-sided bound for the actual full-board collinear-pair sum.
The four primitive families are actual directional chords, and both actual
axis chords are absorbed into a root-independent constant. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.FiniteDirections
open PrimitiveLines

theorem typed_four_family_pair_bound {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (p : Grid n)
    (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    normalizedPairSum p (typedBoardWeight S R w) ≤
      (1/8 : ℝ)*(∑ z ∈ familyLabels n, (familyChord S R w p z)^2/(z.2.2 : ℝ)^2) +
        ((4*S.card+1)*M)^2 + 4*M*((4*S.card+1)*M) + M^2 := by
  classical
  have hb := typed_collinear_pair_bound S R w p M hn hM hsep hw hR
  have hf := nonaxis_chord_sum_le_four_families S R w p
  have ha := axis_chord_sum_le S R w p M hM hsep hw hR
  have he := Finset.sum_filter_add_sum_filter_not (directionIndices n)
    (fun d => d.2.1 ≠ 0 ∧ d.2.2 ≠ 0)
    (fun d => (shellChord S R w p d)^2/(d.1 : ℝ)^2)
  linarith

theorem familyLabels_mono {n N : ℕ} (hnN : n ≤ N) : familyLabels n ⊆ familyLabels N := by
  intro z hz
  simp only [familyLabels,familyDomain,Finset.product_eq_sprod,Finset.mem_product,
    Finset.mem_univ,true_and,Finset.mem_filter,Finset.mem_Ico] at hz ⊢
  omega

/-- The inclusive cutoff `h ≤ n` and the safe constant in the frozen S6
statement. Duplicate diagonals only add nonnegative terms. -/
theorem typed_four_family_pair_bound_safe {ι : Type*} {n : ℕ}
    (S : Finset ι) (R : ι → Rect) (w : ZPoint → ι → ℝ) (p : Grid n)
    (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M) (hsep : RectanglesSeparated S R)
    (hw : ∀ r i, i ∈ S → 0 ≤ w r i ∧ w r i ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    normalizedPairSum p (typedBoardWeight S R w) ≤
      (1/8 : ℝ)*(∑ z ∈ familyLabels (n+1), (familyChord S R w p z)^2/(z.2.2 : ℝ)^2) +
        ((4*S.card+1)*M)^2 + 5*M*((4*S.card+1)*M) + 10*M^2 := by
  classical
  have hb := typed_four_family_pair_bound S R w p M hn hM hsep hw hR
  have hf : (∑ z ∈ familyLabels n, (familyChord S R w p z)^2/(z.2.2 : ℝ)^2) ≤
      ∑ z ∈ familyLabels (n+1), (familyChord S R w p z)^2/(z.2.2 : ℝ)^2 :=
    Finset.sum_le_sum_of_subset_of_nonneg (familyLabels_mono (by omega))
      (fun _ _ _ => by positivity)
  have he : 0 ≤ M*((4*S.card+1)*M) := by positivity
  nlinarith [sq_nonneg M]

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.typed_four_family_pair_bound
#print axioms NoThreeLine.FiniteDirections.typed_four_family_pair_bound_safe
