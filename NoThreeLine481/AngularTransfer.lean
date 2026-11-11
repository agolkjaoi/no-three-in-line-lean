import NoThreeLine.FiniteS6

/-! The finite lattice estimate has a constant error for a fixed partition
and cap. Strict angular slack absorbs it uniformly in the root and weights. -/
set_option autoImplicit false
set_option maxHeartbeats 1600000
noncomputable section

namespace NoThreeLine481
open NoThreeLine PrimitiveLines FiniteDirections

private def pairError (m : ℕ) (M : ℝ) : ℝ :=
  ((4*(m:ℝ)+1)*M)^2 + 5*M*((4*(m:ℝ)+1)*M) + 10*M^2 +
    6*25586*(4*(m:ℝ)+3)*M^2

theorem eventually_pair_budget_of_angular {ι : Type*}
    (S : Finset ι) (R : ι → Rect) (V H : Finset ℝ) (M r a : ℝ)
    (hM : 0 ≤ M) (hra : r < a) (hsep : RectanglesSeparated S R)
    (hR : ∀ i ∈ S, (R i).InUnitSquare) :
    ∃ N : ℕ, ∀ n ≥ N, ∀ (p : Grid n) (w : ZPoint → ι → ℝ),
      (∀ z i, i ∈ S → 0 ≤ w z i ∧ w z i ≤ M) →
      ((76/125:ℝ)/24)*typedAngularIntegralSum S R w V H p ≤ r →
      normalizedPairSum p (maskedTypedBoardWeight S R w V H) ≤ a*Real.log n := by
  let C := pairError S.card M
  obtain ⟨N, hN⟩ := exists_nat_gt (Real.exp (C/(a-r)))
  refine ⟨max (max 1 ConcreteSieve.Q) N, ?_⟩
  intro n hn p w hw hr
  have hNQ : ConcreteSieve.Q ≤ n := by omega
  have hn1 : (1:ℝ) ≤ n := by exact_mod_cast (show 1 ≤ n by omega)
  have hlog : 0 ≤ Real.log (n:ℝ) := Real.log_nonneg hn1
  have hNn : (N:ℝ) ≤ n := by exact_mod_cast (show N ≤ n by omega)
  have hlogBound : C/(a-r) ≤ Real.log (n:ℝ) := by
    rw [← Real.log_exp (C/(a-r))]
    exact (Real.log_le_log_iff (Real.exp_pos _) (zero_lt_one.trans_le hn1)).mpr
      (hN.le.trans hNn)
  have hC : C ≤ Real.log (n:ℝ)*(a-r) :=
    (div_le_iff₀ (sub_pos.mpr hra)).mp hlogBound
  have hs := masked_board_sieve_upper S R w V H p M hM hsep hw hR hNQ
  have hmul := mul_le_mul_of_nonneg_right hr hlog
  dsimp only [C, pairError] at hC
  nlinarith only [hs, hmul, hC]

#print axioms eventually_pair_budget_of_angular

end NoThreeLine481
