import NoThreeLine.ScheduledSavedBirthGate
import NoThreeLine.ScheduledRetentionPrice
import NoThreeLine.RemainingCost

/-! Exact calendar integration of a recorded-birth indicator. The clipped
future integral handles every real recorded timestamp, including times
outside the finite schedule. No process law is postulated here. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators
namespace NoThreeLine.BirthWitness

theorem recordedBirthGate_mul_integrable {n : ℕ} (b : BirthRecords n) (z : Grid n)
    (f : ℝ→ℝ) (hf : Integrable f) :
    Integrable (fun t=>recordedBirthGate b z t*f t) := by
  apply hf.bdd_mul (c:=1)
    (((recordedBirthGate_measurable z).comp (measurable_const.prodMk measurable_id)).aestronglyMeasurable)
  exact ae_of_all _ (fun t=>by
    change ‖recordedBirthGate b z t‖≤(1:ℝ)
    rw [Real.norm_eq_abs,abs_of_nonneg (recordedBirthGate_bounds b z t).1]
    exact (recordedBirthGate_bounds b z t).2)

theorem integral_after_birth_eq_remaining (f : ℝ→ℝ) (hf : Integrable f)
    (T u : ℝ) (hT : 0≤T) :
    (∫t in (0:ℝ)..T,if u≤t then f t else 0)=remainingIntegral f T u := by
  have hg : Integrable (fun t=>if u≤t then f t else 0) := by
    have he : (fun t=>if u≤t then f t else 0)=(Ici u).indicator f := by
      funext t
      simp only [indicator,mem_Ici]
    rw [he]
    exact hf.indicator measurableSet_Ici
  by_cases hu0 : u≤0
  · have hc : clippedBirthTime T u=0 := by
      unfold clippedBirthTime
      exact max_eq_left ((min_le_left u T).trans hu0)
    rw [remainingIntegral,hc]
    apply intervalIntegral.integral_congr_Ioo_of_le hT
    intro t ht
    exact if_pos (hu0.trans ht.1.le)
  by_cases huT : T≤u
  · rw [remainingIntegral_zero_after f T u hT huT]
    calc
      _ = ∫t in (0:ℝ)..T,(0:ℝ) := by
        apply intervalIntegral.integral_congr_Ioo_of_le hT
        intro t ht
        exact if_neg (not_le_of_gt (ht.2.trans_le huT))
      _ = 0 := intervalIntegral.integral_zero
  have hu : u∈Icc (0:ℝ) T := ⟨(lt_of_not_ge hu0).le,(lt_of_not_ge huT).le⟩
  rw [remainingIntegral_eq f T u hu]
  have hleft : (∫t in (0:ℝ)..u,if u≤t then f t else 0)=0 := by
    calc
      _ = ∫t in (0:ℝ)..u,(0:ℝ) := by
        apply intervalIntegral.integral_congr_Ioo_of_le hu.1
        intro t ht
        exact if_neg (not_le_of_gt ht.2)
      _ = 0 := intervalIntegral.integral_zero
  have hright : (∫t in u..T,if u≤t then f t else 0)=∫t in u..T,f t := by
    apply intervalIntegral.integral_congr_Ioo_of_le hu.2
    intro t ht
    exact if_pos ht.1.le
  have hadd := intervalIntegral.integral_add_adjacent_intervals
    (hg.intervalIntegrable : IntervalIntegrable _ volume 0 u)
    (hg.intervalIntegrable : IntervalIntegrable _ volume u T)
  simpa only [hleft,hright,zero_add] using hadd.symm

theorem recordedBirthGate_integral {n : ℕ} (b : BirthRecords n) (z : Grid n)
    (f : ℝ→ℝ) (hf : Integrable f) (T : ℝ) (hT : 0≤T) :
    (∫t in (0:ℝ)..T,recordedBirthGate b z t*f t)=
      if (b z).1=true then remainingIntegral f T (b z).2 else 0 := by
  by_cases hb : (b z).1=true
  · simp only [recordedBirthGate,hb,true_and,if_true,ite_mul,one_mul,zero_mul]
    exact integral_after_birth_eq_remaining f hf T (b z).2 hT
  · simp [recordedBirthGate,hb]

theorem schedule_recordedBirthGate_integral {J n : ℕ} (s : FinitePhase.Schedule J)
    (c : Fin J→ℝ) (b : BirthRecords n) (z : Grid n) :
    (∫t in (0:ℝ)..s.total,recordedBirthGate b z t*s.rate c t)=
      ∑j : Fin J,∫u in (0:ℝ)..s.duration j,recordedBirthGate b z (s.lo j+u)*c j := by
  have he : (fun t=>recordedBirthGate b z t*s.rate c t)=
      fun t=>∑j : Fin J,recordedBirthGate b z t*FinitePhase.pulse (s.lo j) (s.hi j) (c j) t := by
    funext t
    simp only [FinitePhase.Schedule.rate,FinitePhase.rate,Finset.mul_sum]
  rw [he,intervalIntegral.integral_finsetSum]
  · apply Finset.sum_congr rfl
    intro j _
    have hh := FinitePhase.pulse_mul_integral (s.lo j) (s.hi j) (c j) s.total
      (s.lo_nonneg j) (s.lo_lt_hi j).le (s.hi_le_total j) (recordedBirthGate b z)
    simp_rw [mul_comm] at hh
    rw [hh,intervalIntegral.integral_mul_const,intervalIntegral.integral_comp_add_left]
    simp only [add_zero,FinitePhase.Schedule.duration,add_sub_cancel]
    ring
  · intro j _
    exact (recordedBirthGate_mul_integrable b z _
      (FinitePhase.pulse_integrable (s.lo j) (s.hi j) (c j))).intervalIntegrable

end NoThreeLine.BirthWitness
#print axioms NoThreeLine.BirthWitness.recordedBirthGate_integral
#print axioms NoThreeLine.BirthWitness.schedule_recordedBirthGate_integral
