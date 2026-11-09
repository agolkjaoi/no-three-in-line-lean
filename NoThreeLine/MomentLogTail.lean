import NoThreeLine.MomentLogScale
import Mathlib.Analysis.SpecificLimits.Basic

/-! Fixed degree precedes the large-board limit. These scalar bounds do not
assert a stopping estimate until the actual moment inputs are supplied. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.FiniteWitnessMoments

def logarithmicTailEnvelope (m : ℕ) (a b c W Q ξ ζ r : ℝ) (n : ℕ) : ℝ :=
  logarithmicMomentEnvelope m a b c W Q ξ ζ n/r^(m+2)

theorem logarithmicTailEnvelope_eq (m : ℕ) (a b c W Q ξ ζ r : ℝ) (n : ℕ) :
    logarithmicTailEnvelope m a b c W Q ξ ζ r n=
      separatedMomentBound m (a*Real.log (n:ℝ)+b) (c*(a*Real.log (n:ℝ)+b)) W
        (logPairBudget Q ξ n) ((n:ℝ)^(-ζ))/(r*Real.log (n:ℝ))^(m+2) := by
  unfold logarithmicTailEnvelope logarithmicMomentEnvelope
  rw [div_div,mul_pow,mul_comm (r^(m+2))]

theorem tendsto_logarithmicTailEnvelope (m : ℕ) (a b c W Q ξ ζ r : ℝ)
    (hξ : ξ<1) (hζ : 0<ζ) :
    Tendsto (logarithmicTailEnvelope m a b c W Q ξ ζ r) atTop (𝓝 ((a/r)^(m+2))) := by
  change Tendsto (fun n : ℕ=>logarithmicMomentEnvelope m a b c W Q ξ ζ n/r^(m+2)) atTop _
  simpa only [div_pow] using
    (tendsto_logarithmicMomentEnvelope m a b c W Q ξ ζ hξ hζ).div_const (r^(m+2))

theorem exists_fixed_moment_eventually_tail_lt (a b c W Q ξ ζ r ρ : ℝ)
    (ha : 0≤a) (hr : 0<r) (har : a<r) (hξ : ξ<1) (hζ : 0<ζ) (hρ : 0<ρ) :
    ∃m : ℕ, ∀ᶠ n : ℕ in atTop, logarithmicTailEnvelope m a b c W Q ξ ζ r n<ρ := by
  have hp := tendsto_pow_atTop_nhds_zero_of_lt_one (div_nonneg ha hr.le)
    ((div_lt_one hr).mpr har)
  have hp2 : Tendsto (fun m : ℕ=>(a/r)^(m+2)) atTop (𝓝 (0:ℝ)) := by
    simpa only [pow_add,zero_mul] using hp.mul_const ((a/r)^2)
  obtain ⟨m,hm⟩ := (hp2.eventually (gt_mem_nhds hρ)).exists
  exact ⟨m,(tendsto_logarithmicTailEnvelope m a b c W Q ξ ζ r hξ hζ).eventually (gt_mem_nhds hm)⟩

theorem exists_fixed_moment_tail_threshold (a b c W Q ξ ζ r ρ : ℝ)
    (ha : 0≤a) (hr : 0<r) (har : a<r) (hξ : ξ<1) (hζ : 0<ζ) (hρ : 0<ρ) :
    ∃m N : ℕ, 2≤N ∧ ∀n : ℕ, N≤n →
      separatedMomentBound m (a*Real.log (n:ℝ)+b) (c*(a*Real.log (n:ℝ)+b)) W
        (logPairBudget Q ξ n) ((n:ℝ)^(-ζ))/(r*Real.log (n:ℝ))^(m+2)<ρ := by
  obtain ⟨m,hm⟩ := exists_fixed_moment_eventually_tail_lt a b c W Q ξ ζ r ρ ha hr har hξ hζ hρ
  obtain ⟨N,hN⟩ := eventually_atTop.mp hm
  refine ⟨m,max N 2,le_max_right _ _,fun n hn=>?_⟩
  rw [←logarithmicTailEnvelope_eq]
  exact hN n ((le_max_left _ _).trans hn)

theorem separatedMomentBound_tail_le_logarithmic (m n : ℕ) (hn : 2≤n)
    (a b c W Q ξ ζ r A C V J : ℝ) (hr : 0<r)
    (hA : 0≤A) (hC : 0≤C) (hV : 0≤V) (hJ : 0≤J)
    (hε : (n:ℝ)^(-ζ)≤1) (hAA : A≤a*Real.log (n:ℝ)+b)
    (hCC : C≤c*(a*Real.log (n:ℝ)+b)) (hVW : V≤W) (hJJ : J≤logPairBudget Q ξ n) :
    separatedMomentBound m A C V J ((n:ℝ)^(-ζ))/(r*Real.log (n:ℝ))^(m+2)≤
      logarithmicTailEnvelope m a b c W Q ξ ζ r n := by
  rw [logarithmicTailEnvelope_eq]
  exact div_le_div_of_nonneg_right
    (separatedMomentBound_mono m A C V J _ _ W _ _ hA hC hV hJ hε hAA hCC hVW hJJ)
    (pow_nonneg (mul_nonneg hr.le (log_nat_pos hn).le) _)

end NoThreeLine.FiniteWitnessMoments

#print axioms NoThreeLine.FiniteWitnessMoments.exists_fixed_moment_tail_threshold
#print axioms NoThreeLine.FiniteWitnessMoments.separatedMomentBound_tail_le_logarithmic
