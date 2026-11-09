import NoThreeLine.LongShortPairPartition

/-! One common deterministic deadline for the long future-cost mean and
the short past-price mean. Their combined main term uses the board-pair
budget once, with its exact factor one half. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open PrimitiveLines GridLines FinitePhase FiniteDirections
local instance (P : Prop) : Decidable P := Classical.propDecidable P

theorem shortStar_sum_eq_pairForm {n : ℕ} (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (a b : Grid n→ℝ) :
    (∑s∈ShortStars.shortStars Γ p H,a s.1*b s.2)=pairForm (ShortStars.Valid Γ p H) a b := by
  unfold ShortStars.shortStars pairForm
  rw [Finset.sum_filter]
  exact Fintype.sum_prod_type _

def shortTimeMean {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) : ℝ :=
  (∫t in (0:ℝ)..s.total,∑v∈ShortStars.shortStars Γ p H,
    s.rate (fun j=>mask j v.1) t*s.cumulative (fun j=>mask j v.2) t)/(n:ℝ)^2

theorem shortTimeMean_eq_half {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    shortTimeMean s mask Γ p H=
      ((1/2:ℝ)*pairForm (ShortStars.Valid Γ p H)
        (fun q=>s.cumulative (fun j=>mask j q) s.total)
        (fun q=>s.cumulative (fun j=>mask j q) s.total))/(n:ℝ)^2 := by
  unfold shortTimeMean
  have he : (∫t in (0:ℝ)..s.total,∑v∈ShortStars.shortStars Γ p H,
      s.rate (fun j=>mask j v.1) t*s.cumulative (fun j=>mask j v.2) t)=
      ∫t in (0:ℝ)..s.total,pairForm (ShortStars.Valid Γ p H)
        (fun q=>s.rate (fun j=>mask j q) t) (fun q=>s.cumulative (fun j=>mask j q) t) := by
    apply intervalIntegral.integral_congr
    intro t _
    exact shortStar_sum_eq_pairForm Γ p H (fun q=>s.rate (fun j=>mask j q) t)
      (fun q=>s.cumulative (fun j=>mask j q) t)
  rw [he]
  rw [show (∫t in (0:ℝ)..s.total,pairForm (ShortStars.Valid Γ p H)
      (fun q=>s.rate (fun j=>mask j q) t) (fun q=>s.cumulative (fun j=>mask j q) t))=
      (1/2:ℝ)*pairForm (ShortStars.Valid Γ p H)
        (fun q=>s.cumulative (fun j=>mask j q) s.total)
        (fun q=>s.cumulative (fun j=>mask j q) s.total) from
    pairForm_time_identity Finset.univ s.lo s.hi mask (ShortStars.Valid Γ p H)
      (ShortStars.valid_swap_iff Γ p H) s.total]

theorem longBirthMean_eq_half {J n : ℕ} (s : Schedule J) (mask : Fin J→Grid n→ℝ)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    (∑z : Grid n,longBirthPrice s mask Γ p H z)=
      ((1/2:ℝ)*pairForm (longBoardPair Γ p H)
        (fun q=>s.cumulative (fun j=>mask j q) s.total)
        (fun q=>s.cumulative (fun j=>mask j q) s.total))/(n:ℝ)^2 := by
  calc
    _ = ∫u in (0:ℝ)..s.total,∑z : Grid n,
        s.rate (fun j=>mask j z) u*longWitnessCost s mask Γ p H z u/n := by
      symm
      exact intervalIntegral.integral_finsetSum (fun z _=>longBirthPrice_integrand_integrable s mask Γ p H z 0 s.total)
    _ = (∫u in (0:ℝ)..s.total,pairForm (longBoardPair Γ p H)
        (fun z=>s.rate (fun j=>mask j z) u)
        (fun q=>remainingIntegral (s.rate (fun j=>mask j q)) s.total u))/(n:ℝ)^2 := by
      simp_rw [longBirthIntegrand_eq_longPair]
      exact intervalIntegral.integral_div _ _
    _ = _ := by
      rw [show (∫u in (0:ℝ)..s.total,pairForm (longBoardPair Γ p H)
          (fun z=>s.rate (fun j=>mask j z) u)
          (fun q=>remainingIntegral (s.rate (fun j=>mask j q)) s.total u))=
          (1/2:ℝ)*pairForm (longBoardPair Γ p H)
            (fun q=>s.cumulative (fun j=>mask j q) s.total)
            (fun q=>s.cumulative (fun j=>mask j q) s.total) from
        pairForm_future_time_identity Finset.univ s.lo s.hi mask (longBoardPair Γ p H)
          (longBoardPair_swap Γ p H) s.total s.total_nonneg]

theorem long_short_mean_le_normalizedPairSum {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    (∑z : Grid n,longBirthPrice s mask Γ p H z)+shortTimeMean s mask Γ p H≤
      normalizedPairSum p (fun q=>s.cumulative (fun j=>mask j q) s.total) := by
  have hc (q : Grid n) : 0≤s.cumulative (fun j=>mask j q) s.total :=
    (s.cumulative_bounds _ (fun j=>hm j q) s.total s.total_nonneg).1
  rw [longBirthMean_eq_half,shortTimeMean_eq_half]
  calc
    _ = ((1/2:ℝ)*(pairForm (longBoardPair Γ p H)
        (fun q=>s.cumulative (fun j=>mask j q) s.total) (fun q=>s.cumulative (fun j=>mask j q) s.total)+
      pairForm (ShortStars.Valid Γ p H)
        (fun q=>s.cumulative (fun j=>mask j q) s.total) (fun q=>s.cumulative (fun j=>mask j q) s.total)))/(n:ℝ)^2 := by ring
    _ ≤ ((1/2:ℝ)*pairForm (boardPair p)
        (fun q=>s.cumulative (fun j=>mask j q) s.total) (fun q=>s.cumulative (fun j=>mask j q) s.total))/(n:ℝ)^2 :=
      div_le_div_of_nonneg_right (mul_le_mul_of_nonneg_left
        (pairForm_long_short_le Γ p H _ _ hc hc) (by norm_num)) (sq_nonneg _)
    _ = _ := by unfold normalizedPairSum collinearPairSum pairForm boardPair; ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.shortTimeMean_eq_half
#print axioms NoThreeLine.BirthWitness.longBirthMean_eq_half
#print axioms NoThreeLine.BirthWitness.long_short_mean_le_normalizedPairSum
