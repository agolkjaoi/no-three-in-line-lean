import NoThreeLine.ScheduledShortStarAsymptotic

/-! Replace 1+log n by log n in the proved error normalization, using
an exact identity and a factor tending to one. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.ShortStars

def starLogErrorEnvelope (ξ : ℝ) (hξ : 0<ξ) (g : ℕ) (δ C d γ ζ T : ℝ) (m n : ℕ) : ℝ :=
  starErrorEnvelope ξ hξ g δ C d γ ζ T m n*((1+Real.log (n:ℝ))/Real.log (n:ℝ))^m

theorem tendsto_starLogErrorEnvelope (ξ : ℝ) (hξ : 0<ξ) (g : ℕ)
    (δ C d γ ζ T : ℝ) (m : ℕ) (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ) :
    Tendsto (starLogErrorEnvelope ξ hξ g δ C d γ ζ T m) atTop (𝓝 0) := by
  have hr : Tendsto (fun n : ℕ=>(1+Real.log (n:ℝ))/Real.log (n:ℝ)) atTop (𝓝 (1:ℝ)) := by
    simpa only [one_mul,add_comm] using FiniteWitnessMoments.tendsto_affine_log_ratio 1 1
  unfold starLogErrorEnvelope
  simpa only [zero_mul] using (tendsto_starErrorEnvelope ξ hξ g δ C d γ ζ T m hξ1 hd hγ hζ).mul (hr.pow m)

theorem starError_mul_one_add_log_eq (ξ : ℝ) (hξ : 0<ξ) (g : ℕ)
    (δ C d γ ζ T τ : ℝ) (m n : ℕ) (hn : 2≤n) :
    starErrorEnvelope ξ hξ g δ C d γ ζ T m n*(τ*(n:ℝ)*(1+Real.log n))^m=
      starLogErrorEnvelope ξ hξ g δ C d γ ζ T m n*(τ*(n:ℝ)*Real.log n)^m := by
  have hl : Real.log (n:ℝ)≠0 := ne_of_gt (FiniteWitnessMoments.log_nat_pos hn)
  unfold starLogErrorEnvelope
  have he : τ*(n:ℝ)*(1+Real.log n)=((1+Real.log n)/Real.log n)*(τ*(n:ℝ)*Real.log n) := by field_simp
  rw [he,mul_pow]
  ring

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tendsto_starLogErrorEnvelope
#print axioms NoThreeLine.ShortStars.starError_mul_one_add_log_eq
