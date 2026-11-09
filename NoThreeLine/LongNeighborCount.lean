import NoThreeLine.RootLineLengthSum

/-! Actual long-line neighbours of a board root. Height truncation gives a
uniform inverse-threshold bound, without the logarithm from a first-moment
Markov estimate. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.FiniteDirections
open PrimitiveLines GridLines GridLineCard

theorem sum_truncated_gridLine_card_le (n : ℕ) (p : ZPoint) (K : ℕ) :
    (∑d ∈ (directionIndices n).filter (fun d => d.1 ≤ K),
      ((gridLinePoints n p d.2).card : ℝ)) ≤ 8*(n : ℝ)*(K : ℝ) := by
  classical
  have he : (directionIndices n).filter (fun d => d.1 ≤ K)=
      ((Finset.Ico 1 n).filter (fun h => h ≤ K)).sigma primitiveShell := by
    ext d
    simp only [directionIndices,Finset.mem_filter,Finset.mem_sigma]
    aesop
  have hc : ((Finset.Ico 1 n).filter (fun h => h ≤ K)).card ≤ K := by
    calc
      _ ≤ (Finset.Icc 1 K).card := Finset.card_le_card (by
        intro h hh
        exact Finset.mem_Icc.mpr ⟨(Finset.mem_Ico.mp (Finset.mem_filter.mp hh).1).1,
          (Finset.mem_filter.mp hh).2⟩)
      _ = _ := by simp
  rw [he,Finset.sum_sigma]
  calc
    _ ≤ ∑h ∈ (Finset.Ico 1 n).filter (fun h => h ≤ K),8*(n : ℝ) := by
      apply Finset.sum_le_sum
      intro h hh
      have hm := Finset.mem_Ico.mp (Finset.mem_filter.mp hh).1
      have hp : (0 : ℝ) < h := by exact_mod_cast hm.1
      have hs : ((primitiveShell h).card : ℝ)≤4*(h : ℝ) := by
        exact_mod_cast primitiveShell_card_le h hm.1
      calc
        _ ≤ ∑d ∈ primitiveShell h,2*(n : ℝ)/(h : ℝ) :=
          Finset.sum_le_sum (fun d hd => shell_gridLine_card_le n h p d hd hm.2.le)
        _ = ((primitiveShell h).card : ℝ)*(2*(n : ℝ)/(h : ℝ)) := by
          simp only [Finset.sum_const,nsmul_eq_mul]
        _ ≤ (4*(h : ℝ))*(2*(n : ℝ)/(h : ℝ)) :=
          mul_le_mul_of_nonneg_right hs (by positivity)
        _ = _ := by field_simp <;> ring
    _ = (((Finset.Ico 1 n).filter (fun h => h ≤ K)).card : ℝ)*(8*(n : ℝ)) := by
      simp only [Finset.sum_const,nsmul_eq_mul]
    _ ≤ (K : ℝ)*(8*(n : ℝ)) := mul_le_mul_of_nonneg_right (by exact_mod_cast hc) (by positivity)
    _ = _ := by ring

def longNeighbors {n : ℕ} (p : Grid n) (H : ℝ) : Finset (Grid n) :=
  Finset.univ.filter (fun q => q≠p ∧ H < ((lineThrough p q).card : ℝ))

theorem longNeighbors_card_le {n : ℕ} (p : Grid n) (H : ℝ) (hH : 0 < H) :
    ((longNeighbors p H).card : ℝ) ≤ 16*(n : ℝ)^2/H := by
  classical
  let K : ℕ := ⌊2*(n : ℝ)/H⌋₊
  let S := (directionIndices n).filter (fun d => d.1 ≤ K)
  have hcut (q : Grid n) (hq : q∈longNeighbors p H) :
      ∃d ∈ S,q∈gridLinePoints n (gridEmbed p) d.2 := by
    have hq' := (Finset.mem_filter.mp hq).2
    obtain ⟨d,hd,hline⟩ := grid_point_direction p q hq'.1
    have he : lineThrough p q=gridLinePoints n (gridEmbed p) d.2 := by
      ext r
      rw [mem_lineThrough,mem_gridLinePoints]
      exact (hline r).symm
    have hh : (0 : ℝ)<d.1 := by
      exact_mod_cast (Finset.mem_Ico.mp (Finset.mem_sigma.mp hd).1).1
    have hL : H < 2*(n : ℝ)/(d.1 : ℝ) :=
      hq'.2.trans_le (by rw [he]; exact directionIndex_gridLine_card_le n (gridEmbed p) d hd)
    have hdK : d.1 ≤ K := by
      apply (Nat.le_floor_iff (by positivity : 0 ≤ 2*(n : ℝ)/H)).mpr
      apply (le_div_iff₀ hH).mpr
      have hmul := (lt_div_iff₀ hh).mp hL
      nlinarith
    exact ⟨d,Finset.mem_filter.mpr ⟨hd,hdK⟩,he ▸ right_mem_lineThrough p q⟩
  have hpoint (q : Grid n) : (if q∈longNeighbors p H then (1 : ℝ) else 0) ≤
      ∑d ∈ S,if q∈gridLinePoints n (gridEmbed p) d.2 then (1 : ℝ) else 0 := by
    by_cases hq : q∈longNeighbors p H
    · obtain ⟨d,hd,hqd⟩ := hcut q hq
      rw [if_pos hq]
      have hh := Finset.single_le_sum (s := S)
        (f := fun d => if q∈gridLinePoints n (gridEmbed p) d.2 then (1 : ℝ) else 0)
        (fun d _ => by split_ifs <;> positivity) hd
      simpa only [if_pos hqd] using hh
    · rw [if_neg hq]
      exact Finset.sum_nonneg (fun d _ => by split_ifs <;> positivity)
  calc
    _ = ∑q : Grid n,if q∈longNeighbors p H then (1 : ℝ) else 0 := by simp
    _ ≤ ∑q : Grid n,∑d ∈ S,if q∈gridLinePoints n (gridEmbed p) d.2 then (1 : ℝ) else 0 :=
      Finset.sum_le_sum (fun q _ => hpoint q)
    _ = ∑d ∈ S,((gridLinePoints n (gridEmbed p) d.2).card : ℝ) := by
      rw [Finset.sum_comm]
      apply Finset.sum_congr rfl
      intro d _
      simp
    _ ≤ 8*(n : ℝ)*(K : ℝ) := sum_truncated_gridLine_card_le n (gridEmbed p) K
    _ ≤ 8*(n : ℝ)*(2*(n : ℝ)/H) :=
      mul_le_mul_of_nonneg_left (Nat.floor_le (by positivity)) (by positivity)
    _ = _ := by ring

end NoThreeLine.FiniteDirections

#print axioms NoThreeLine.FiniteDirections.longNeighbors_card_le
