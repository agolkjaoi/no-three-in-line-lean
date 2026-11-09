import NoThreeLine.OffLineDirection
import NoThreeLine.LongLinePairPrices
import NoThreeLine.RootLineLengthSum

/-! Apply the actual off-root-line estimate to the actual specified-pair
length sum. Repeated/opposite directions only overcount nonnegative terms.
The long-line threshold remains arbitrary. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines GridLines OffLineDivisors FiniteDirections

private theorem eligible_off_direction {n : ℕ} (Γ : Finset ZPoint) (p q : Grid n)
    (threshold : ℝ) (hq : longWitnessEligible Γ p threshold q) (d : ZPoint)
    (hd : d ∈ Γ) (hd0 : d ≠ (0,0)) : det d (gridEmbed p-gridEmbed q) ≠ 0 := by
  intro he
  apply hq.2.1
  apply (BirthLineGroups.specifiedPair_swap Γ q p).mp
  exact (specifiedPair_iff_directionLine Γ q p).mpr
    ⟨d,hd,hd0,(mem_gridLinePoints _ _ _).mpr he⟩

private theorem sum_eligible_pair_lengths_le {n : ℕ} (Γ : Finset ZPoint) (p q : Grid n)
    (threshold ξ C : ℝ) (hC : 0 < C)
    (hbound : ∀ (a : Grid n) (d : ZPoint), det d (gridEmbed p-gridEmbed a) ≠ 0 →
      (∑r ∈ directionLine a d, ((lineThrough p r).card : ℝ)) ≤ C*(n : ℝ)^(1+ξ))
    (hq : longWitnessEligible Γ p threshold q) :
    (∑r : Grid n, if longWitnessEligible Γ p threshold r ∧ specifiedDistinctPair Γ q r
      then ((lineThrough p r).card : ℝ) else 0) ≤ (Γ.card : ℝ)*(C*(n : ℝ)^(1+ξ)) := by
  classical
  let f : ZPoint → Grid n → ℝ := fun d r =>
    if d ≠ (0,0) ∧ r ∈ directionLine q d then ((lineThrough p r).card : ℝ) else 0
  have hf (d : ZPoint) (r : Grid n) : 0 ≤ f d r := by dsimp [f]; split_ifs <;> positivity
  have hpoint (r : Grid n) :
      (if longWitnessEligible Γ p threshold r ∧ specifiedDistinctPair Γ q r
        then ((lineThrough p r).card : ℝ) else 0) ≤ ∑d ∈ Γ, f d r := by
    split_ifs with hr
    · obtain ⟨d,hd,hd0,hdr⟩ := (specifiedPair_iff_directionLine Γ q r).mp hr.2.2
      have hh := Finset.single_le_sum (fun d (_ : d∈Γ) => hf d r) hd
      simpa only [f,if_pos (And.intro hd0 hdr)] using hh
    · exact Finset.sum_nonneg (fun d _ => hf d r)
  have hdir (d : ZPoint) (hd : d∈Γ) :
      (∑r : Grid n, f d r) ≤ C*(n : ℝ)^(1+ξ) := by
    by_cases hd0 : d=(0,0)
    · simp only [f,hd0,ne_eq,not_true_eq_false,false_and,if_false,Finset.sum_const_zero]
      positivity
    · simp only [f,hd0,ne_eq,not_false_eq_true,true_and]
      rw [←Finset.sum_filter]
      have he : Finset.univ.filter (fun r : Grid n => r∈directionLine q d)=directionLine q d := by
        ext r
        simp only [Finset.mem_filter,Finset.mem_univ,true_and]
      rw [he]
      exact hbound q d (eligible_off_direction Γ p q threshold hq d hd hd0)
  calc
    _ ≤ ∑r : Grid n,∑d ∈ Γ,f d r := Finset.sum_le_sum (fun r _ => hpoint r)
    _ = ∑d ∈ Γ,∑r : Grid n,f d r := Finset.sum_comm
    _ ≤ ∑d ∈ Γ,C*(n : ℝ)^(1+ξ) := Finset.sum_le_sum hdir
    _ = _ := by simp only [Finset.sum_const,nsmul_eq_mul]

theorem longPairLengthSum_le_const_rpow_log (ξ : ℝ) (hξ : 0 < ξ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (n : ℕ) (Γ : Finset ZPoint) (p : Grid n) (threshold : ℝ),
      longPairLengthSum Γ p threshold ≤ C*(Γ.card : ℝ)*(n : ℝ)^(3+ξ)*(1+Real.log n) := by
  classical
  obtain ⟨C,hC,hbound⟩ := off_directionLine_sum_le_const_rpow ξ hξ
  refine ⟨16*C,by positivity,?_⟩
  intro n Γ p threshold
  let A : ℝ := (Γ.card : ℝ)*(C*(n : ℝ)^(1+ξ))
  have hA : 0 ≤ A := by dsimp [A]; positivity
  have hpoint (q : Grid n) :
      (∑r : Grid n, if longWitnessEligible Γ p threshold q ∧ longWitnessEligible Γ p threshold r ∧
          specifiedDistinctPair Γ q r then ((lineThrough p q).card:ℝ)*(lineThrough p r).card else 0) ≤
        A*(if q ≠ p then ((lineThrough p q).card : ℝ) else 0) := by
    by_cases hq : longWitnessEligible Γ p threshold q
    · have hh := sum_eligible_pair_lengths_le Γ p q threshold ξ C hC
        (fun a d h => hbound n a p d h) hq
      rw [if_pos hq.1]
      calc
        _ = ((lineThrough p q).card : ℝ)*
            (∑r : Grid n,if longWitnessEligible Γ p threshold r ∧ specifiedDistinctPair Γ q r
              then ((lineThrough p r).card : ℝ) else 0) := by
          rw [Finset.mul_sum]
          apply Finset.sum_congr rfl
          intro r _
          by_cases hr : longWitnessEligible Γ p threshold r ∧ specifiedDistinctPair Γ q r
          · rw [if_pos ⟨hq,hr.1,hr.2⟩,if_pos hr]
          · rw [if_neg (fun h => hr h.2),if_neg hr,mul_zero]
        _ ≤ ((lineThrough p q).card : ℝ)*A := mul_le_mul_of_nonneg_left hh (Nat.cast_nonneg _)
        _ = _ := mul_comm _ _
    · simp only [hq,false_and,if_false,Finset.sum_const_zero]
      exact mul_nonneg hA (by split_ifs <;> positivity)
  have hn : (0 : ℝ) < n := by exact_mod_cast (Nat.zero_le p.1.val).trans_lt p.1.isLt
  have hpow : (n : ℝ)^(3+ξ)=(n : ℝ)^2*(n : ℝ)^(1+ξ) := by
    rw [show 3+ξ=2+(1+ξ) by ring,Real.rpow_add hn,Real.rpow_two]
  calc
    _ ≤ ∑q : Grid n,A*(if q≠p then ((lineThrough p q).card : ℝ) else 0) :=
      Finset.sum_le_sum (fun q _ => hpoint q)
    _ = A*rootLineLengthSum p := (Finset.mul_sum _ _ _).symm
    _ ≤ A*(16*(n : ℝ)^2*(1+Real.log n)) := mul_le_mul_of_nonneg_left (rootLineLengthSum_le_log p) hA
    _ = _ := by dsimp [A]; rw [hpow]; ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.longPairLengthSum_le_const_rpow_log
