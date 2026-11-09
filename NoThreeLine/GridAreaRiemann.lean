import NoThreeLine.LatticeRiemann
import NoThreeLine.PrimitiveLines
import NoThreeLine.FieldCap

/-! Actual finite-board parity counts in rectangles. The endpoint errors
are independent of the location of the rectangle and the parity of n. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section
namespace NoThreeLine.GridArea
open PrimitiveLines

def coordinatePoints (n : ℕ) (ε : ℤ) (a b : ℝ) : Finset (Fin n) :=
  Finset.univ.filter (fun k => a < (k.val : ℝ)/n ∧ (k.val : ℝ)/n < b ∧ (k.val : ℤ)%2=ε)

theorem coordinate_image_eq (n : ℕ) (ε : ℤ) (a b : ℝ) (hn : 0 < n)
    (hε : 0 ≤ ε ∧ ε < 2) (ha : 0 ≤ a) (hb : b ≤ 1) :
    (coordinatePoints n ε a b).image (fun k => (k.val : ℤ)) =
      parityLatticeIndices 0 (1/(n : ℝ)) a b ε := by
  classical
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hs : (0 : ℝ) < 1/n := by positivity
  have hnorm (z : ℤ) : (0 : ℝ)+(1/n)*(z : ℝ) = (z : ℝ)/n := by ring
  ext z
  rw [mem_parityLatticeIndices _ _ _ _ hs _ hε,hnorm]
  constructor
  · intro hz
    obtain ⟨k,hk,rfl⟩ := Finset.mem_image.mp hz
    have hk' := (Finset.mem_filter.mp hk).2
    simpa using hk'
  · intro hz
    have hz0R : (0 : ℝ) < z :=
      (div_pos_iff_of_pos_right hnR).mp (ha.trans_lt hz.1)
    have hznR : (z : ℝ) < n := by
      have hh := (div_lt_iff₀ hnR).mp (hz.2.1.trans_le hb)
      simpa using hh
    have hz0 : 0 ≤ z := by exact_mod_cast hz0R.le
    have hzn : z < (n : ℤ) := by exact_mod_cast hznR
    let k : Fin n := ⟨z.toNat, by
      have hh : (z.toNat : ℤ) < n := by rw [Int.toNat_of_nonneg hz0]; exact hzn
      exact_mod_cast hh⟩
    have hval : (k.val : ℤ)=z := by dsimp [k]; exact Int.toNat_of_nonneg hz0
    have hreal : (k.val : ℝ)=(z : ℝ) := by exact_mod_cast hval
    apply Finset.mem_image.mpr
    refine ⟨k,Finset.mem_filter.mpr ⟨Finset.mem_univ _,?_⟩,hval⟩
    simpa only [hreal,hval] using hz

theorem coordinate_card_eq (n : ℕ) (ε : ℤ) (a b : ℝ) (hn : 0 < n)
    (hε : 0 ≤ ε ∧ ε < 2) (ha : 0 ≤ a) (hb : b ≤ 1) :
    (coordinatePoints n ε a b).card = (parityLatticeIndices 0 (1/(n : ℝ)) a b ε).card := by
  have hi : Function.Injective (fun k : Fin n => (k.val : ℤ)) := by
    intro i j he
    apply Fin.ext
    change (i.val : ℤ)=(j.val : ℤ) at he
    exact_mod_cast he
  have hc := Finset.card_image_of_injective (s := coordinatePoints n ε a b) hi
  rw [coordinate_image_eq n ε a b hn hε ha hb] at hc
  exact hc.symm

theorem coordinate_card_le (n : ℕ) (ε : ℤ) (a b : ℝ) :
    (coordinatePoints n ε a b).card ≤ n := by
  calc
    _ ≤ (Finset.univ : Finset (Fin n)).card := Finset.card_filter_le _ _
    _ = n := by simp

theorem coordinate_card_error (n : ℕ) (ε : ℤ) (a b : ℝ) (hn : 0 < n)
    (hε : 0 ≤ ε ∧ ε < 2) (ha : 0 ≤ a) (hab : a ≤ b) (hb : b ≤ 1) :
    |((coordinatePoints n ε a b).card : ℝ)-(n : ℝ)*(b-a)/2| ≤ 2 := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  rw [coordinate_card_eq n ε a b hn hε ha hb]
  have he := parityLatticeIndices_card_error 0 (1/(n : ℝ)) a b (by positivity) ε
  have hm : max 0 (b-a)/(2*(1/(n : ℝ))) = (n : ℝ)*(b-a)/2 := by
    rw [max_eq_right (sub_nonneg.mpr hab)]
    field_simp
  simpa only [hm] using he

def rectanglePoints (n : ℕ) (r : ZPoint) (R : Rect) : Finset (Grid n) :=
  (coordinatePoints n r.1 R.x0 R.x1).product (coordinatePoints n r.2 R.y0 R.y1)

theorem mem_rectanglePoints (n : ℕ) (r : ZPoint) (R : Rect) (q : Grid n) :
    q ∈ rectanglePoints n r R ↔
      R.contains ((q.1.val : ℝ)/n) ((q.2.val : ℝ)/n) ∧ parity (gridEmbed q)=r := by
  simp only [rectanglePoints,Finset.product_eq_sprod,Finset.mem_product,coordinatePoints,
    Finset.mem_filter,Finset.mem_univ,true_and,Rect.contains,parity,gridEmbed,Prod.ext_iff]
  tauto

theorem count_product_error (cx cy A B n : ℝ) (hcy : 0 ≤ cy) (hcyn : cy ≤ n)
    (hA : 0 ≤ A) (hAn : A ≤ n/2) (hn : 0 ≤ n)
    (hex : |cx-A| ≤ 2) (hey : |cy-B| ≤ 2) :
    |cx*cy-A*B| ≤ 3*n := by
  have he : cx*cy-A*B = (cx-A)*cy+A*(cy-B) := by ring
  rw [he]
  calc
    _ ≤ |(cx-A)*cy|+|A*(cy-B)| := abs_add_le _ _
    _ = |cx-A| * cy + A * |cy-B| := by rw [abs_mul,abs_mul,abs_of_nonneg hcy,abs_of_nonneg hA]
    _ ≤ 2*n+(n/2)*2 := add_le_add
      (mul_le_mul hex hcyn hcy (by norm_num))
      (mul_le_mul hAn hey (abs_nonneg _) (by positivity))
    _ = 3*n := by ring

theorem rectangle_card_error (n : ℕ) (r : ZPoint) (R : Rect) (hn : 0 < n)
    (hr : (0 ≤ r.1 ∧ r.1 < 2) ∧ (0 ≤ r.2 ∧ r.2 < 2)) (hR : R.InUnitSquare) :
    |((rectanglePoints n r R).card : ℝ) -
      (n : ℝ)^2/4*((R.x1-R.x0)*(R.y1-R.y0))| ≤ 3*(n : ℝ) := by
  have hnR : (0 : ℝ) < n := by exact_mod_cast hn
  have hx := coordinate_card_error n r.1 R.x0 R.x1 hn hr.1 hR.1 hR.2.1 hR.2.2.1
  have hy := coordinate_card_error n r.2 R.y0 R.y1 hn hr.2
    hR.2.2.2.1 hR.2.2.2.2.1 hR.2.2.2.2.2
  have hcy : (0 : ℝ) ≤ (coordinatePoints n r.2 R.y0 R.y1).card := by positivity
  have hcyn : ((coordinatePoints n r.2 R.y0 R.y1).card : ℝ) ≤ n := by
    exact_mod_cast coordinate_card_le n r.2 R.y0 R.y1
  have hA : 0 ≤ (n : ℝ)*(R.x1-R.x0)/2 := by
    exact div_nonneg (mul_nonneg hnR.le (sub_nonneg.mpr hR.2.1)) (by norm_num)
  have hAn : (n : ℝ)*(R.x1-R.x0)/2 ≤ n/2 := by
    have hwidth : R.x1-R.x0 ≤ 1 := by linarith [hR.1,hR.2.2.1]
    nlinarith
  have he := count_product_error _ _ _ _ (n : ℝ) hcy hcyn hA hAn hnR.le hx hy
  have hmain : ((n : ℝ)*(R.x1-R.x0)/2)*((n : ℝ)*(R.y1-R.y0)/2) =
      (n : ℝ)^2/4*((R.x1-R.x0)*(R.y1-R.y0)) := by ring
  simpa only [rectanglePoints,Finset.product_eq_sprod,Finset.card_product,Nat.cast_mul,hmain] using he

end NoThreeLine.GridArea

#print axioms NoThreeLine.GridArea.coordinate_card_error
#print axioms NoThreeLine.GridArea.rectangle_card_error
