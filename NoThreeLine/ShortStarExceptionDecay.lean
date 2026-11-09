import NoThreeLine.ScheduledStarExceptionScale

/-! Explicit four-error scalar envelope, tending to zero at each fixed
degree. Actual finite phase/cap substitution is a separate theorem. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.ShortStars

theorem tendsto_distinctCoarseCost {α : Type*} {l : Filter α} (δ : ℝ) (m : ℕ)
    (ε : α→ℝ) (hε : Tendsto ε l (𝓝 0)) :
    Tendsto (fun x=>distinctCoarseCost δ (ε x) m) l (𝓝 (distinctCoarseCost δ 0 m)) := by
  have hd := ((tendsto_const_nhds (x:=(1:ℝ))).sub hε).pow ((2*m+1).choose 2)
  convert (tendsto_const_nhds (x:=(δ^((m+1)^3))⁻¹)).div hd (by simp) using 1 <;> rfl

theorem tendsto_extraCoarseCost {α : Type*} {l : Filter α} (δ : ℝ) (m : ℕ)
    (ε : α→ℝ) (hε : Tendsto ε l (𝓝 0)) :
    Tendsto (fun x=>extraCoarseCost δ (ε x) m) l (𝓝 (extraCoarseCost δ 0 m)) := by
  have hd := ((tendsto_const_nhds (x:=(1:ℝ))).sub hε).pow ((2*m+2).choose 2)
  convert (tendsto_const_nhds (x:=(δ^((m+1)^3))⁻¹)).div hd (by simp) using 1 <;> rfl

def exceptionDecayEnvelope (ξ : ℝ) (hξ : 0<ξ) (g : ℕ)
    (δ C d γ ζ T : ℝ) (m n : ℕ) : ℝ :=
  distinctCoarseCost δ ((n:ℝ)^(-ζ)) m*((m*(m-1) : ℕ) : ℝ)*
    ((16*C)^(m-1)*(specifiedExceptionConstant ξ hξ*(g:ℝ)*C)*(n:ℝ)^(ξ-1))+
  distinctCoarseCost δ ((n:ℝ)^(-ζ)) m*((m*(m-1) : ℕ) : ℝ)*
    ((16*C)^(m-1)*(16*C)*(n:ℝ)^(d-γ))+
  extraCoarseCost δ ((n:ℝ)^(-ζ)) m*((m*(m-1) : ℕ) : ℝ)*
    ((16*C)^m*(C*T)*(n:ℝ)^(γ-1))+
  distinctCoarseCost δ ((n:ℝ)^(-ζ)) m*((m^3 : ℕ) : ℝ)*
    ((16*C)^(m-1)*(witnessExceptionConstant ξ hξ*C)*(n:ℝ)^(ξ-1))

theorem tendsto_exceptionDecayEnvelope (ξ : ℝ) (hξ : 0<ξ) (g : ℕ)
    (δ C d γ ζ T : ℝ) (m : ℕ) (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ) :
    Tendsto (exceptionDecayEnvelope ξ hξ g δ C d γ ζ T m) atTop (𝓝 0) := by
  unfold exceptionDecayEnvelope
  have he := FiniteWitnessMoments.tendsto_nat_rpow_negative ζ hζ
  have hc := tendsto_distinctCoarseCost δ m _ he
  have hx := tendsto_extraCoarseCost δ m _ he
  have hg3 : Tendsto (fun n : ℕ=>(n:ℝ)^(ξ-1)) atTop (𝓝 0) := by
    simpa only [neg_sub] using FiniteWitnessMoments.tendsto_nat_rpow_negative (1-ξ) (sub_pos.mpr hξ1)
  have hr : Tendsto (fun n : ℕ=>(n:ℝ)^(d-γ)) atTop (𝓝 0) := by
    simpa only [neg_sub] using FiniteWitnessMoments.tendsto_nat_rpow_negative (γ-d) (sub_pos.mpr hd)
  have ht : Tendsto (fun n : ℕ=>(n:ℝ)^(γ-1)) atTop (𝓝 0) := by
    simpa only [neg_sub] using FiniteWitnessMoments.tendsto_nat_rpow_negative (1-γ) (sub_pos.mpr hγ)
  have h1 := (hc.mul_const ((m*(m-1) : ℕ) : ℝ)).mul
    (hg3.const_mul ((16*C)^(m-1)*(specifiedExceptionConstant ξ hξ*(g:ℝ)*C)))
  have h2 := (hc.mul_const ((m*(m-1) : ℕ) : ℝ)).mul
    (hr.const_mul ((16*C)^(m-1)*(16*C)))
  have h3 := (hx.mul_const ((m*(m-1) : ℕ) : ℝ)).mul
    (ht.const_mul ((16*C)^m*(C*T)))
  have h4 := (hc.mul_const ((m^3 : ℕ) : ℝ)).mul
    (hg3.const_mul ((16*C)^(m-1)*(witnessExceptionConstant ξ hξ*C)))
  simpa only [mul_zero,add_zero,Pi.add_apply] using ((h1.add h2).add h3).add h4

theorem growth_over_cutoff_le {n : ℕ} (hn : 0<n) (B d γ : ℝ) (hB : B≤(n:ℝ)^d) :
    B/(n:ℝ)^γ≤(n:ℝ)^(d-γ) := by
  have hN : 0<(n:ℝ) := by exact_mod_cast hn
  rw [Real.rpow_sub hN]
  exact div_le_div_of_nonneg_right hB (Real.rpow_nonneg hN.le γ)

theorem cutoff_over_board_eq {n : ℕ} (hn : 0<n) (γ : ℝ) :
    (n:ℝ)^γ/n=(n:ℝ)^(γ-1) :=
  (Real.rpow_sub_one (by exact_mod_cast (Nat.ne_of_gt hn)) γ).symm

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tendsto_exceptionDecayEnvelope
