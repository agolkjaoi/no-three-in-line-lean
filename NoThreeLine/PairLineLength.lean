import NoThreeLine.OffLineGridGcd
import NoThreeLine.GridLines

/-! The length of the actual line through two distinct grid points is
controlled by the gcd and max-coordinate distance of their displacement. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines GridLineCard GridLines FiniteDirections

theorem exists_primitive_displacement (p q : ZPoint) (hpq : q ≠ p) :
    ∃ d : ZPoint, Primitive d ∧
      q.1-p.1=d.1*(displacementGcd p q : ℤ) ∧
      q.2-p.2=d.2*(displacementGcd p q : ℤ) ∧
      distance p q=height d*displacementGcd p q := by
  obtain ⟨dx,dy,hd,hx,hy⟩ := Int.exists_gcd_one (displacementGcd_pos p q hpq)
  refine ⟨(dx,dy),hd,hx,hy,?_⟩
  have hax : (q.1-p.1).natAbs=dx.natAbs*displacementGcd p q := by
    simpa only [Int.natAbs_mul,Int.natAbs_natCast,displacementGcd] using congrArg Int.natAbs hx
  have hay : (q.2-p.2).natAbs=dy.natAbs*displacementGcd p q := by
    simpa only [Int.natAbs_mul,Int.natAbs_natCast,displacementGcd] using congrArg Int.natAbs hy
  change max (q.1-p.1).natAbs (q.2-p.2).natAbs=max dx.natAbs dy.natAbs*displacementGcd p q
  calc
    _ = max (dx.natAbs*displacementGcd p q) (dy.natAbs*displacementGcd p q) :=
      congrArg₂ max hax hay
    _ = _ := (max_mul _ _ _).symm

theorem lineThrough_card_mul_distance_le {n : ℕ} (p q : Grid n) (hpq : q ≠ p) :
    (lineThrough p q).card*distance (gridEmbed p) (gridEmbed q) ≤
      2*n*displacementGcd (gridEmbed p) (gridEmbed q) := by
  have hne : gridEmbed q ≠ gridEmbed p := fun h => hpq (gridEmbed_injective n h)
  have hg : 1 ≤ displacementGcd (gridEmbed p) (gridEmbed q) := displacementGcd_pos _ _ hne
  obtain ⟨d,hd,hx,hy,hscale⟩ := exists_primitive_displacement _ _ hne
  have hq : q ∈ gridLinePoints n (gridEmbed p) d := by
    apply (mem_gridLinePoints (gridEmbed p) d q).mpr
    dsimp [det]
    rw [hx,hy]
    ring
  have hline : gridLinePoints n (gridEmbed p) d=lineThrough p q :=
    directionLine_eq_lineThrough p q d (primitive_ne_zero d hd) (fun h => hpq h.symm) hq
  have hdist : distance (gridEmbed p) (gridEmbed q) ≤ n := by
    have hb := grid_difference_natAbs_lt p q
    exact max_le hb.1.le hb.2.le
  have hhd : height d ≤ distance (gridEmbed p) (gridEmbed q) := by
    rw [hscale]
    simpa only [mul_one] using Nat.mul_le_mul_left (height d) hg
  have hh : height d ≤ n := hhd.trans hdist
  have hc : (lineThrough p q).card*height d ≤ 2*n := by
    rw [← hline]
    exact (gridLine_card_mul_height_le n (gridEmbed p) d hd).trans
      (show (n-1)+height d ≤ 2*n by omega)
  calc
    _ = ((lineThrough p q).card*height d)*displacementGcd (gridEmbed p) (gridEmbed q) := by
      rw [hscale]; ring
    _ ≤ _ := Nat.mul_le_mul_right _ hc

theorem lineThrough_card_le_gcd_div_distance {n : ℕ} (p q : Grid n) (hpq : q ≠ p) :
    ((lineThrough p q).card : ℝ) ≤
      (2*(n : ℝ)*(displacementGcd (gridEmbed p) (gridEmbed q) : ℝ))/
        (distance (gridEmbed p) (gridEmbed q) : ℝ) := by
  have hne : gridEmbed q ≠ gridEmbed p := fun h => hpq (gridEmbed_injective n h)
  have hh : 0 < distance (gridEmbed p) (gridEmbed q) :=
    (displacementGcd_pos _ _ hne).trans_le (displacementGcd_le_distance _ _ hne)
  have hhR : (0 : ℝ) < distance (gridEmbed p) (gridEmbed q) := by exact_mod_cast hh
  apply (le_div_iff₀ hhR).mpr
  exact_mod_cast lineThrough_card_mul_distance_le p q hpq

/-- On a radius shell, multiplication by its outer radius cancels the
distance denominator. The weak inner endpoint is harmless for an upper bound. -/
theorem shell_lineThrough_card_mul_le {n : ℕ} (p q : Grid n) (hpq : q ≠ p)
    (R : ℕ) (hR : R ≤ 2*distance (gridEmbed p) (gridEmbed q)) :
    R*(lineThrough p q).card ≤ 4*n*displacementGcd (gridEmbed p) (gridEmbed q) := by
  have hs := Nat.mul_le_mul_left (lineThrough p q).card hR
  have hc := lineThrough_card_mul_distance_le p q hpq
  nlinarith

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.lineThrough_card_mul_distance_le
#print axioms NoThreeLine.OffLineDivisors.lineThrough_card_le_gcd_div_distance
#print axioms NoThreeLine.OffLineDivisors.shell_lineThrough_card_mul_le
