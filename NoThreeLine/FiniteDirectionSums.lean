import NoThreeLine.PrimitiveLines
import Mathlib.Data.Int.Interval
import Mathlib.Algebra.BigOperators.Intervals
import Mathlib.Algebra.BigOperators.Group.Finset.Sigma

/-! Actual finite primitive directions, with one representative modulo sign.
The horizontal boundary includes its corners; the vertical boundary omits
them. Thus the two axes are included and diagonals are not counted twice. -/
set_option autoImplicit false
open scoped BigOperators
noncomputable section

namespace NoThreeLine.FiniteDirections
open PrimitiveLines

def rawShell (h : ℕ) : Finset ZPoint :=
  ((Finset.Icc (-(h : ℤ)) h).image (fun a => ((h : ℤ), a))) ∪
  ((Finset.Ioo (-(h : ℤ)) h).image (fun a => (a, (h : ℤ))))

def primitiveShell (h : ℕ) : Finset ZPoint := by
  classical
  exact (rawShell h).filter Primitive

def directionIndices (n : ℕ) : Finset (Σ _h : ℕ, ZPoint) :=
  (Finset.Ico 1 n).sigma primitiveShell

theorem mem_rawShell (h : ℕ) (d : ZPoint) :
    d ∈ rawShell h ↔
      (d.1 = h ∧ -(h : ℤ) ≤ d.2 ∧ d.2 ≤ h) ∨
      (d.2 = h ∧ -(h : ℤ) < d.1 ∧ d.1 < h) := by
  rcases d with ⟨x,y⟩
  simp [rawShell, Prod.mk.injEq]
  aesop

theorem primitiveShell_card_le (h : ℕ) (hh : 0 < h) :
    (primitiveShell h).card ≤ 4*h := by
  classical
  calc
    (primitiveShell h).card ≤ (rawShell h).card := Finset.card_filter_le _ _
    _ ≤ (Finset.Icc (-(h : ℤ)) h).card + (Finset.Ioo (-(h : ℤ)) h).card :=
      (Finset.card_union_le _ _).trans (Nat.add_le_add (Finset.card_image_le) (Finset.card_image_le))
    _ = 4*h := by rw [Int.card_Icc, Int.card_Ioo]; omega

theorem directionIndices_card_le (n : ℕ) :
    (directionIndices n).card ≤ 2*n*(n-1) := by
  rw [directionIndices, Finset.card_sigma]
  calc
    ∑ h ∈ Finset.Ico 1 n, (primitiveShell h).card ≤ ∑ h ∈ Finset.Ico 1 n, 4*h :=
      Finset.sum_le_sum (fun h hh => primitiveShell_card_le h (Finset.mem_Ico.mp hh).1)
    _ ≤ ∑ h ∈ Finset.range n, 4*h := by
      apply Finset.sum_le_sum_of_subset_of_nonneg
      · intro h hh; exact Finset.mem_range.mpr (Finset.mem_Ico.mp hh).2
      · intros; omega
    _ = 2*n*(n-1) := by
      rw [← Finset.mul_sum]
      have he := Finset.sum_range_id_mul_two n
      nlinarith

theorem sum_inverse_height_le (n : ℕ) :
    (∑ d ∈ directionIndices n, (1 : ℝ)/(d.1 : ℝ)) ≤ 4*(n-1 : ℕ) := by
  rw [directionIndices, Finset.sum_sigma]
  calc
    ∑ h ∈ Finset.Ico 1 n, ∑ _d ∈ primitiveShell h, (1 : ℝ)/(h : ℝ)
        ≤ ∑ _h ∈ Finset.Ico 1 n, (4 : ℝ) := by
      apply Finset.sum_le_sum
      intro h hh
      have hp : 0 < h := (Finset.mem_Ico.mp hh).1
      have hpR : (0 : ℝ) < h := by exact_mod_cast hp
      have hc : ((primitiveShell h).card : ℝ) ≤ 4*(h : ℝ) := by
        exact_mod_cast primitiveShell_card_le h hp
      simp only [Finset.sum_const, nsmul_eq_mul]
      calc
        _ ≤ (4*(h : ℝ)) * (1/(h : ℝ)) := mul_le_mul_of_nonneg_right hc (by positivity)
        _ = 4 := by field_simp
    _ = 4*(n-1 : ℕ) := by simp [Nat.card_Ico, mul_comm]

theorem primitive_neg (d : ZPoint) : Primitive (-d) ↔ Primitive d := by
  simp [Primitive]

theorem det_neg_left (d w : ZPoint) : det (-d) w = -det d w := by
  simp [det]; ring

theorem gridLinePoints_neg (n : ℕ) (p d : ZPoint) :
    gridLinePoints n p (-d) = gridLinePoints n p d := by
  ext q
  simp [mem_gridLinePoints, det_neg_left]

/-- Choosing the sign places every nonzero vector on the selected half-boundary. -/
theorem rawShell_or_neg (d : ZPoint) :
    d ∈ rawShell (max d.1.natAbs d.2.natAbs) ∨
    -d ∈ rawShell (max d.1.natAbs d.2.natAbs) := by
  rw [mem_rawShell, mem_rawShell]
  have hx := Int.natCast_natAbs d.1
  have hy := Int.natCast_natAbs d.2
  dsimp only [Prod.fst_neg, Prod.snd_neg]
  rcases le_total d.2.natAbs d.1.natAbs with hh | hh
  · rw [max_eq_left hh]
    rcases le_total 0 d.1 with hp | hp
    · rw [abs_of_nonneg hp] at hx
      left; left
      have hb : |d.2| ≤ (d.1.natAbs : ℤ) := by omega
      rw [abs_le] at hb
      exact ⟨hx.symm,hb⟩
    · rw [abs_of_nonpos hp] at hx
      right; left
      constructor
      · omega
      · have hb : |d.2| ≤ (d.1.natAbs : ℤ) := by omega
        rw [abs_le] at hb
        omega
  · by_cases he : d.1.natAbs = d.2.natAbs
    · rw [max_eq_right hh, ← he]
      rcases le_total 0 d.1 with hp | hp
      · rw [abs_of_nonneg hp] at hx
        left; left
        have hb : |d.2| ≤ (d.1.natAbs : ℤ) := by omega
        rw [abs_le] at hb
        omega
      · rw [abs_of_nonpos hp] at hx
        right; left
        have hb : |d.2| ≤ (d.1.natAbs : ℤ) := by omega
        rw [abs_le] at hb
        omega
    · rw [max_eq_right hh]
      have hb : |d.1| < (d.2.natAbs : ℤ) := by omega
      rw [abs_lt] at hb
      rcases le_total 0 d.2 with hp | hp
      · rw [abs_of_nonneg hp] at hy
        left; right; omega
      · rw [abs_of_nonpos hp] at hy
        right; right; omega

/-- Normalization by the actual integer gcd, preserving the zero determinant locus. -/
theorem exists_primitive_parallel (v : ZPoint) (hv : v ≠ (0,0)) :
    ∃ d : ZPoint, Primitive d ∧ d.1.natAbs ≤ v.1.natAbs ∧
      d.2.natAbs ≤ v.2.natAbs ∧ (∀ w, det d w = 0 ↔ det v w = 0) := by
  have hg : 0 < Int.gcd v.1 v.2 := by
    apply Int.gcd_pos_iff.mpr
    by_contra hh
    push Not at hh
    exact hv (Prod.ext hh.1 hh.2)
  obtain ⟨g,x,y,hg,hxy,hx,hy⟩ := Int.exists_gcd_one' hg
  have hgR : (g : ℤ) ≠ 0 := by exact_mod_cast (Nat.ne_of_gt hg)
  refine ⟨(x,y),hxy,?_,?_,?_⟩
  · have he := congrArg Int.natAbs hx
    simp only [Int.natAbs_mul, Int.natAbs_natCast] at he
    dsimp only
    rw [he]
    simpa using Nat.mul_le_mul_left x.natAbs hg
  · have he := congrArg Int.natAbs hy
    simp only [Int.natAbs_mul, Int.natAbs_natCast] at he
    dsimp only
    rw [he]
    simpa using Nat.mul_le_mul_left y.natAbs hg
  · intro w
    have he : det v w = (g : ℤ)*det (x,y) w := by dsimp [det]; rw [hx,hy]; ring
    rw [he, mul_eq_zero]
    simp [Nat.ne_of_gt hg]

theorem grid_difference_natAbs_lt {n : ℕ} (p q : Grid n) :
    (gridEmbed q-gridEmbed p).1.natAbs < n ∧
    (gridEmbed q-gridEmbed p).2.natAbs < n := by
  have hp := gridEmbed_inGrid p
  have hq := gridEmbed_inGrid q
  have hx := Int.natCast_natAbs (gridEmbed q-gridEmbed p).1
  have hy := Int.natCast_natAbs (gridEmbed q-gridEmbed p).2
  dsimp [InGrid] at hp hq
  dsimp only [Prod.fst_sub, Prod.snd_sub] at hx hy ⊢
  have hbx : |(gridEmbed q).1-(gridEmbed p).1| < (n : ℤ) := by rw [abs_lt]; omega
  have hby : |(gridEmbed q).2-(gridEmbed p).2| < (n : ℤ) := by rw [abs_lt]; omega
  constructor <;> omega

/-- Every actual non-root grid point determines an indexed primitive direction. -/
theorem grid_point_direction {n : ℕ} (p q : Grid n) (hpq : q ≠ p) :
    ∃ d ∈ directionIndices n,
      ∀ r : Grid n, det d.2 (gridEmbed r-gridEmbed p)=0 ↔ orientedArea p q r=0 := by
  classical
  have hv : gridEmbed q-gridEmbed p ≠ (0,0) := by
    intro he
    apply hpq
    apply gridEmbed_injective n
    exact sub_eq_zero.mp he
  obtain ⟨e,he,hx,hy,hparallel⟩ := exists_primitive_parallel _ hv
  have hb := grid_difference_natAbs_lt p q
  let h := max e.1.natAbs e.2.natAbs
  have hhn : h < n := by dsimp [h]; omega
  have hhpos : 1 ≤ h := by
    have he0 := primitive_ne_zero e he
    by_contra hbad
    have he1 : e.1=0 := Int.natAbs_eq_zero.mp (by dsimp [h] at hbad; omega)
    have he2 : e.2=0 := Int.natAbs_eq_zero.mp (by dsimp [h] at hbad; omega)
    exact he0 (Prod.ext he1 he2)
  rcases rawShell_or_neg e with hs | hs
  · refine ⟨⟨h,e⟩, Finset.mem_sigma.mpr ⟨Finset.mem_Ico.mpr ⟨hhpos,hhn⟩,
      Finset.mem_filter.mpr ⟨hs,he⟩⟩, ?_⟩
    intro r
    exact hparallel (gridEmbed r-gridEmbed p)
  · refine ⟨⟨h,-e⟩, Finset.mem_sigma.mpr ⟨Finset.mem_Ico.mpr ⟨hhpos,hhn⟩,
      Finset.mem_filter.mpr ⟨hs,(primitive_neg e).mpr he⟩⟩, ?_⟩
    intro r
    change det (-e) _=0 ↔ _
    rw [det_neg_left, neg_eq_zero]
    exact hparallel (gridEmbed r-gridEmbed p)

end NoThreeLine.FiniteDirections


#print axioms NoThreeLine.FiniteDirections.directionIndices_card_le
#print axioms NoThreeLine.FiniteDirections.sum_inverse_height_le
#print axioms NoThreeLine.FiniteDirections.grid_point_direction
