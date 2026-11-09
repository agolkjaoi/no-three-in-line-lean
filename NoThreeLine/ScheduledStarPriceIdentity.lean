import NoThreeLine.ScheduleInteriorCumulative
import NoThreeLine.ScheduledRetentionPrice
import NoThreeLine.ScheduledStarLatePath
import NoThreeLine.LongShortMeanBudget

/-! Exact identification of the current-mask phase price with the actual
schedule's cumulative input. The full phase sum has precisely 1/n^2. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness FinitePhase

theorem cutUnitPrice_schedule {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (B K ρ : ℝ) (N : Fin J) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (s.duration N)) (q : Grid n) :
    cutUnitPrice (scheduleSharedPhases s mask hm Γ B K ρ) N t q=
      s.cumulative (fun j=>mask j q) (s.lo N+t)/n := by
  rw [s.cumulative_inside _ N t ht]
  unfold cutUnitPrice
  rw [scheduleSharedPhases_mask]
  congr 2
  rw [←Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro j _
  rw [scheduleSharedPhases_horizon s mask hm Γ B K ρ ⟨j.val,j.isLt.trans N.isLt⟩,
    scheduleSharedPhases_mask s mask hm Γ B K ρ ⟨j.val,j.isLt.trans N.isLt⟩]

theorem maskedCutStarPriceSum_schedule {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H B K ρ : ℝ) (N : Fin J) (t : ℝ)
    (ht : t∈Icc (0:ℝ) (s.duration N)) :
    maskedCutStarPriceSum Γ p H (scheduleSharedPhases s mask hm Γ B K ρ) N t=
      (∑v∈shortStars Γ p H,mask N v.1*s.cumulative (fun j=>mask j v.2) (s.lo N+t))/n := by
  unfold maskedCutStarPriceSum
  rw [scheduleSharedPhases_mask,Finset.sum_div]
  apply Finset.sum_congr rfl
  intro v _
  rw [cutUnitPrice_schedule s mask hm Γ B K ρ N t ht]
  ring

theorem shortTimeMean_eq_phase_sum {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ) :
    shortTimeMean s mask Γ p H=
      (∑N : Fin J,∫t in (0:ℝ)..s.duration N,
        ∑v∈shortStars Γ p H,mask N v.1*s.cumulative (fun j=>mask j v.2) (s.lo N+t))/(n:ℝ)^2 := by
  classical
  have hc (q : Grid n) : Continuous (s.cumulative (fun j=>mask j q)) :=
    cumulative_continuous _ _ _ _
  unfold shortTimeMean
  congr 1
  rw [intervalIntegral.integral_finsetSum (fun v _=>
    rate_mul_cumulative_intervalIntegrable Finset.univ s.lo s.hi
      (fun j=>mask j v.1) (fun j=>mask j v.2) 0 s.total)]
  simp_rw [s.weighted_rate_integral_shifted _ _ (hc _)]
  rw [Finset.sum_comm]
  apply Finset.sum_congr rfl
  intro N _
  symm
  exact intervalIntegral.integral_finsetSum (fun v _=>
    (continuous_const.mul ((hc v.2).comp (continuous_const.add continuous_id))).intervalIntegrable _ _)

theorem starFullPrice_schedule_eq_shortTimeMean {J n : ℕ} (s : Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset ZPoint) (p : Grid n) (H B K ρ : ℝ) :
    starLatePrice (scheduleSharedPhases s mask hm Γ B K ρ) Γ p H J
      (fun _=>0) (fun N=>s.duration N)/n=shortTimeMean s mask Γ p H := by
  rw [shortTimeMean_eq_phase_sum]
  have hphase (N : Fin J) :
      (∫t in Ioo (0:ℝ) (s.duration N),
        maskedCutStarPriceSum Γ p H (scheduleSharedPhases s mask hm Γ B K ρ) N t)=
      (∫t in (0:ℝ)..s.duration N,
        ∑v∈shortStars Γ p H,mask N v.1*s.cumulative (fun j=>mask j v.2) (s.lo N+t))/n := by
    have hdur : 0≤s.duration N := sub_nonneg.mpr (s.lo_lt_hi N).le
    calc
      _ = ∫t in Ioo (0:ℝ) (s.duration N),
          (∑v∈shortStars Γ p H,mask N v.1*s.cumulative (fun j=>mask j v.2) (s.lo N+t))/n := by
        apply setIntegral_congr_fun measurableSet_Ioo
        intro t ht
        exact maskedCutStarPriceSum_schedule s mask hm Γ p H B K ρ N t ⟨ht.1.le,ht.2.le⟩
      _ = _ := by
        rw [←integral_Ioc_eq_integral_Ioo,←intervalIntegral.integral_of_le hdur,
          intervalIntegral.integral_div]
  unfold starLatePrice
  simp_rw [hphase]
  rw [←Finset.sum_div]
  ring

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.cutUnitPrice_schedule
#print axioms NoThreeLine.ShortStars.maskedCutStarPriceSum_schedule
#print axioms NoThreeLine.ShortStars.shortTimeMean_eq_phase_sum
#print axioms NoThreeLine.ShortStars.starFullPrice_schedule_eq_shortTimeMean
