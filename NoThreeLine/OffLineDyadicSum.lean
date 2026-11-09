import NoThreeLine.OffLineShell
import NoThreeLine.DyadicSubpower

/-! A finite dyadic cover of every actual point of an off-root grid line.
Overlap is allowed only through nonnegative upper bounds. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.OffLineDivisors
open PrimitiveLines GridLines GridLineCard FiniteDirections DyadicSubpower

theorem mem_shellGridPoints (n : ℕ) (a v p : ZPoint) (R : ℕ) (q : Grid n) :
    q ∈ shellGridPoints n a v p R ↔ q ∈ gridLinePoints n a v ∧
      distance p (gridEmbed q) ≤ R ∧ R ≤ 2*distance p (gridEmbed q) := by
  classical
  simp only [shellGridPoints,radiusGridPoints,Finset.mem_filter]
  tauto

theorem grid_point_mem_dyadic_shell {n : ℕ} (a v : ZPoint) (p q : Grid n)
    (hp : det v (gridEmbed p-a) ≠ 0) (hq : q ∈ gridLinePoints n a v) :
    ∃ k ∈ Finset.range (Nat.clog 2 n+1), q ∈ shellGridPoints n a v (gridEmbed p) (2^k) := by
  have hne := on_line_ne_root a v (gridEmbed p) (gridEmbed q) hp ((mem_gridLinePoints a v q).mp hq)
  have hd : 0 < distance (gridEmbed p) (gridEmbed q) :=
    (displacementGcd_pos _ _ hne).trans_le (displacementGcd_le_distance _ _ hne)
  have hdn : distance (gridEmbed p) (gridEmbed q) ≤ n := by
    have h := grid_difference_natAbs_lt p q
    exact max_le h.1.le h.2.le
  obtain ⟨k,hk,hlo,hhi⟩ := dyadic_cover n _ hd hdn
  exact ⟨k,hk,(mem_shellGridPoints n a v (gridEmbed p) (2^k) q).mpr ⟨hq,hlo,hhi⟩⟩

theorem sum_lineThrough_card_le_dyadic {n : ℕ} (a v : ZPoint) (p : Grid n)
    (hv : Primitive v) (hp : det v (gridEmbed p-a) ≠ 0) :
    (∑ q ∈ gridLinePoints n a v, (lineThrough p q).card) ≤
      (Nat.clog 2 n+1)*(12*n*((det v (gridEmbed p-a)).natAbs.divisors.card)) := by
  classical
  have hpoint (q : Grid n) (hq : q ∈ gridLinePoints n a v) :
      (lineThrough p q).card ≤ ∑ k ∈ Finset.range (Nat.clog 2 n+1),
        if q ∈ shellGridPoints n a v (gridEmbed p) (2^k) then (lineThrough p q).card else 0 := by
    obtain ⟨k,hk,hqk⟩ := grid_point_mem_dyadic_shell a v p q hp hq
    have h := Finset.single_le_sum
      (fun k (_ : k ∈ Finset.range (Nat.clog 2 n+1)) =>
        Nat.zero_le (if q ∈ shellGridPoints n a v (gridEmbed p) (2^k) then (lineThrough p q).card else 0)) hk
    simpa only [if_pos hqk] using h
  calc
    _ ≤ ∑ q ∈ gridLinePoints n a v, ∑ k ∈ Finset.range (Nat.clog 2 n+1),
        if q ∈ shellGridPoints n a v (gridEmbed p) (2^k) then (lineThrough p q).card else 0 :=
      Finset.sum_le_sum hpoint
    _ = ∑ k ∈ Finset.range (Nat.clog 2 n+1), ∑ q ∈ gridLinePoints n a v,
        if q ∈ shellGridPoints n a v (gridEmbed p) (2^k) then (lineThrough p q).card else 0 :=
      Finset.sum_comm
    _ = ∑ k ∈ Finset.range (Nat.clog 2 n+1),
        ∑ q ∈ shellGridPoints n a v (gridEmbed p) (2^k), (lineThrough p q).card := by
      apply Finset.sum_congr rfl
      intro k hk
      rw [← Finset.sum_filter]
      have he : (gridLinePoints n a v).filter
          (fun q => q ∈ shellGridPoints n a v (gridEmbed p) (2^k)) =
          shellGridPoints n a v (gridEmbed p) (2^k) := by
        ext q
        simp only [Finset.mem_filter]
        exact ⟨fun h => h.2,fun h => ⟨((mem_shellGridPoints _ _ _ _ _ _).mp h).1,h⟩⟩
      rw [he]
    _ ≤ ∑ _k ∈ Finset.range (Nat.clog 2 n+1),
        12*n*((det v (gridEmbed p-a)).natAbs.divisors.card) := by
      apply Finset.sum_le_sum
      intro k hk
      exact sum_shell_lineThrough_card_le a v p hv hp (2^k) (by positivity)
    _ = _ := by simp only [Finset.sum_const,Finset.card_range,nsmul_eq_mul,Nat.cast_id]

end NoThreeLine.OffLineDivisors

#print axioms NoThreeLine.OffLineDivisors.sum_lineThrough_card_le_dyadic
