import NoThreeLine.GridAreaRiemann
import NoThreeLine.RectangleArea
import NoThreeLine.MaskedPairBound

/-! Type-wise area Riemann sums for actual finite rectangle fields. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.GridArea
open PrimitiveLines FiniteDirections

def typePoints (n : ℕ) (r : ZPoint) : Finset (Grid n) :=
  Finset.univ.filter (fun q => parity (gridEmbed q)=r)

def typeFieldSum {ι : Type*} (n : ℕ) (r : ZPoint) (S : Finset ι) (R : ι → Rect)
    (w : ι → ℝ) : ℝ :=
  ∑ q ∈ typePoints n r, rectangleField S R w ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n)

theorem rectangle_type_sum (n : ℕ) (r : ZPoint) (R : Rect) (w : ℝ) :
    (∑ q ∈ typePoints n r, R.field w ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n)) =
      w*((rectanglePoints n r R).card : ℝ) := by
  classical
  unfold Rect.field
  rw [← Finset.sum_filter]
  have hs : (typePoints n r).filter
      (fun q => R.contains ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n)) = rectanglePoints n r R := by
    ext q
    simp only [Finset.mem_filter,typePoints,Finset.mem_univ,true_and,mem_rectanglePoints]
    tauto
  rw [hs,Finset.sum_const,nsmul_eq_mul,mul_comm]

theorem typeFieldSum_eq_counts {ι : Type*} (n : ℕ) (r : ZPoint) (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) :
    typeFieldSum n r S R w = ∑ i ∈ S, w i*((rectanglePoints n r (R i)).card : ℝ) := by
  unfold typeFieldSum rectangleField
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro i hi
  exact rectangle_type_sum n r (R i) (w i)

/-- The area is the actual integral on `ℝ × ℝ`; separation is unnecessary
for this additive-field estimate. Signed cell weights are allowed. -/
theorem typeFieldSum_area_error {ι : Type*} (n : ℕ) (r : ZPoint) (S : Finset ι)
    (R : ι → Rect) (w : ι → ℝ) (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M)
    (hr : (0 ≤ r.1 ∧ r.1 < 2) ∧ (0 ≤ r.2 ∧ r.2 < 2))
    (hR : ∀ i ∈ S, (R i).InUnitSquare) (hw : ∀ i ∈ S, |w i| ≤ M) :
    |typeFieldSum n r S R w - (n : ℝ)^2/4*(∫ z : ℝ × ℝ, rectangleField S R w z.1 z.2)|
      ≤ 3*(n : ℝ)*(S.card : ℝ)*M := by
  classical
  rw [rectangleField_plane_integral,typeFieldSum_eq_counts,Finset.mul_sum,← Finset.sum_sub_distrib]
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  calc
    _ ≤ ∑ _i ∈ S, M*(3*(n : ℝ)) := by
      apply Finset.sum_le_sum
      intro i hi
      have hc := rectangle_card_error n r (R i) hn hr (hR i hi)
      rw [← (R i).area_of_ordered (hR i hi).2.1 (hR i hi).2.2.2.2.1] at hc
      have he : w i*((rectanglePoints n r (R i)).card : ℝ) -
          (n : ℝ)^2/4*(w i*(R i).area) =
            w i*(((rectanglePoints n r (R i)).card : ℝ)-(n : ℝ)^2/4*(R i).area) := by ring
      rw [he,abs_mul]
      exact mul_le_mul (hw i hi) hc (abs_nonneg _) hM
    _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul]; ring

abbrev GridType := Fin 2 × Fin 2

def gridTypeZ (t : GridType) : ZPoint := ((t.1.val : ℤ),(t.2.val : ℤ))

def pointType {n : ℕ} (q : Grid n) : GridType :=
  (⟨q.1.val%2,Nat.mod_lt _ (by decide)⟩,⟨q.2.val%2,Nat.mod_lt _ (by decide)⟩)

theorem gridTypeZ_pointType {n : ℕ} (q : Grid n) : gridTypeZ (pointType q)=parity (gridEmbed q) := by
  apply Prod.ext <;> dsimp [gridTypeZ,pointType,parity,gridEmbed] <;> omega

theorem gridTypeZ_injective : Function.Injective gridTypeZ := by
  intro t u he
  apply Prod.ext
  · apply Fin.ext
    have hh := congrArg Prod.fst he
    dsimp [gridTypeZ] at hh
    exact_mod_cast hh
  · apply Fin.ext
    have hh := congrArg Prod.snd he
    dsimp [gridTypeZ] at hh
    exact_mod_cast hh

theorem gridTypeZ_legal (t : GridType) :
    (0 ≤ (gridTypeZ t).1 ∧ (gridTypeZ t).1 < 2) ∧
      (0 ≤ (gridTypeZ t).2 ∧ (gridTypeZ t).2 < 2) := by
  dsimp [gridTypeZ]
  exact ⟨⟨by positivity,by exact_mod_cast t.1.isLt⟩,
    ⟨by positivity,by exact_mod_cast t.2.isLt⟩⟩

theorem typePoints_eq_fiber (n : ℕ) (t : GridType) :
    typePoints n (gridTypeZ t) = Finset.univ.filter (fun q : Grid n => pointType q=t) := by
  ext q
  simp only [typePoints,Finset.mem_filter,Finset.mem_univ,true_and]
  rw [← gridTypeZ_pointType]
  exact gridTypeZ_injective.eq_iff

def typedAreaIntegralSum {ι : Type*} (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) : ℝ :=
  ∑ t : GridType, ∫ z : ℝ × ℝ, rectangleField S R (w (gridTypeZ t)) z.1 z.2

theorem sum_typedBoardWeight_eq_types {ι : Type*} (n : ℕ) (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) :
    (∑ q : Grid n, typedBoardWeight S R w q) =
      ∑ t : GridType, typeFieldSum n (gridTypeZ t) S R (w (gridTypeZ t)) := by
  classical
  calc
    _ = ∑ t : GridType, ∑ q ∈ Finset.univ.filter (fun q : Grid n => pointType q=t),
        typedBoardWeight S R w q :=
      (Finset.sum_fiberwise_of_maps_to (fun q (_hq : q ∈ (Finset.univ : Finset (Grid n))) =>
        (Finset.mem_univ (pointType q))) _).symm
    _ = _ := by
      apply Finset.sum_congr rfl
      intro t ht
      rw [← typePoints_eq_fiber]
      unfold typeFieldSum
      apply Finset.sum_congr rfl
      intro q hq
      have hp : parity (gridEmbed q)=gridTypeZ t := (Finset.mem_filter.mp hq).2
      unfold typedBoardWeight
      rw [hp]
      simp only [GridChord.normX,GridChord.normY,gridEmbed,Int.cast_natCast]

theorem typedBoardWeight_area_error {ι : Type*} (n : ℕ) (S : Finset ι) (R : ι → Rect)
    (w : ZPoint → ι → ℝ) (M : ℝ) (hn : 0 < n) (hM : 0 ≤ M)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) (hw : ∀ r i, i ∈ S → |w r i| ≤ M) :
    |(∑ q : Grid n, typedBoardWeight S R w q)-(n : ℝ)^2/4*typedAreaIntegralSum S R w|
      ≤ 12*(n : ℝ)*(S.card : ℝ)*M := by
  classical
  rw [sum_typedBoardWeight_eq_types,typedAreaIntegralSum,Finset.mul_sum,← Finset.sum_sub_distrib]
  apply (Finset.abs_sum_le_sum_abs _ _).trans
  calc
    _ ≤ ∑ _t : GridType, 3*(n : ℝ)*(S.card : ℝ)*M :=
      Finset.sum_le_sum (fun t _ => typeFieldSum_area_error n (gridTypeZ t) S R (w (gridTypeZ t))
        M hn hM (gridTypeZ_legal t) hR (hw _))
    _ = _ := by
      simp only [Finset.sum_const,Finset.card_univ,Fintype.card_prod,Fintype.card_fin,nsmul_eq_mul]
      norm_num
      <;> ring

end NoThreeLine.GridArea

#print axioms NoThreeLine.GridArea.typeFieldSum_area_error
#print axioms NoThreeLine.GridArea.typedBoardWeight_area_error
