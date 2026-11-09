import NoThreeLine.LongShortSavedMoment
import NoThreeLine.ShortStarIntegralCoefficients

/-! The joint leading coefficient tends to one at fixed degree. The
maximum combines the two eta exponents without doubling the main budget. -/
set_option autoImplicit false
noncomputable section
open Filter
open scoped Topology

namespace NoThreeLine.BirthWitness
open ShortStars FiniteWitnessMoments FiniteMomentIntegral

theorem tendsto_jointLongShortCoefficient (ζ : ℝ) (hζ : 0<ζ) (m : ℕ) :
    Tendsto (jointLongShortCoefficient ζ m) atTop (𝓝 1) := by
  have hd := ((tendsto_const_nhds (x:=(1:ℝ))).sub
    (tendsto_nat_rpow_negative ζ hζ)).pow ((m+3).choose 2)
  have hc : Tendsto (fun n : ℕ=>1/(1-(n:ℝ)^(-ζ))^(m+3).choose 2) atTop (𝓝 (1:ℝ)) := by
    convert (tendsto_const_nhds (x:=(1:ℝ))).div hd (by simp) using 1 <;> first | rfl | simp
  have hroot : Tendsto (fun n : ℕ=>positiveMomentRoot (m+2)
      (1/(1-(n:ℝ)^(-ζ))^(m+3).choose 2)) atTop (𝓝 1) := by
    simpa only [positiveMomentRoot_one,Function.comp_def] using
      (positiveMomentRoot_continuous (m+2)).continuousAt.tendsto.comp hc
  change Tendsto (fun n : ℕ=>max (positiveMomentRoot (m+2) (1/(1-(n:ℝ)^(-ζ))^(m+3).choose 2))
    (positiveMomentRoot (m+2) (starEtaMultiplier ζ (m+2) n))) atTop (𝓝 1)
  simpa only [max_self] using
    hroot.max (tendsto_starIntegral_mainCoefficient ζ hζ (m+2))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.tendsto_jointLongShortCoefficient
