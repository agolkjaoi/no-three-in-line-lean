import NoThreeLine.ScheduledCutUnitWitness

/-! Actual unit birth prices are bounded by the total duration divided
by n. Earlier phase masks and the current partial duration are retained. -/
set_option autoImplicit false
noncomputable section
open scoped BigOperators

namespace NoThreeLine.BirthWitness

theorem phaseEndpoint_zero_nonneg {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (J : ℕ) :
    0≤phaseEndpoint cs 0 J := by
  unfold phaseEndpoint
  positivity

theorem scheduled_unit_exposure_le_total {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (J N : ℕ) (hNJ : N<J) (z : Grid n) (t : ℝ) (ht : t≤(cs N).horizon) :
    (∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)+t*(cs N).mask z≤phaseEndpoint cs 0 J := by
  have hsum : (∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)≤∑j∈Finset.range N,((cs j).horizon:ℝ) :=
    Finset.sum_le_sum (fun j _=>mul_le_of_le_one_right (cs j).horizon.coe_nonneg ((cs j).mask_le_one z))
  have hlast : t*(cs N).mask z≤(cs N).horizon :=
    (mul_le_mul_of_nonneg_right ht ((cs N).mask_nonneg z)).trans
      (mul_le_of_le_one_right (cs N).horizon.coe_nonneg ((cs N).mask_le_one z))
  calc
    _ ≤ (∑j∈Finset.range N,((cs j).horizon:ℝ))+(cs N).horizon := add_le_add hsum hlast
    _ = phaseEndpoint cs 0 (N+1) := by simp [phaseEndpoint,Finset.sum_range_succ]
    _ ≤ phaseEndpoint cs 0 J := phaseEndpoint_mono cs 0 (Nat.succ_le_of_lt hNJ)

theorem scheduled_unit_price_le_total {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B)
    (J N : ℕ) (hNJ : N<J) (z : Grid n) (t : ℝ) (ht : t≤(cs N).horizon) :
    ((∑j∈Finset.range N,(cs j).horizon*(cs j).mask z)+t*(cs N).mask z)/n≤phaseEndpoint cs 0 J/n :=
  div_le_div_of_nonneg_right (scheduled_unit_exposure_le_total cs J N hNJ z t ht) (Nat.cast_nonneg n)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduled_unit_price_le_total
