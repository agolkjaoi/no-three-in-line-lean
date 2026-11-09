import NoThreeLine.ScheduledStarIntegralMoment

/-! Fixed-degree limits of the two coefficients in the actual integrated
short-star moment. Taking roots preserves the sharp main limit one. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.ShortStars
open FiniteMomentIntegral

theorem tendsto_starIntegral_mainCoefficient (ζ : ℝ) (hζ : 0<ζ) (m : ℕ) :
    Tendsto (fun n=>positiveMomentRoot m (starEtaMultiplier ζ m n)) atTop (𝓝 1) := by
  have h := (positiveMomentRoot_continuous m).continuousAt.tendsto.comp
    (tendsto_starEtaMultiplier ζ hζ m)
  simpa only [positiveMomentRoot_one,Function.comp_def] using h

theorem tendsto_starIntegral_errorCoefficient (ξ : ℝ) (hξ : 0<ξ) (g : ℕ)
    (δ C d γ ζ T : ℝ) (m : ℕ) (hm : 0<m)
    (hξ1 : ξ<1) (hd : d<γ) (hγ : γ<1) (hζ : 0<ζ) :
    Tendsto (fun n=>positiveMomentRoot m (starLogErrorEnvelope ξ hξ g δ C d γ ζ T m n))
      atTop (𝓝 0) := by
  have h := (positiveMomentRoot_continuous m).continuousAt.tendsto.comp
    (tendsto_starLogErrorEnvelope ξ hξ g δ C d γ ζ T m hξ1 hd hγ hζ)
  simpa only [positiveMomentRoot_zero m hm,Function.comp_def] using h

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.tendsto_starIntegral_mainCoefficient
#print axioms NoThreeLine.ShortStars.tendsto_starIntegral_errorCoefficient
