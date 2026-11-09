import NoThreeLine.ScheduledCutBirthMean

/-! Exact phase-by-phase birth exposure minus actual tilted unavailable
probability. The prefix has been averaged using its real residual board;
no individual inherited state is assigned unit credit. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

def integratedScheduledCutLoss {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) : ℝ :=
  ∫t in (0:ℝ)..(cs k).horizon,
    ((cs k).mask p/n)*scheduledCutLossProbability cs ε M deadline start hn hB p k t

theorem scheduledCutLoss_intervalIntegrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    IntervalIntegrable (fun t=>((cs k).mask p/n)*scheduledCutLossProbability cs ε M deadline start hn hB p k t)
      volume 0 (cs k).horizon := by
  have hi : IntervalIntegrable (scheduledCutLossProbability cs ε M deadline start hn hB p k)
      volume 0 (cs k).horizon := by
    apply (intervalIntegrable_iff_integrableOn_Ioo_of_le (cs k).horizon.coe_nonneg).mpr
    exact integrableOn_of_nonneg_bound volume (Ioo (0:ℝ) (cs k).horizon) measurableSet_Ioo _
      (scheduledCutLossProbability_measurable cs ε M deadline start hn hB p k)
      1 (fun t _=>scheduledCutLossProbability_bounds cs ε M deadline start hn hB p k t)
  exact hi.const_mul _

theorem integratedScheduledCutLoss_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    0 ≤ integratedScheduledCutLoss cs ε M deadline start hn hB p k ∧
      integratedScheduledCutLoss cs ε M deadline start hn hB p k≤(cs k).horizon*((cs k).mask p/n) := by
  have hc : 0≤(cs k).mask p/n := div_nonneg ((cs k).mask_nonneg p) (Nat.cast_nonneg n)
  exact integral_initial_segment_bounds (cs k).horizon (cs k).horizon (cs k).horizon.coe_nonneg le_rfl
    (fun t=>((cs k).mask p/n)*scheduledCutLossProbability cs ε M deadline start hn hB p k t)
    (measurable_const.mul (scheduledCutLossProbability_measurable cs ε M deadline start hn hB p k))
    ((cs k).mask p/n) hc (fun t _=>by
      have h := scheduledCutLossProbability_bounds cs ε M deadline start hn hB p k t
      exact ⟨mul_nonneg hc h.1,by simpa only [mul_one] using mul_le_mul_of_nonneg_left h.2 hc⟩)

theorem scheduledBirthIncrement_mean_loss {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    (∫ω,scheduledBirthIncrement cs ε M deadline start p hn (augInitialState B hB deadline start) k ω
      ∂boardClockMeasure n (B/n))=(cs k).horizon*((cs k).mask p/n)-
        integratedScheduledCutLoss cs ε M deadline start hn hB p k := by
  have hs := scheduledBirthIncrement_mean_cut cs ε M deadline start p hn
    (lt_of_lt_of_le zero_lt_one hB) (initialGoodPhaseObservation B hB deadline start) k
  change (∫ω,scheduledBirthIncrement cs ε M deadline start p hn (augInitialState B hB deadline start) k ω
    ∂boardClockMeasure n (B/n))=_ at hs
  rw [hs]
  simp_rw [scheduledCut_birthRate_mean_loss cs ε M deadline start hn hB p k]
  rw [intervalIntegral.integral_sub intervalIntegrable_const
    (scheduledCutLoss_intervalIntegrable cs ε M deadline start hn hB p k),intervalIntegral.integral_const]
  simp only [sub_zero,smul_eq_mul,integratedScheduledCutLoss]

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.integratedScheduledCutLoss_bounds
#print axioms NoThreeLine.BirthWitness.scheduledBirthIncrement_mean_loss
