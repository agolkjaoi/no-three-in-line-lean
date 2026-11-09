import NoThreeLine.MomentLogScale

/-! For B=n^d with d<1, fixed self-time and specified-clock costs leave
any strictly smaller logarithmic risk threshold below the weight cap. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine
open FiniteWitnessMoments

theorem tendsto_weightCapError_normalized (T C d : ℝ) (hd : d<1) :
    Tendsto (fun n : ℕ=>(T*(n:ℝ)^(d-1)+C)/Real.log n) atTop (𝓝 (0:ℝ)) := by
  have hp : Tendsto (fun n : ℕ=>(n:ℝ)^(d-1)) atTop (𝓝 (0:ℝ)) := by
    simpa only [neg_sub] using tendsto_nat_rpow_negative (1-d) (sub_pos.mpr hd)
  simpa only [div_eq_mul_inv,mul_zero,zero_add] using
    ((hp.const_mul T).add_const C).mul tendsto_inv_log_nat

theorem exists_weightCap_risk_threshold (T C d r : ℝ) (hd : d<1) (hr : r<d) :
    ∃N : ℕ,2≤N ∧ ∀n : ℕ,N≤n →
      r*Real.log n≤Real.log ((n:ℝ)^d)-((n:ℝ)^d/n)*T-C := by
  have he := (tendsto_weightCapError_normalized T C d hd).eventually
    (gt_mem_nhds (sub_pos.mpr hr))
  obtain ⟨N,hN⟩ := eventually_atTop.mp he
  refine ⟨max N 2,le_max_right _ _,?_⟩
  intro n hn
  have hn2 : 2≤n := (le_max_right _ _).trans hn
  have hn0 : 0<(n:ℝ) := by exact_mod_cast (show 0<n by omega)
  have hsmall := (div_lt_iff₀ (log_nat_pos hn2)).mp (hN n ((le_max_left _ _).trans hn))
  rw [Real.log_rpow hn0,←Real.rpow_sub_one hn0.ne' d]
  nlinarith

end NoThreeLine

#print axioms NoThreeLine.tendsto_weightCapError_normalized
#print axioms NoThreeLine.exists_weightCap_risk_threshold
