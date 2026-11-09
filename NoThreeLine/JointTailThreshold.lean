import NoThreeLine.LongShortJointLogTail

/-! A moment degree is selected before board size. The threshold is uniform
over all nonnegative normalized deadline budgets bounded by a fixed a<r.
The numerical angular certificate supplying that inequality is separate. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.BirthWitness
open PrimitiveLines FiniteWitnessMoments FiniteMomentIntegral

def jointTailEnvelope (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ)
    (δ d γ ζ a r : ℝ) (m n : ℕ) : ℝ :=
  (jointLongShortCoefficient ζ m n*a+
    jointLongShortErrorCoefficient Γ K T ξ hξ δ d γ ζ m n)^(m+2)/r^(m+2)

theorem tendsto_jointTailEnvelope (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ)
    (δ d γ ζ a r : ℝ) (m : ℕ) (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ) :
    Tendsto (jointTailEnvelope Γ K T ξ hξ δ d γ ζ a r m) atTop (𝓝 ((a/r)^(m+2))) := by
  have hh := (((tendsto_jointLongShortCoefficient ζ hζ m).mul_const a).add
    (tendsto_jointLongShortErrorCoefficient Γ K T ξ hξ δ d γ ζ m hξ1 hd hγ hζ)).pow (m+2)
  unfold jointTailEnvelope
  simpa only [one_mul,add_zero,div_pow] using hh.div_const (r^(m+2))

theorem jointLongShortErrorCoefficient_nonneg (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ)
    (δ d γ ζ : ℝ) (m n : ℕ) (hn : 2≤n) :
    0≤jointLongShortErrorCoefficient Γ K T ξ hξ δ d γ ζ m n :=
  add_nonneg (div_nonneg (positiveMomentRoot_nonneg _ _) (log_nat_pos hn).le)
    (mul_nonneg (positiveMomentRoot_nonneg _ _) (sq_nonneg _))

theorem jointTailEnvelope_mono (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ)
    (δ d γ ζ a b r : ℝ) (m n : ℕ) (hn : 2≤n) (ha : 0≤a) (hab : a≤b) (hr : 0≤r) :
    jointTailEnvelope Γ K T ξ hξ δ d γ ζ a r m n ≤
      jointTailEnvelope Γ K T ξ hξ δ d γ ζ b r m n := by
  have hc : 0≤jointLongShortCoefficient ζ m n :=
    (positiveMomentRoot_nonneg _ _).trans (le_max_left _ _)
  have he := jointLongShortErrorCoefficient_nonneg Γ K T ξ hξ δ d γ ζ m n hn
  exact div_le_div_of_nonneg_right
    (pow_le_pow_left₀ (add_nonneg (mul_nonneg hc ha) he)
      (add_le_add (mul_le_mul_of_nonneg_left hab hc) le_rfl) (m+2))
    (pow_nonneg hr _)

theorem exists_fixed_joint_moment_tail_threshold (Γ : Finset ZPoint) (K T ξ : ℝ) (hξ : 0<ξ)
    (δ d γ ζ a r κ : ℝ) (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ)
    (ha : 0≤a) (hr : 0<r) (har : a<r) (hκ : 0<κ) :
    ∃m N : ℕ, 1≤m ∧ 2≤N ∧ ∀n≥N, ∀q : ℝ, 0≤q → q≤a →
      jointTailEnvelope Γ K T ξ hξ δ d γ ζ q r m n<κ := by
  have hp := tendsto_pow_atTop_nhds_zero_of_lt_one (div_nonneg ha hr.le)
    ((div_lt_one hr).mpr har)
  have hp3 : Tendsto (fun m : ℕ=>(a/r)^(m+1+2)) atTop (𝓝 (0:ℝ)) := by
    simpa only [pow_add,pow_one,zero_mul] using (hp.mul_const (a/r)).mul_const ((a/r)^2)
  obtain ⟨j,hj⟩ := (hp3.eventually (gt_mem_nhds hκ)).exists
  have he := (tendsto_jointTailEnvelope Γ K T ξ hξ δ d γ ζ a r (j+1)
    hξ1 hd hγ hζ).eventually (gt_mem_nhds hj)
  obtain ⟨N,hN⟩ := eventually_atTop.mp he
  refine ⟨j+1,max N 2,by omega,le_max_right _ _,?_⟩
  intro n hn q hq hqa
  exact (jointTailEnvelope_mono Γ K T ξ hξ δ d γ ζ q a r (j+1) n
    ((le_max_right N 2).trans hn) hq hqa hr.le).trans_lt
    (hN n ((le_max_left N 2).trans hn))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.tendsto_jointTailEnvelope
#print axioms NoThreeLine.BirthWitness.exists_fixed_joint_moment_tail_threshold
