import NoThreeLine.LongLinePrices
import NoThreeLine.TimePairFuture

/-! The exact long-witness unit mean is bounded by the manuscript's
normalized pair sum with its factor one half, at one common deadline. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open GridLines FinitePhase FiniteDirections

theorem witnessLeaves_eq_boardPair {n : ℕ} (p z : Grid n) (hz : z≠p) :
    witnessLeaves p z=Finset.univ.filter (boardPair p z) := by
  classical
  ext q
  simp only [witnessLeaves,Finset.mem_erase,mem_lineThrough,Finset.mem_filter,Finset.mem_univ,
    true_and,boardPair]
  tauto

theorem lineFutureCost_sum {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (p z : Grid n) (u : ℝ) :
    lineFutureCost s mask p z u=
      (∑q∈witnessLeaves p z,remainingIntegral (s.rate (fun j=>mask j q)) s.total u)/n := by
  unfold lineFutureCost remainingIntegral lineMaskRate
  rw [intervalIntegral.integral_finsetSum]
  intro q _
  exact (rate_integrable Finset.univ s.lo s.hi (fun j=>mask j q)).intervalIntegrable

theorem longBirthIntegrand_le_pairForm {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (p : Grid n) (threshold : ℝ) (u : ℝ) :
    (∑z : Grid n,s.rate (fun j=>mask j z) u*longWitnessCost s mask Γ p threshold z u/n)≤
      pairForm (boardPair p) (fun z=>s.rate (fun j=>mask j z) u)
        (fun q=>remainingIntegral (s.rate (fun j=>mask j q)) s.total u)/(n:ℝ)^2 := by
  classical
  have hf (q : Grid n) : 0≤remainingIntegral (s.rate (fun j=>mask j q)) s.total u :=
    (remainingIntegral_bounds _ (rate_integrable Finset.univ s.lo s.hi (fun j=>mask j q))
      s.total 1 u s.total_nonneg zero_le_one (s.rate_bounds _ (fun j=>hm j q))).1
  unfold pairForm
  rw [Finset.sum_div]
  apply Finset.sum_le_sum
  intro z _
  have hmz := (s.rate_bounds (fun j=>mask j z) (fun j=>hm j z) u).1
  by_cases hz : longWitnessEligible Γ p threshold z
  · have he : (∑q : Grid n,if boardPair p z q then
        s.rate (fun j=>mask j z) u*remainingIntegral (s.rate (fun j=>mask j q)) s.total u else 0)=
        s.rate (fun j=>mask j z) u*
          ∑q∈witnessLeaves p z,remainingIntegral (s.rate (fun j=>mask j q)) s.total u := by
      rw [witnessLeaves_eq_boardPair p z hz.1,Finset.sum_filter,Finset.mul_sum]
      apply Finset.sum_congr rfl
      intro q _
      split_ifs <;> simp
    rw [longWitnessCost,if_pos hz,lineFutureCost_sum,he]
    exact le_of_eq (by ring)
  · rw [longWitnessCost,if_neg hz,mul_zero,zero_div]
    apply div_nonneg _ (sq_nonneg _)
    apply Finset.sum_nonneg
    intro q _
    split_ifs
    · exact mul_nonneg hmz (hf q)
    · exact le_rfl

private theorem intervalIntegrable_sum {X : Type*} (S : Finset X) (f : X→ℝ→ℝ) (a b : ℝ)
    (hf : ∀x∈S,IntervalIntegrable (f x) volume a b) :
    IntervalIntegrable (fun t=>∑x∈S,f x t) volume a b :=
  ⟨integrable_finsetSum S (fun x hx=>(hf x hx).1),integrable_finsetSum S (fun x hx=>(hf x hx).2)⟩

theorem schedule_future_pair_integrable {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (p : Grid n) (a b : ℝ) :
    IntervalIntegrable (fun u=>pairForm (boardPair p) (fun z=>s.rate (fun j=>mask j z) u)
      (fun q=>remainingIntegral (s.rate (fun j=>mask j q)) s.total u)) volume a b := by
  unfold pairForm
  apply intervalIntegrable_sum
  intro z _
  apply intervalIntegrable_sum
  intro q _
  by_cases h : boardPair p z q
  · simp only [if_pos h]
    exact (rate_integrable Finset.univ s.lo s.hi (fun j=>mask j z)).intervalIntegrable.mul_continuousOn
      (remainingIntegral_continuous _ (rate_integrable Finset.univ s.lo s.hi (fun j=>mask j q)) s.total).continuousOn
  · simp only [if_neg h]
    exact intervalIntegrable_const

theorem longBirthMean_le_normalizedPairSum {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ)) (p : Grid n) (threshold : ℝ) :
    (∑z : Grid n,longBirthPrice s mask Γ p threshold z)≤
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) s.total) := by
  have hleft : IntervalIntegrable (fun u=>∑z : Grid n,
      s.rate (fun j=>mask j z) u*longWitnessCost s mask Γ p threshold z u/n) volume 0 s.total :=
    intervalIntegrable_sum _ _ _ _ (fun z _=>longBirthPrice_integrand_integrable s mask Γ p threshold z 0 s.total)
  calc
    _ = ∫u in (0:ℝ)..s.total,∑z : Grid n,
        s.rate (fun j=>mask j z) u*longWitnessCost s mask Γ p threshold z u/n := by
      symm
      exact intervalIntegral.integral_finsetSum (fun z _=>longBirthPrice_integrand_integrable s mask Γ p threshold z 0 s.total)
    _ ≤ ∫u in (0:ℝ)..s.total,pairForm (boardPair p) (fun z=>s.rate (fun j=>mask j z) u)
        (fun q=>remainingIntegral (s.rate (fun j=>mask j q)) s.total u)/(n:ℝ)^2 :=
      intervalIntegral.integral_mono_on s.total_nonneg hleft ((schedule_future_pair_integrable s mask p 0 s.total).div_const _)
        (fun u _=>longBirthIntegrand_le_pairForm s mask hm Γ p threshold u)
    _ = normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) s.total) := by
      rw [intervalIntegral.integral_div]
      change (∫u in (0:ℝ)..s.total,pairForm (boardPair p) (fun z=>rate Finset.univ s.lo s.hi (fun j=>mask j z) u)
        (fun q=>remainingIntegral (rate Finset.univ s.lo s.hi (fun j=>mask j q)) s.total u))/(n:ℝ)^2=_
      rw [pairForm_future_time_identity Finset.univ s.lo s.hi mask (boardPair p) (boardPair_swap p) s.total s.total_nonneg]
      unfold normalizedPairSum collinearPairSum pairForm boardPair Schedule.cumulative
      ring

theorem long_schedule_unit_mean_le_pairSum {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1) (Γ : Finset (ℤ×ℤ))
    (B K ρ : ℝ) (p : Grid n) (threshold : ℝ) :
    (∑z : Grid n,longWitnessWeight s Γ p threshold z*
      accumulatedPhaseUnitPrice (scheduleSharedPhases s mask hm Γ B K ρ) 0
        (longWitnessRetention s mask hm Γ p threshold) J z)≤
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) s.total) := by
  rw [long_schedule_unit_mean_identity]
  exact longBirthMean_le_normalizedPairSum s mask hm Γ p threshold

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.longBirthMean_le_normalizedPairSum
#print axioms NoThreeLine.BirthWitness.long_schedule_unit_mean_le_pairSum
