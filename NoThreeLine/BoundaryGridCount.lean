import NoThreeLine.PrimitiveLines

/-! Actual board points on arbitrary finite real vertical/horizontal lines.
No divisibility of the board size by a boundary-grid denominator is needed. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.GridArea

def boundaryCoordinates (n : ℕ) (V : Finset ℝ) : Finset (Fin n) :=
  Finset.univ.filter (fun k => (k.val : ℝ)/n ∈ V)

def boundaryPoints (n : ℕ) (V H : Finset ℝ) : Finset (Grid n) :=
  Finset.univ.filter (fun q => (q.1.val : ℝ)/n ∈ V ∨ (q.2.val : ℝ)/n ∈ H)

theorem boundaryCoordinates_card_le (n : ℕ) (V : Finset ℝ) (hn : 0 < n) :
    (boundaryCoordinates n V).card ≤ V.card := by
  classical
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hi : Function.Injective (fun k : Fin n => (k.val : ℝ)/n) := by
    intro i j he
    apply Fin.ext
    have hh : (i.val : ℝ)=(j.val : ℝ) := (div_left_inj' hnR.ne').mp he
    exact_mod_cast hh
  calc
    _ = ((boundaryCoordinates n V).image (fun k => (k.val : ℝ)/n)).card :=
      (Finset.card_image_of_injective (s := boundaryCoordinates n V) hi).symm
    _ ≤ V.card := by
      apply Finset.card_le_card
      intro x hx
      obtain ⟨k,hk,rfl⟩ := Finset.mem_image.mp hx
      exact (Finset.mem_filter.mp hk).2

theorem boundaryPoints_eq_union (n : ℕ) (V H : Finset ℝ) :
    boundaryPoints n V H =
      ((boundaryCoordinates n V).product Finset.univ) ∪
        (Finset.univ.product (boundaryCoordinates n H)) := by
  classical
  ext q
  simp [boundaryPoints,boundaryCoordinates,Finset.product_eq_sprod]

theorem boundaryPoints_card_le (n : ℕ) (V H : Finset ℝ) (hn : 0 < n) :
    (boundaryPoints n V H).card ≤ n*(V.card+H.card) := by
  rw [boundaryPoints_eq_union]
  calc
    _ ≤ ((boundaryCoordinates n V).product Finset.univ).card +
        (Finset.univ.product (boundaryCoordinates n H)).card := Finset.card_union_le _ _
    _ = (boundaryCoordinates n V).card*n+n*(boundaryCoordinates n H).card := by
      simp [Finset.product_eq_sprod]
    _ ≤ V.card*n+n*H.card := Nat.add_le_add
      (Nat.mul_le_mul_right n (boundaryCoordinates_card_le n V hn))
      (Nat.mul_le_mul_left n (boundaryCoordinates_card_le n H hn))
    _ = _ := by ring

def eraseBoard {n : ℕ} (V H : Finset ℝ) (a : Grid n → ℝ) (q : Grid n) : ℝ :=
  if q ∈ boundaryPoints n V H then 0 else a q

theorem sum_eraseBoard_difference {n : ℕ} (U : Finset (Grid n)) (V H : Finset ℝ)
    (a : Grid n → ℝ) :
    (∑ q ∈ U, a q)-(∑ q ∈ U, eraseBoard V H a q) =
      ∑ q ∈ U.filter (fun q => q ∈ boundaryPoints n V H), a q := by
  classical
  rw [← Finset.sum_sub_distrib,Finset.sum_filter]
  apply Finset.sum_congr rfl
  intro q hq
  unfold eraseBoard
  split_ifs <;> simp

theorem sum_eraseBoard_loss {n : ℕ} (U : Finset (Grid n)) (V H : Finset ℝ)
    (a : Grid n → ℝ) (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M)
    (ha : ∀ q, 0 ≤ a q ∧ a q ≤ M) :
    0 ≤ (∑ q ∈ U, a q)-(∑ q ∈ U, eraseBoard V H a q) ∧
      (∑ q ∈ U, a q)-(∑ q ∈ U, eraseBoard V H a q) ≤
        (n : ℝ)*((V.card : ℝ)+(H.card : ℝ))*M := by
  classical
  rw [sum_eraseBoard_difference]
  constructor
  · exact Finset.sum_nonneg (fun q _ => (ha q).1)
  · have hsub : U.filter (fun q => q ∈ boundaryPoints n V H) ⊆ boundaryPoints n V H := by
      intro q hq
      exact (Finset.mem_filter.mp hq).2
    have hc : ((U.filter (fun q => q ∈ boundaryPoints n V H)).card : ℝ) ≤
        (n : ℝ)*((V.card : ℝ)+(H.card : ℝ)) := by
      exact_mod_cast (Finset.card_le_card hsub).trans (boundaryPoints_card_le n V H hn)
    calc
      _ ≤ ∑ _q ∈ U.filter (fun q => q ∈ boundaryPoints n V H), M :=
        Finset.sum_le_sum (fun q _ => (ha q).2)
      _ = ((U.filter (fun q => q ∈ boundaryPoints n V H)).card : ℝ)*M := by simp
      _ ≤ _ := mul_le_mul_of_nonneg_right hc hM

end NoThreeLine.GridArea

#print axioms NoThreeLine.GridArea.boundaryPoints_card_le
#print axioms NoThreeLine.GridArea.sum_eraseBoard_loss
