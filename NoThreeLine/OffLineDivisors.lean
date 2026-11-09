import NoThreeLine.GridLineCard
import NoThreeLine.DivisorSubpower
import Mathlib.Data.Int.ModEq

/-! Determinant and residue-class inputs for the off-root-line estimate.
The displacement gcd and the congruence condition are computed from actual
integer points. Existence of a congruence solution is never presumed. -/
set_option autoImplicit false
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines GridLineCard FiniteDirections

def displacementGcd (p q : ZPoint) : ℕ := Int.gcd (q.1-p.1) (q.2-p.2)

def distance (p q : ZPoint) : ℕ := height (q-p)

def parameterCongruence (a v p : ZPoint) (e : ℕ) (t : ℤ) : Prop :=
  (e : ℤ) ∣ (linePoint a v t).1-p.1 ∧ (e : ℤ) ∣ (linePoint a v t).2-p.2

theorem on_line_ne_root (a v p q : ZPoint) (hp : det v (p-a) ≠ 0)
    (hq : det v (q-a) = 0) : q ≠ p := by
  intro he
  subst q
  exact hp hq

theorem displacementGcd_pos (p q : ZPoint) (hpq : q ≠ p) : 0 < displacementGcd p q := by
  apply Int.gcd_pos_iff.mpr
  by_contra h
  push Not at h
  apply hpq
  apply Prod.ext <;> dsimp at * <;> omega

theorem displacementGcd_dvd_x (p q : ZPoint) :
    (displacementGcd p q : ℤ) ∣ q.1-p.1 := Int.gcd_dvd_left _ _

theorem displacementGcd_dvd_y (p q : ZPoint) :
    (displacementGcd p q : ℤ) ∣ q.2-p.2 := Int.gcd_dvd_right _ _

theorem displacementGcd_le_distance (p q : ZPoint) (hpq : q ≠ p) :
    displacementGcd p q ≤ distance p q := by
  have hx := Int.natCast_dvd.mp (displacementGcd_dvd_x p q)
  have hy := Int.natCast_dvd.mp (displacementGcd_dvd_y p q)
  have hd : 0 < distance p q := by
    by_contra hh
    have hx0 : (q.1-p.1).natAbs=0 := by dsimp [distance,height] at hh; omega
    have hy0 : (q.2-p.2).natAbs=0 := by dsimp [distance,height] at hh; omega
    have hx' := Int.natAbs_eq_zero.mp hx0
    have hy' := Int.natAbs_eq_zero.mp hy0
    exact hpq (Prod.ext (by omega) (by omega))
  apply Nat.le_of_dvd hd
  rcases le_total (q.1-p.1).natAbs (q.2-p.2).natAbs with hh | hh
  · simpa only [distance,height,Prod.fst_sub,Prod.snd_sub,max_eq_right hh] using hy
  · simpa only [distance,height,Prod.fst_sub,Prod.snd_sub,max_eq_left hh] using hx

/-- The common coordinate divisor divides the determinant with the fixed
line, independently of the location of the point along that line. -/
theorem displacementGcd_dvd_determinant (a v p q : ZPoint)
    (hq : det v (q-a) = 0) : displacementGcd p q ∣ (det v (p-a)).natAbs := by
  have hd : (displacementGcd p q : ℤ) ∣ det v (q-p) := by
    exact Int.dvd_sub (dvd_mul_of_dvd_right (displacementGcd_dvd_y p q) v.1)
      (dvd_mul_of_dvd_right (displacementGcd_dvd_x p q) v.2)
  have he : det v (p-a) = det v (q-a)-det v (q-p) := by dsimp [det]; ring
  apply Int.natCast_dvd.mp
  rw [he,hq,zero_sub]
  exact Int.dvd_neg.mpr hd

theorem displacementGcd_mem_divisors (a v p q : ZPoint)
    (hp : det v (p-a) ≠ 0) (hq : det v (q-a) = 0) :
    displacementGcd p q ∈ (det v (p-a)).natAbs.divisors := by
  exact Nat.mem_divisors.mpr ⟨displacementGcd_dvd_determinant a v p q hq,
    fun hh => hp (Int.natAbs_eq_zero.mp hh)⟩

theorem linePoint_gcd_mem_divisors (a v p : ZPoint)
    (hp : det v (p-a) ≠ 0) (t : ℤ) :
    displacementGcd p (linePoint a v t) ∈ (det v (p-a)).natAbs.divisors :=
  displacementGcd_mem_divisors a v p _ hp (det_linePoint a v t)

theorem parameterCongruence_iff_dvd_gcd (a v p : ZPoint) (e : ℕ) (t : ℤ) :
    parameterCongruence a v p e t ↔ e ∣ displacementGcd p (linePoint a v t) := by
  simp only [parameterCongruence,displacementGcd,Int.gcd_def,Nat.dvd_gcd_iff,Int.natCast_dvd]

/-- Primitive Bezout coefficients turn the two coordinate congruences into
a single congruence for the integer line parameter. -/
theorem parameter_difference_dvd (a v p : ZPoint) (hv : Primitive v) (e : ℕ)
    (s t : ℤ) (hs : parameterCongruence a v p e s)
    (ht : parameterCongruence a v p e t) : (e : ℤ) ∣ t-s := by
  have hx : (e : ℤ) ∣ (t-s)*v.1 := by
    convert Int.dvd_sub ht.1 hs.1 using 1
    dsimp [linePoint]
    ring
  have hy : (e : ℤ) ∣ (t-s)*v.2 := by
    convert Int.dvd_sub ht.2 hs.2 using 1
    dsimp [linePoint]
    ring
  have hb := primitive_bezout v hv
  have hl : (t-s)*v.1*Int.gcdA v.1 v.2+(t-s)*v.2*Int.gcdB v.1 v.2 = t-s := by
    linear_combination (t-s)*hb
  rw [← hl]
  exact Int.dvd_add (dvd_mul_of_dvd_left hx _) (dvd_mul_of_dvd_left hy _)

theorem parameterCongruence_of_difference_dvd (a v p : ZPoint) (e : ℕ)
    (s t : ℤ) (hs : parameterCongruence a v p e s) (ht : (e : ℤ) ∣ t-s) :
    parameterCongruence a v p e t := by
  constructor
  · convert Int.dvd_add hs.1 (dvd_mul_of_dvd_left ht v.1) using 1
    dsimp [linePoint]
    ring
  · convert Int.dvd_add hs.2 (dvd_mul_of_dvd_left ht v.2) using 1
    dsimp [linePoint]
    ring

theorem parameterCongruence_iff_modEq (a v p : ZPoint) (hv : Primitive v) (e : ℕ)
    (s : ℤ) (hs : parameterCongruence a v p e s) (t : ℤ) :
    parameterCongruence a v p e t ↔ Int.ModEq (e : ℤ) s t := by
  rw [Int.modEq_iff_dvd]
  exact ⟨parameter_difference_dvd a v p hv e s t hs,
    parameterCongruence_of_difference_dvd a v p e s t hs⟩

/-- The solution set is empty or exactly one residue class. This statement
does not assert solvability for every divisor of the line determinant. -/
theorem parameterCongruence_empty_or_class (a v p : ZPoint) (hv : Primitive v) (e : ℕ) :
    (∀ t : ℤ, ¬ parameterCongruence a v p e t) ∨
      ∃ s : ℤ, ∀ t : ℤ, parameterCongruence a v p e t ↔ Int.ModEq (e : ℤ) s t := by
  classical
  by_cases h : ∃ s : ℤ, parameterCongruence a v p e s
  · obtain ⟨s,hs⟩ := h
    exact Or.inr ⟨s,parameterCongruence_iff_modEq a v p hv e s hs⟩
  · exact Or.inl (not_exists.mp h)

theorem det_natAbs_le (v w : ZPoint) :
    (det v w).natAbs ≤ 2*height v*height w := by
  have hb : (det v w).natAbs ≤ v.1.natAbs*w.2.natAbs+v.2.natAbs*w.1.natAbs := by
    simpa only [det,sub_eq_add_neg,Int.natAbs_neg,Int.natAbs_mul] using
      Int.natAbs_add_le (v.1*w.2) (-(v.2*w.1))
  calc
    _ ≤ v.1.natAbs*w.2.natAbs+v.2.natAbs*w.1.natAbs := hb
    _ ≤ height v*height w+height v*height w :=
      Nat.add_le_add (Nat.mul_le_mul (le_max_left _ _) (le_max_right _ _))
        (Nat.mul_le_mul (le_max_right _ _) (le_max_left _ _))
    _ = _ := by ring

theorem grid_determinant_le {n : ℕ} (a p : Grid n) (v : ZPoint) (hv : height v ≤ n) :
    (det v (gridEmbed p-gridEmbed a)).natAbs ≤ 2*n^2 := by
  have hd := grid_difference_natAbs_lt a p
  have hh : height (gridEmbed p-gridEmbed a) ≤ n := max_le hd.1.le hd.2.le
  calc
    _ ≤ 2*height v*height (gridEmbed p-gridEmbed a) := det_natAbs_le v _
    _ ≤ 2*n*n := Nat.mul_le_mul (Nat.mul_le_mul_left 2 hv) hh
    _ = _ := by ring

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.displacementGcd_mem_divisors
#print axioms NoThreeLine.OffLineDivisors.parameterCongruence_empty_or_class
#print axioms NoThreeLine.OffLineDivisors.grid_determinant_le
