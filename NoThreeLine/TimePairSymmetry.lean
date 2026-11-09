import NoThreeLine.FinitePhaseIntegrals

/-! Exact common-deadline time symmetrization of the actual ordered board pairs.
The factor one half is produced by swapping the two distinct non-root points. -/
set_option autoImplicit false
open MeasureTheory Set
open scoped BigOperators Interval
noncomputable section
namespace NoThreeLine.FinitePhase
open FiniteDirections

def pairForm {X : Type*} [Fintype X] (E : X → X → Prop) [DecidableRel E]
    (a b : X → ℝ) : ℝ := ∑ q : X, ∑ r : X, if E q r then a q*b r else 0

theorem pairForm_swap {X : Type*} [Fintype X] (E : X → X → Prop) [DecidableRel E]
    (hsym : ∀ q r, E q r ↔ E r q) (a b : X → ℝ) : pairForm E a b = pairForm E b a := by
  unfold pairForm
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro q hq
  apply Finset.sum_congr rfl
  intro r hr
  simp only [hsym r q,mul_comm]

private theorem intervalIntegrable_sum {K : Type*} (S : Finset K) (f : K → ℝ → ℝ)
    (a b : ℝ) (hf : ∀ k ∈ S, IntervalIntegrable (f k) volume a b) :
    IntervalIntegrable (fun t => ∑ k ∈ S, f k t) volume a b := by
  exact ⟨integrable_finsetSum S (fun k hk => (hf k hk).1),
    integrable_finsetSum S (fun k hk => (hf k hk).2)⟩

theorem pairForm_phase_intervalIntegrable {J X : Type*} [Fintype X]
    (P : Finset J) (lo hi : J → ℝ) (c : J → X → ℝ)
    (E : X → X → Prop) [DecidableRel E] (a b : ℝ) :
    IntervalIntegrable (fun t => pairForm E (fun q => rate P lo hi (fun j => c j q) t)
      (fun q => cumulative P lo hi (fun j => c j q) t)) volume a b := by
  unfold pairForm
  apply intervalIntegrable_sum
  intro q hq
  apply intervalIntegrable_sum
  intro r hr
  by_cases h : E q r
  · simp only [h,ite_true]
    exact rate_mul_cumulative_intervalIntegrable P lo hi _ _ a b
  · simp only [h,ite_false]
    exact intervalIntegrable_const

theorem pairForm_time_identity {J X : Type*} [Fintype X]
    (P : Finset J) (lo hi : J → ℝ) (c : J → X → ℝ)
    (E : X → X → Prop) [DecidableRel E] (hsym : ∀ q r, E q r ↔ E r q) (T : ℝ) :
    (∫ t in (0 : ℝ)..T, pairForm E (fun q => rate P lo hi (fun j => c j q) t)
      (fun q => cumulative P lo hi (fun j => c j q) t)) =
      (1/2 : ℝ)*pairForm E (fun q => cumulative P lo hi (fun j => c j q) T)
        (fun q => cumulative P lo hi (fun j => c j q) T) := by
  let f := fun t => pairForm E (fun q => rate P lo hi (fun j => c j q) t)
    (fun q => cumulative P lo hi (fun j => c j q) t)
  have hf : IntervalIntegrable f volume 0 T := pairForm_phase_intervalIntegrable P lo hi c E 0 T
  have hsum : (∫ t in (0 : ℝ)..T, f t + f t) =
      pairForm E (fun q => cumulative P lo hi (fun j => c j q) T)
        (fun q => cumulative P lo hi (fun j => c j q) T) := by
    have hexpand (t : ℝ) : f t + f t =
        ∑ q : X, ∑ r : X, if E q r then
          rate P lo hi (fun j => c j q) t * cumulative P lo hi (fun j => c j r) t +
          cumulative P lo hi (fun j => c j q) t * rate P lo hi (fun j => c j r) t else 0 := by
      change pairForm E _ _ + pairForm E _ _ = _
      conv_lhs => rhs; rw [pairForm_swap E hsym]
      unfold pairForm
      rw [← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro q hq
      rw [← Finset.sum_add_distrib]
      apply Finset.sum_congr rfl
      intro r hr
      split_ifs <;> ring
    simp_rw [hexpand]
    rw [intervalIntegral.integral_finsetSum]
    · unfold pairForm
      apply Finset.sum_congr rfl
      intro q hq
      rw [intervalIntegral.integral_finsetSum]
      · apply Finset.sum_congr rfl
        intro r hr
        by_cases h : E q r
        · simp only [h,ite_true]
          exact cumulative_product_identity P lo hi _ _ T
        · simp [h]
      · intro r hr
        by_cases h : E q r
        · simp only [h,ite_true]
          exact (rate_mul_cumulative_intervalIntegrable P lo hi _ _ 0 T).add
            ((rate_integrable P lo hi _).intervalIntegrable.continuousOn_mul
              (cumulative_continuous P lo hi _).continuousOn)
        · simp only [h,ite_false]
          exact intervalIntegrable_const
    · intro q hq
      apply intervalIntegrable_sum
      intro r hr
      by_cases h : E q r
      · simp only [h,ite_true]
        exact (rate_mul_cumulative_intervalIntegrable P lo hi _ _ 0 T).add
          ((rate_integrable P lo hi _).intervalIntegrable.continuousOn_mul
            (cumulative_continuous P lo hi _).continuousOn)
      · simp only [h,ite_false]
        exact intervalIntegrable_const
  rw [intervalIntegral.integral_add hf hf] at hsum
  dsimp only [f] at hsum
  linarith

def boardPair {n : ℕ} (p q r : Grid n) : Prop :=
  q ≠ p ∧ r ≠ p ∧ q ≠ r ∧ orientedArea p q r = 0

instance {n : ℕ} (p : Grid n) : DecidableRel (boardPair p) := fun q r => by
  unfold boardPair
  infer_instance

theorem boardPair_swap {n : ℕ} (p q r : Grid n) : boardPair p q r ↔ boardPair p r q := by
  have harea : orientedArea p r q = - orientedArea p q r := by unfold orientedArea; ring
  simp only [boardPair,harea,neg_eq_zero]
  tauto

def timePairRisk {J : Type*} {n : ℕ} (P : Finset J) (lo hi : J → ℝ)
    (c : J → Grid n → ℝ) (p : Grid n) (T : ℝ) : ℝ :=
  (∫ t in (0 : ℝ)..T, pairForm (boardPair p) (fun q => rate P lo hi (fun j => c j q) t)
    (fun q => cumulative P lo hi (fun j => c j q) t))/(n : ℝ)^2

/-- G17: every point in both factors uses the same root deadline `T`. -/
theorem timePairRisk_eq_terminal {J : Type*} {n : ℕ} (P : Finset J) (lo hi : J → ℝ)
    (c : J → Grid n → ℝ) (p : Grid n) (T : ℝ) :
    timePairRisk P lo hi c p T = normalizedPairSum p
      (fun q => cumulative P lo hi (fun j => c j q) T) := by
  unfold timePairRisk
  rw [pairForm_time_identity P lo hi c (boardPair p) (boardPair_swap p) T]
  unfold normalizedPairSum collinearPairSum pairForm boardPair
  ring

end NoThreeLine.FinitePhase

#print axioms NoThreeLine.FinitePhase.pairForm_time_identity
#print axioms NoThreeLine.FinitePhase.timePairRisk_eq_terminal
