import NoThreeLine.ScheduledStarLatePath

/-! The total late error scale has no factor equal to the phase count:
the phase durations sum to the total elapsed horizon. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set
open scoped BigOperators

namespace NoThreeLine.ShortStars

theorem phase_end_elapsed_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start : ℝ) (N J : ℕ) (hNJ : N<J) :
    phaseEndpoint cs start N-start+(cs N).horizon≤phaseEndpoint cs start J-start := by
  have h := phaseEndpoint_mono cs start (Nat.succ_le_of_lt hNJ)
  rw [phaseEndpoint_succ] at h
  linarith

theorem phase_elapsed_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (start : ℝ) (J : ℕ) :
    0≤phaseEndpoint cs start J-start := by
  simp only [phaseEndpoint,add_sub_cancel_left]
  exact NNReal.coe_nonneg _

theorem phase_star_scale_integral_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start T : ℝ) (hn : 2≤n) (N J : ℕ) (hNJ : N<J)
    (hT : phaseEndpoint cs start J-start≤T) (a b : ℝ) (ha : 0≤a) (hb : b≤(cs N).horizon) :
    (∫t in Ioo a b,(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n)≤
      (cs N).horizon*(T*(n:ℝ)*Real.log n) := by
  have hT0 := (phase_elapsed_nonneg cs start J).trans hT
  have hc0 : 0≤T*(n:ℝ)*Real.log n := mul_nonneg
    (mul_nonneg hT0 (Nat.cast_nonneg n)) (FiniteWitnessMoments.log_nat_pos hn).le
  have hc : Continuous (fun t : ℝ=>(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n) := by fun_prop
  have hi : IntegrableOn (fun t : ℝ=>(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n) (Ioo a b) :=
    hc.continuousOn.integrableOn_Icc.mono_set Ioo_subset_Icc_self
  have hbound : (∫t in Ioo a b,(phaseEndpoint cs start N-start+t)*(n:ℝ)*Real.log n)≤
      ∫_t in Ioo a b,T*(n:ℝ)*Real.log n := by
    apply integral_mono_ae hi (integrable_const _)
    filter_upwards [ae_restrict_mem measurableSet_Ioo] with t ht
    have hτ : phaseEndpoint cs start N-start+t≤T :=
      (add_le_add le_rfl (ht.2.le.trans hb)).trans ((phase_end_elapsed_le cs start N J hNJ).trans hT)
    exact mul_le_mul_of_nonneg_right (mul_le_mul_of_nonneg_right hτ (Nat.cast_nonneg n))
      (FiniteWitnessMoments.log_nat_pos hn).le
  have hlen : max (b-a) 0≤((cs N).horizon:ℝ) := max_le (by linarith) (cs N).horizon.coe_nonneg
  calc
    _ ≤ ∫_t in Ioo a b,T*(n:ℝ)*Real.log n := hbound
    _ = max (b-a) 0*(T*(n:ℝ)*Real.log n) := by
      rw [integral_const,smul_eq_mul,measureReal_restrict_apply_univ,Real.volume_real_Ioo]
    _ ≤ _ := mul_le_mul_of_nonneg_right hlen hc0

theorem starLateScale_le {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (start T : ℝ) (hn : 2≤n) (J : ℕ) (a b : Fin J→ℝ)
    (ha : ∀N,0≤a N) (hb : ∀N,b N≤(cs N).horizon)
    (hT : phaseEndpoint cs start J-start≤T) :
    starLateScale cs start J a b≤T^2*(n:ℝ)*Real.log n := by
  have hT0 := (phase_elapsed_nonneg cs start J).trans hT
  have hc0 : 0≤T*(n:ℝ)*Real.log n := mul_nonneg
    (mul_nonneg hT0 (Nat.cast_nonneg n)) (FiniteWitnessMoments.log_nat_pos hn).le
  have he : (∑N : Fin J,((cs N).horizon:ℝ))=phaseEndpoint cs start J-start := by
    rw [Fin.sum_univ_eq_sum_range (fun N : ℕ=>((cs N).horizon:ℝ))]
    simp [phaseEndpoint]
  calc
    _ ≤ ∑N : Fin J,((cs N).horizon:ℝ)*(T*(n:ℝ)*Real.log n) :=
      Finset.sum_le_sum (fun N _=>phase_star_scale_integral_le cs start T hn N J N.isLt hT (a N) (b N) (ha N) (hb N))
    _ = (phaseEndpoint cs start J-start)*(T*(n:ℝ)*Real.log n) := by rw [←Finset.sum_mul,he]
    _ ≤ T*(T*(n:ℝ)*Real.log n) := mul_le_mul_of_nonneg_right hT hc0
    _ = _ := by ring

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.phase_star_scale_integral_le
#print axioms NoThreeLine.ShortStars.starLateScale_le
