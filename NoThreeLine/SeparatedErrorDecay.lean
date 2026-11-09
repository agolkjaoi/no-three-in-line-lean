import NoThreeLine.JointMomentRoot
import NoThreeLine.MomentLogScale

/-! Only the collision and exceptional-pair remainder is normalized here.
The moment degree is fixed before taking the board-size limit. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.FiniteMomentIntegral
open FiniteWitnessMoments

theorem separatedMomentError_mono (m : ℕ) (A C W P A' C' W' P' ε : ℝ)
    (hA : 0≤A) (hC : 0≤C) (hW : 0≤W) (hP : 0≤P) (hε : ε≤1)
    (hAA : A≤A') (hCC : C≤C') (hWW : W≤W') (hPP : P≤P') :
    separatedMomentError m A C W P ε≤separatedMomentError m A' C' W' P' ε := by
  unfold separatedMomentError
  have he : 0≤1-ε := sub_nonneg.mpr hε
  have hW' : 0≤W' := hW.trans hWW
  have hP' : 0≤P' := hP.trans hPP
  gcongr

theorem separatedMomentError_scale (m : ℕ) (A C W P ε L : ℝ) :
    separatedMomentError m (A*L) (C*L) (W*L) (P*L^2) ε=
      L^(m+2)*separatedMomentError m A C W P ε := by
  unfold separatedMomentError
  rw [show A*L+((m+2:ℕ):ℝ)*(W*L)=(A+((m+2:ℕ):ℝ)*W)*L by ring]
  rw [show C*L+((m+2:ℕ):ℝ)*(W*L)=(C+((m+2:ℕ):ℝ)*W)*L by ring]
  simp only [mul_pow,pow_add,pow_one,pow_two]
  ring

theorem separatedMomentError_normalize (m : ℕ) (A C W P ε L : ℝ) :
    separatedMomentError m A C W P ε/L^(m+2)=
      separatedMomentError m (A/L) (C/L) (W/L) (P/L^2) ε := by
  simpa only [div_eq_mul_inv,inv_pow,mul_comm] using
    (separatedMomentError_scale m A C W P ε L⁻¹).symm

theorem tendsto_separatedMomentError {α : Type*} {l : Filter α} (m : ℕ)
    (A C W P ε : α→ℝ) (a c : ℝ)
    (hA : Tendsto A l (𝓝 a)) (hC : Tendsto C l (𝓝 c))
    (hW : Tendsto W l (𝓝 0)) (hP : Tendsto P l (𝓝 0)) (hε : Tendsto ε l (𝓝 0)) :
    Tendsto (fun x=>separatedMomentError m (A x) (C x) (W x) (P x) (ε x)) l (𝓝 0) := by
  have hw := (hW.const_mul (((m+2:ℕ):ℝ)^2)).mul
    ((hA.add (hW.const_mul ((m+2:ℕ):ℝ))).pow (m+1))
  have hp := (hP.const_mul (((m+2:ℕ):ℝ)^2)).mul
    ((hC.add (hW.const_mul ((m+2:ℕ):ℝ))).pow m)
  have hd := ((tendsto_const_nhds (x:=(1:ℝ))).sub hε).pow ((m+3).choose 2)
  convert (hw.add hp).div hd (by simp : (1-(0:ℝ))^((m+3).choose 2)≠0) using 1 <;>
    first | rfl | simp

theorem positiveMomentRoot_div (m : ℕ) (hm : 0<m) (x L : ℝ) (hL : 0<L) :
    positiveMomentRoot m x/L=positiveMomentRoot m (x/L^m) := by
  apply (pow_left_inj₀ (div_nonneg (positiveMomentRoot_nonneg _ _) hL.le)
    (positiveMomentRoot_nonneg _ _) (Nat.ne_of_gt hm)).mp
  rw [div_pow,positiveMomentRoot_pow m hm,positiveMomentRoot_pow m hm]
  by_cases hx : 0≤x
  · rw [max_eq_right hx,max_eq_right (div_nonneg hx (pow_nonneg hL.le m))]
  · have hx' : x≤0 := le_of_not_ge hx
    rw [max_eq_left hx',max_eq_left (div_nonpos_of_nonpos_of_nonneg hx' (pow_nonneg hL.le m)),zero_div]

def longLogErrorEnvelope (m : ℕ) (a F W Q ξ ζ : ℝ) (n : ℕ) : ℝ :=
  separatedMomentError m (a*(1+Real.log n)) (F*(a*(1+Real.log n))) W
    (logPairBudget Q ξ n) ((n:ℝ)^(-ζ))

theorem tendsto_longLogError_normalized (m : ℕ) (a F W Q ξ ζ : ℝ) (hξ : ξ<1) (hζ : 0<ζ) :
    Tendsto (fun n=>longLogErrorEnvelope m a F W Q ξ ζ n/(Real.log (n:ℝ))^(m+2)) atTop (𝓝 0) := by
  have hA : Tendsto (fun n : ℕ=>a*(1+Real.log n)/Real.log n) atTop (𝓝 a) := by
    convert tendsto_affine_log_ratio a a using 1
    funext n
    ring
  have hC : Tendsto (fun n : ℕ=>(F*(a*(1+Real.log n)))/Real.log n) atTop (𝓝 (F*a)) := by
    simpa only [mul_div_assoc] using hA.const_mul F
  simp_rw [longLogErrorEnvelope,separatedMomentError_normalize]
  exact tendsto_separatedMomentError m _ _ _ _ _ a (F*a) hA hC
    (tendsto_const_div_log_nat W) (tendsto_logPairBudget_normalized Q ξ hξ)
    (tendsto_nat_rpow_negative ζ hζ)

theorem tendsto_longLogError_root_div_log (m : ℕ) (a F W Q ξ ζ : ℝ) (hξ : ξ<1) (hζ : 0<ζ) :
    Tendsto (fun n=>positiveMomentRoot (m+2) (longLogErrorEnvelope m a F W Q ξ ζ n)/Real.log n)
      atTop (𝓝 0) := by
  have hroot := (positiveMomentRoot_continuous (m+2)).continuousAt.tendsto.comp
    (tendsto_longLogError_normalized m a F W Q ξ ζ hξ hζ)
  have he : (fun n=>positiveMomentRoot (m+2) (longLogErrorEnvelope m a F W Q ξ ζ n)/Real.log n)=ᶠ[atTop]
      (fun n=>positiveMomentRoot (m+2) (longLogErrorEnvelope m a F W Q ξ ζ n/(Real.log n)^(m+2))) := by
    filter_upwards [eventually_ge_atTop (2:ℕ)] with n hn
    exact positiveMomentRoot_div (m+2) (by omega) _ _ (log_nat_pos hn)
  apply (tendsto_congr' he).mpr
  simpa only [positiveMomentRoot_zero (m+2) (by omega),Function.comp_def] using hroot

end NoThreeLine.FiniteMomentIntegral

#print axioms NoThreeLine.FiniteMomentIntegral.separatedMomentError_mono
#print axioms NoThreeLine.FiniteMomentIntegral.positiveMomentRoot_div
#print axioms NoThreeLine.FiniteMomentIntegral.tendsto_longLogError_root_div_log
