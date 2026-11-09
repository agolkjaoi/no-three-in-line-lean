import NoThreeLine.LongLinePairLength

/-! The actual schedule coarse-price pair error has an off-line subpower
bound. Constants from the source multiplier and total duration are displayed,
and the geometric exponent is independent of the root and threshold. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines FiniteWitnessMoments

theorem long_schedule_coarse_pair_le_const_rpow_log (ξ : ℝ) (hξ : 0 < ξ) :
    ∃ C : ℝ, 0 < C ∧ ∀ (J n : ℕ) (s : FinitePhase.Schedule J)
      (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
      (Γ : Finset ZPoint) (B K ρ : ℝ) (p : Grid n) (threshold : ℝ),
      pairWeight (specifiedDistinctPair Γ) (longWitnessWeight s Γ p threshold)
        (accumulatedPhaseCoarsePrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
          (longWitnessRetention s mask hm Γ p threshold) J) ≤
        C*(longSourceMultiplier Γ K)^2*(Γ.card : ℝ)*s.total^4*
          (n : ℝ)^(ξ-1)*(1+Real.log n) := by
  obtain ⟨C,hC,hgeom⟩ := longPairLengthSum_le_const_rpow_log ξ hξ
  refine ⟨C,hC,?_⟩
  intro J n s mask hm Γ B K ρ p threshold
  have hn : (0 : ℝ) < n := by exact_mod_cast (Nat.zero_le p.1.val).trans_lt p.1.isLt
  have hpow : (n : ℝ)^(3+ξ)=(n : ℝ)^4*(n : ℝ)^(ξ-1) := by
    rw [show 3+ξ=4+(ξ-1) by ring,Real.rpow_add hn]
    rw [show (n : ℝ)^(4 : ℝ)=(n : ℝ)^4 from Real.rpow_natCast _ 4]
  calc
    _ ≤ (longSourceMultiplier Γ K)^2*
        (s.total^4/(n : ℝ)^4*longPairLengthSum Γ p threshold) :=
      long_schedule_coarse_pair_le_lengths s mask hm Γ B K ρ p threshold
    _ ≤ (longSourceMultiplier Γ K)^2*(s.total^4/(n : ℝ)^4*
        (C*(Γ.card : ℝ)*(n : ℝ)^(3+ξ)*(1+Real.log n))) :=
      mul_le_mul_of_nonneg_left
        (mul_le_mul_of_nonneg_left (hgeom n Γ p threshold) (by positivity)) (sq_nonneg _)
    _ = _ := by
      rw [hpow]
      field_simp [ne_of_gt hn]
      <;> ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.long_schedule_coarse_pair_le_const_rpow_log
