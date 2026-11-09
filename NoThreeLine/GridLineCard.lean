import NoThreeLine.FiniteDirectionSums

/-! Cardinal bounds for the actual finite grid intersection of a primitive line.
The integer parameter set is constructed by Bezout in `PrimitiveLines`; the
line length estimate is proved here, not supplied as a hypothesis. -/
set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine.GridLineCard
open PrimitiveLines FiniteDirections

def height (d : ZPoint) : ℕ := max d.1.natAbs d.2.natAbs

theorem height_pos (d : ZPoint) (hd : Primitive d) : 0 < height d := by
  by_contra hn
  have hx : d.1.natAbs = 0 := by dsimp [height] at hn; omega
  have hy : d.2.natAbs = 0 := by dsimp [height] at hn; omega
  exact primitive_ne_zero d hd (Prod.ext (Int.natAbs_eq_zero.mp hx) (Int.natAbs_eq_zero.mp hy))

/-- A coordinate of a grid line bounds the spread of its integer parameters. -/
theorem coordinate_span (n : ℕ) (x d k l : ℤ)
    (hk0 : 0 ≤ x+k*d) (hkn : x+k*d < n)
    (hl0 : 0 ≤ x+l*d) (hln : x+l*d < n) (hkl : k ≤ l) :
    (l-k)*(d.natAbs : ℤ) ≤ (n-1 : ℕ) := by
  have hn : 1 ≤ n := by omega
  have he : ((n-1 : ℕ) : ℤ) = (n : ℤ)-1 := by omega
  have hb : |(l-k)*d| ≤ (n : ℤ)-1 := by
    rw [abs_le]
    constructor <;> nlinarith
  rw [abs_mul, abs_of_nonneg (sub_nonneg.mpr hkl), ← Int.natCast_natAbs] at hb
  simpa only [he] using hb

theorem parameter_span (n : ℕ) (p d : ZPoint) (hd : Primitive d)
    (k l : ℤ) (hk : k ∈ gridLineParameters n p d)
    (hl : l ∈ gridLineParameters n p d) (hkl : k ≤ l) :
    (l-k)*(height d : ℤ) ≤ (n-1 : ℕ) := by
  have hk' := (mem_gridLineParameters n p d hd k).mp hk
  have hl' := (mem_gridLineParameters n p d hd l).mp hl
  dsimp [InGrid, linePoint] at hk' hl'
  rcases le_total d.1.natAbs d.2.natAbs with hh | hh
  · simpa only [height, max_eq_right hh] using
      coordinate_span n p.2 d.2 k l hk'.2.2.1 hk'.2.2.2 hl'.2.2.1 hl'.2.2.2 hkl
  · simpa only [height, max_eq_left hh] using
      coordinate_span n p.1 d.1 k l hk'.1 hk'.2.1 hl'.1 hl'.2.1 hkl

/-- A finite integer set with bounded diameter after multiplication by a
positive natural `h` lies in an interval of at most `M / h + 1` integers. -/
theorem int_finset_card_le (S : Finset ℤ) (h M : ℕ) (hh : 0 < h)
    (hspan : ∀ k ∈ S, ∀ l ∈ S, k ≤ l → (l-k)*(h : ℤ) ≤ M) :
    S.card ≤ M/h+1 := by
  classical
  by_cases hS : S.Nonempty
  · let a := S.min' hS
    have ha : a ∈ S := S.min'_mem hS
    have hs : S ⊆ Finset.Icc a (a+(M/h : ℕ)) := by
      intro k hk
      have hak : a ≤ k := S.min'_le k hk
      have hb := hspan a ha k hk hak
      have he : ((k-a).toNat : ℤ) = k-a := Int.toNat_of_nonneg (sub_nonneg.mpr hak)
      have hm : (k-a).toNat*h ≤ M := by
        have hm' : ((k-a).toNat : ℤ)*(h : ℤ) ≤ M := by simpa only [he] using hb
        exact_mod_cast hm'
      have hq : (k-a).toNat ≤ M/h := (Nat.le_div_iff_mul_le hh).mpr hm
      have hq' : ((k-a).toNat : ℤ) ≤ (M/h : ℕ) := by exact_mod_cast hq
      apply Finset.mem_Icc.mpr
      constructor
      · exact hak
      · rw [he] at hq'
        omega
    calc
      S.card ≤ (Finset.Icc a (a+(M/h : ℕ))).card := Finset.card_le_card hs
      _ = M/h+1 := by
        rw [Int.card_Icc]
        have hnonneg : (0 : ℤ) ≤ (M/h : ℕ) := Int.natCast_nonneg _
        omega
  · have he : S = ∅ := Finset.not_nonempty_iff_eq_empty.mp hS
    simp [he]

/-- Exact floor upper bound, including empty grid intersections and all axes. -/
theorem gridLine_card_le (n : ℕ) (p d : ZPoint) (hd : Primitive d) :
    (gridLinePoints n p d).card ≤ (n-1)/height d+1 := by
  rw [gridLine_card_eq_parameters n p d hd]
  exact int_finset_card_le _ _ _ (height_pos d hd)
    (fun k hk l hl hkl => parameter_span n p d hd k l hk hl hkl)

theorem gridLine_card_mul_height_le (n : ℕ) (p d : ZPoint) (hd : Primitive d) :
    (gridLinePoints n p d).card * height d ≤ (n-1)+height d := by
  have hc := Nat.mul_le_mul_right (height d) (gridLine_card_le n p d hd)
  have hdiv := Nat.div_mul_le_self (n-1) (height d)
  nlinarith

theorem gridLine_card_le_real (n : ℕ) (p d : ZPoint) (hd : Primitive d) :
    ((gridLinePoints n p d).card : ℝ) ≤ 1+((n-1 : ℕ) : ℝ)/(height d : ℝ) := by
  have hh : (0 : ℝ) < height d := by exact_mod_cast height_pos d hd
  have hc : ((gridLinePoints n p d).card : ℝ)*(height d : ℝ) ≤
      ((n-1 : ℕ) : ℝ)+(height d : ℝ) := by
    exact_mod_cast gridLine_card_mul_height_le n p d hd
  calc
    _ ≤ (((n-1 : ℕ) : ℝ)+(height d : ℝ))/(height d : ℝ) :=
      (le_div_iff₀ hh).mpr hc
    _ = 1+((n-1 : ℕ) : ℝ)/(height d : ℝ) := by field_simp; ring

/-- The manuscript's coarse real estimate, for directions of height at most
the board size. In particular it applies to every direction joining two grid points. -/
theorem gridLine_card_le_two_mul_div (n : ℕ) (p d : ZPoint) (hd : Primitive d)
    (hhn : height d ≤ n) :
    ((gridLinePoints n p d).card : ℝ) ≤ 2*(n : ℝ)/(height d : ℝ) := by
  have hh : (0 : ℝ) < height d := by exact_mod_cast height_pos d hd
  apply (le_div_iff₀ hh).mpr
  have hc := (gridLine_card_mul_height_le n p d hd).trans (show (n-1)+height d ≤ 2*n by omega)
  exact_mod_cast hc

theorem height_eq_of_mem_shell (h : ℕ) (d : ZPoint) (hd : d ∈ primitiveShell h) :
    height d = h := by
  classical
  have hm := (mem_rawShell h d).mp (Finset.mem_filter.mp hd).1
  rcases hm with ⟨hx,hy0,hy1⟩ | ⟨hy,hx0,hx1⟩
  · have hy : d.2.natAbs ≤ h := by
      have he := Int.natCast_natAbs d.2
      have hb : |d.2| ≤ (h : ℤ) := abs_le.mpr ⟨hy0,hy1⟩
      rw [← he] at hb
      exact_mod_cast hb
    simp only [height, hx, Int.natAbs_natCast, max_eq_left hy]
  · have hx : d.1.natAbs ≤ h := by
      have he := Int.natCast_natAbs d.1
      have hb : |d.1| ≤ (h : ℤ) := abs_le.mpr ⟨by omega,by omega⟩
      rw [← he] at hb
      exact_mod_cast hb
    simp only [height, hy, Int.natAbs_natCast, max_eq_right hx]

theorem shell_gridLine_card_le (n h : ℕ) (p d : ZPoint)
    (hd : d ∈ primitiveShell h) (hhn : h ≤ n) :
    ((gridLinePoints n p d).card : ℝ) ≤ 2*(n : ℝ)/(h : ℝ) := by
  classical
  have hp : Primitive d := (Finset.mem_filter.mp hd).2
  have he := height_eq_of_mem_shell h d hd
  simpa only [he] using gridLine_card_le_two_mul_div n p d hp (by simpa only [he] using hhn)

theorem directionIndex_gridLine_card_le (n : ℕ) (p : ZPoint)
    (d : Σ _h : ℕ, ZPoint) (hd : d ∈ directionIndices n) :
    ((gridLinePoints n p d.2).card : ℝ) ≤ 2*(n : ℝ)/(d.1 : ℝ) := by
  have hm := Finset.mem_sigma.mp hd
  exact shell_gridLine_card_le n d.1 p d.2 hm.2 (Finset.mem_Ico.mp hm.1).2.le

end NoThreeLine.GridLineCard

#print axioms NoThreeLine.GridLineCard.gridLine_card_le
#print axioms NoThreeLine.GridLineCard.gridLine_card_le_two_mul_div
#print axioms NoThreeLine.GridLineCard.shell_gridLine_card_le
#print axioms NoThreeLine.GridLineCard.directionIndex_gridLine_card_le
