import NoThreeLine.ScheduleProcessBridge
import NoThreeLine.FinitePhaseCoarseProduct

/-! The accumulated actual phase price equals one calendar integral of
the same finite schedule mask. Time is integrated exactly once. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.FinitePhase

theorem pulse_mul_integral (a b c T : ℝ) (ha : 0≤a) (hab : a≤b) (hb : b≤T) (f : ℝ→ℝ) :
    (∫t in (0:ℝ)..T,pulse a b c t*f t)=c*∫t in a..b,f t := by
  have he : (fun t=>pulse a b c t*f t)=(Ico a b).indicator (fun t=>c*f t) := by
    funext t
    by_cases ht : t∈Ico a b <;> simp [pulse,ht]
  rw [he,intervalIntegral.integral_of_le (ha.trans (hab.trans hb)),←integral_Ico_eq_integral_Ioc,
    integral_indicator measurableSet_Ico,Measure.restrict_restrict measurableSet_Ico]
  have hi : Ico a b∩Ico (0:ℝ) T=Ico a b := inter_eq_left.mpr
    (fun t ht=>⟨ha.trans ht.1,ht.2.trans_le hb⟩)
  rw [hi,integral_Ico_eq_integral_Ioc,←intervalIntegral.integral_of_le hab,
    intervalIntegral.integral_const_mul]

theorem Schedule.weighted_rate_integral {J : ℕ} (s : Schedule J) (c : Fin J→ℝ)
    (f : ℝ→ℝ) (hf : Continuous f) :
    (∫t in (0:ℝ)..s.total,s.rate c t*f t)=∑j : Fin J,c j*∫t in s.lo j..s.hi j,f t := by
  have he : (fun t=>s.rate c t*f t)=fun t=>∑j : Fin J,pulse (s.lo j) (s.hi j) (c j) t*f t := by
    funext t
    simp only [Schedule.rate,FinitePhase.rate,Finset.sum_mul]
  rw [he,intervalIntegral.integral_finsetSum]
  · exact Finset.sum_congr rfl (fun j _=>pulse_mul_integral _ _ _ _
      (s.lo_nonneg j) (s.lo_lt_hi j).le (s.hi_le_total j) f)
  · intro j _
    exact (pulse_integrable (s.lo j) (s.hi j) (c j)).intervalIntegrable.mul_continuousOn hf.continuousOn

theorem Schedule.weighted_rate_integral_shifted {J : ℕ} (s : Schedule J) (c : Fin J→ℝ)
    (f : ℝ→ℝ) (hf : Continuous f) :
    (∫t in (0:ℝ)..s.total,s.rate c t*f t)=
      ∑j : Fin J,∫u in (0:ℝ)..s.duration j,c j*f (s.lo j+u) := by
  rw [s.weighted_rate_integral c f hf]
  apply Finset.sum_congr rfl
  intro j _
  rw [intervalIntegral.integral_const_mul,intervalIntegral.integral_comp_add_left]
  simp only [add_zero,Schedule.duration,add_sub_cancel]

end NoThreeLine.FinitePhase

namespace NoThreeLine.BirthWitness

theorem schedule_accumulated_unit_price {J n : ℕ} (s : FinitePhase.Schedule J)
    (mask : Fin J→Grid n→ℝ) (hm : ∀j q,0≤mask j q ∧ mask j q≤1)
    (Γ : Finset (ℤ×ℤ)) (B K ρ : ℝ) (e : Retention n) (q : Grid n)
    (he : Continuous (e.value q)) :
    accumulatedPhaseUnitPrice (scheduleSharedPhases s mask hm Γ B K ρ) 0 e J q=
      ∫t in (0:ℝ)..s.total,s.rate (fun j=>mask j q) t*e.value q t/n := by
  have hh := s.weighted_rate_integral_shifted (fun j=>mask j q) (fun t=>e.value q t/n) (he.div_const n)
  simp only [←mul_div_assoc] at hh
  rw [hh]
  unfold accumulatedPhaseUnitPrice
  rw [←Fin.sum_univ_eq_sum_range]
  apply Finset.sum_congr rfl
  intro j _
  rw [scheduleSharedPhases_horizon,scheduleSharedPhases_lo]
  apply intervalIntegral.integral_congr
  intro u _
  change (scheduleSharedPhases s mask hm Γ B K ρ j.val).mask q*e.value q (s.lo j+u)/n=_
  rw [scheduleSharedPhases_mask]

theorem accumulated_coarse_price_eq_const_mul {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (e : Retention n) (k : ℕ) (q : Grid n) (Γ : Finset (ℤ×ℤ)) (K : ℝ)
    (hΓ : ∀j,(cs j).directions=Γ) (hK : ∀j,(cs j).K=K) :
    accumulatedPhaseCoarsePrice cs start e k q=
      max 1 (AuxiliaryODE.protection 1 K)^Γ.card*accumulatedPhaseUnitPrice cs start e k q := by
  unfold accumulatedPhaseCoarsePrice accumulatedPhaseUnitPrice
  rw [Finset.mul_sum]
  apply Finset.sum_congr rfl
  intro j _
  change (∫u in (0:ℝ)..(cs j).horizon,
    ((cs j).mask q*e.value q (phaseEndpoint cs start j+u)/n)*
      max 1 (AuxiliaryODE.protection 1 (cs j).K)^(cs j).directions.card)=_
  rw [hΓ j,hK j,intervalIntegral.integral_mul_const]
  unfold phaseUnitCoefficient
  ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.FinitePhase.Schedule.weighted_rate_integral_shifted
#print axioms NoThreeLine.BirthWitness.schedule_accumulated_unit_price
#print axioms NoThreeLine.BirthWitness.accumulated_coarse_price_eq_const_mul
