import NoThreeLine.Target
import Mathlib.Topology.Algebra.InfiniteSum.Real
import Mathlib.Tactic

/-! Deterministic waiting-time facts used to prove non-explosion of a genuine
clock law. The probabilistic hypotheses are supplied in ExponentialClocks. -/
set_option autoImplicit false
open Filter Set
open scoped Topology BigOperators

namespace NoThreeLine

def arrivalTime (wait : ℕ → ℝ) (n : ℕ) : ℝ := ∑ k ∈ Finset.range n, wait k

theorem arrivalTime_strictMono (wait : ℕ → ℝ) (hw : ∀ k, 0 < wait k) :
    StrictMono (arrivalTime wait) := by
  apply strictMono_nat_of_lt_succ
  intro k
  simp only [arrivalTime,Finset.sum_range_succ]
  exact lt_add_of_pos_right _ (hw k)

theorem arrivalTime_tendsto_of_long_waits (wait : ℕ → ℝ)
    (hw : ∀ k, 0 ≤ wait k) (hlong : ∃ᶠ k in atTop, 1 < wait k) :
    Tendsto (arrivalTime wait) atTop atTop := by
  apply (not_summable_iff_tendsto_nat_atTop_of_nonneg hw).mp
  intro hs
  have hsmall : ∀ᶠ k in atTop, wait k < 1 :=
    hs.tendsto_atTop_zero.eventually (gt_mem_nhds (by norm_num : (0 : ℝ) < 1))
  obtain ⟨k,hbig,hsmall⟩ := (hlong.and_eventually hsmall).exists
  exact (not_lt_of_ge hbig.le) hsmall

theorem finite_arrivals_before (wait : ℕ → ℝ)
    (hdiv : Tendsto (arrivalTime wait) atTop atTop) (T : ℝ) :
    Set.Finite {k | arrivalTime wait k ≤ T} := by
  obtain ⟨N,hN⟩ := eventually_atTop.mp (hdiv.eventually (eventually_gt_atTop T))
  apply (Set.finite_lt_nat N).subset
  intro k hk
  by_contra h
  exact (not_lt_of_ge hk) (hN k (Nat.le_of_not_gt h))

end NoThreeLine

#print axioms NoThreeLine.arrivalTime_tendsto_of_long_waits
#print axioms NoThreeLine.finite_arrivals_before
