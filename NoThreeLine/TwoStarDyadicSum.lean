import NoThreeLine.TwoStarShellCount
import NoThreeLine.DyadicSubpower

/-! Weighted actual two-star shell sums and their finite dyadic cover.
The two real board-line lengths are bounded before summing; no abstract
weighted-cardinality estimate is supplied. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.TwoStar
open PrimitiveLines GridLineCard OffLineDivisors GridLines FiniteDirections DyadicSubpower

theorem lineThrough_card_mul_direction_height {n : ℕ} (p q : Grid n) (hne : q≠p) :
    (lineThrough p q).card*height (displacementDirection (gridEmbed p) (gridEmbed q))≤2*n := by
  have hc := lineThrough_card_mul_distance_le p q hne
  have hg : 0<displacementGcd (gridEmbed p) (gridEmbed q) :=
    displacementGcd_pos _ _ (fun h=>hne (gridEmbed_injective n h))
  rw [distance_eq_direction_height] at hc
  apply Nat.le_of_mul_le_mul_right _ hg
  simpa only [mul_assoc] using hc

theorem shell_point_length_product_le {n : ℕ} (a b q : Grid n) (H J : ℕ)
    (hq : q∈shellCauses a b H J) :
    (H*J)*((lineThrough a q).card*(lineThrough b q).card)≤16*n^2 := by
  have hm := (Finset.mem_filter.mp hq).2
  have hne := off_baseline_roots a b q hm.1
  have hla := lineThrough_card_mul_direction_height a q hne.1
  have hlb := lineThrough_card_mul_direction_height b q hne.2
  have hHa : H*(lineThrough a q).card≤4*n := by
    have h := Nat.mul_le_mul_right (lineThrough a q).card hm.2.2.1
    nlinarith
  have hJb : J*(lineThrough b q).card≤4*n := by
    have h := Nat.mul_le_mul_right (lineThrough b q).card hm.2.2.2.2
    nlinarith
  calc
    _ = (H*(lineThrough a q).card)*(J*(lineThrough b q).card) := by ring
    _ ≤ (4*n)*(4*n) := Nat.mul_le_mul hHa hJb
    _ = _ := by ring

theorem shell_length_product_sum_le {n : ℕ} (a b : Grid n) (H J : ℕ)
    (hH : 0<H) (hJ : 0<J) :
    (∑ q∈shellCauses a b H J, (lineThrough a q).card*(lineThrough b q).card)≤
      864*n^2*divisorCap n := by
  have hm : (H*J)*(∑ q∈shellCauses a b H J,
      (lineThrough a q).card*(lineThrough b q).card)≤(H*J)*(864*n^2*divisorCap n) := by
    calc
      _ = ∑ q∈shellCauses a b H J,
          (H*J)*((lineThrough a q).card*(lineThrough b q).card) := Finset.mul_sum _ _ _
      _ ≤ ∑ _q∈shellCauses a b H J, 16*n^2 :=
        Finset.sum_le_sum (fun q hq=>shell_point_length_product_le a b q H J hq)
      _ = (shellCauses a b H J).card*(16*n^2) := by
        simp only [Finset.sum_const,nsmul_eq_mul,Nat.cast_id]
      _ ≤ (54*H*J*divisorCap n)*(16*n^2) :=
        Nat.mul_le_mul_right _ (shellCauses_card_le a b H J hH hJ)
      _ = _ := by ring
  exact Nat.le_of_mul_le_mul_left hm (Nat.mul_pos hH hJ)

def offBaselineCauses {n : ℕ} (a b : Grid n) : Finset (Grid n) :=
  Finset.univ.filter (fun q=>orientedArea a b q≠0)

def twoStarSum {n : ℕ} (a b : Grid n) : ℕ :=
  ∑ q∈offBaselineCauses a b, (lineThrough a q).card*(lineThrough b q).card

def dyadicPairs (n : ℕ) : Finset (ℕ×ℕ) :=
  (Finset.range (Nat.clog 2 n+1)) ×ˢ (Finset.range (Nat.clog 2 n+1))

theorem off_baseline_mem_dyadic_shell {n : ℕ} (a b q : Grid n)
    (hq : q∈offBaselineCauses a b) :
    ∃ ij∈dyadicPairs n, q∈shellCauses a b (2^ij.1) (2^ij.2) := by
  have hm := (Finset.mem_filter.mp hq).2
  have hne := off_baseline_roots a b q hm
  have hpa := displacementDirection_primitive (gridEmbed a) (gridEmbed q)
    (fun h=>hne.1 (gridEmbed_injective n h))
  have hpb := displacementDirection_primitive (gridEmbed b) (gridEmbed q)
    (fun h=>hne.2 (gridEmbed_injective n h))
  obtain ⟨i,hi,hai,hia⟩ := dyadic_cover n _ (height_pos _ hpa)
    (displacementDirection_height_lt a q hne.1).le
  obtain ⟨j,hj,hbj,hjb⟩ := dyadic_cover n _ (height_pos _ hpb)
    (displacementDirection_height_lt b q hne.2).le
  exact ⟨(i,j),Finset.mem_product.mpr ⟨hi,hj⟩,
    Finset.mem_filter.mpr ⟨Finset.mem_univ _,hm,hai,hia,hbj,hjb⟩⟩

theorem twoStarSum_le_dyadic {n : ℕ} (a b : Grid n) :
    twoStarSum a b≤(Nat.clog 2 n+1)^2*(864*n^2*divisorCap n) := by
  classical
  have hp (q : Grid n) (hq : q∈offBaselineCauses a b) :
      (lineThrough a q).card*(lineThrough b q).card≤∑ ij∈dyadicPairs n,
        if q∈shellCauses a b (2^ij.1) (2^ij.2)
        then (lineThrough a q).card*(lineThrough b q).card else 0 := by
    obtain ⟨ij,hij,hqij⟩ := off_baseline_mem_dyadic_shell a b q hq
    have h := Finset.single_le_sum
      (fun ij (_ : ij∈dyadicPairs n)=>Nat.zero_le
        (if q∈shellCauses a b (2^ij.1) (2^ij.2)
          then (lineThrough a q).card*(lineThrough b q).card else 0)) hij
    simpa only [if_pos hqij] using h
  calc
    _ ≤ ∑ q∈offBaselineCauses a b, ∑ ij∈dyadicPairs n,
        if q∈shellCauses a b (2^ij.1) (2^ij.2)
          then (lineThrough a q).card*(lineThrough b q).card else 0 := Finset.sum_le_sum hp
    _ = ∑ ij∈dyadicPairs n, ∑ q∈offBaselineCauses a b,
        if q∈shellCauses a b (2^ij.1) (2^ij.2)
          then (lineThrough a q).card*(lineThrough b q).card else 0 := Finset.sum_comm
    _ = ∑ ij∈dyadicPairs n, ∑ q∈shellCauses a b (2^ij.1) (2^ij.2),
        (lineThrough a q).card*(lineThrough b q).card := by
      apply Finset.sum_congr rfl
      intro ij hij
      rw [←Finset.sum_filter]
      have he : (offBaselineCauses a b).filter
          (fun q=>q∈shellCauses a b (2^ij.1) (2^ij.2)) =
          shellCauses a b (2^ij.1) (2^ij.2) := by
        ext q
        simp only [Finset.mem_filter]
        exact ⟨fun h=>h.2,fun h=>⟨Finset.mem_filter.mpr
          ⟨Finset.mem_univ _,(Finset.mem_filter.mp h).2.1⟩,h⟩⟩
      rw [he]
    _ ≤ ∑ _ij∈dyadicPairs n, 864*n^2*divisorCap n := by
      apply Finset.sum_le_sum
      intro ij hij
      exact shell_length_product_sum_le a b (2^ij.1) (2^ij.2) (by positivity) (by positivity)
    _ = _ := by
      simp only [Finset.sum_const,nsmul_eq_mul,Nat.cast_id,dyadicPairs,
        Finset.card_product,Finset.card_range]
      ring

end NoThreeLine.TwoStar

#print axioms NoThreeLine.TwoStar.shell_length_product_sum_le
#print axioms NoThreeLine.TwoStar.twoStarSum_le_dyadic
