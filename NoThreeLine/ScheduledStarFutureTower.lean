import NoThreeLine.ShortStarIntensityRegularity
import NoThreeLine.ScheduledCutFutureTower

/-! Full-J point-law transport of the actual short-star intensity power.
Clipping is used only on arbitrary observation payloads; actual cut states
already satisfy the bound, so the observable is unchanged there. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

attribute [local irreducible] weightedStarIntensity scheduledCutWitness

theorem scheduledCutStarPower_terminal_mean_ae {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1) (m N J : ℕ) (hNJ : N<J) :
    ∀ᵐt : ℝ ∂volume,∀ht : t∈Ioo 0 ((cs N).horizon : ℝ),
    (∫ω,weightedStarIntensity Γ p H w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))^m
      ∂phasePointMeasure cs ε M deadline start hn hB p J)=
    ∫ω,weightedStarIntensity Γ p H w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))^m
      ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t := by
  let A := (((shortStars Γ p H).card : ℝ)*B)^m
  have hA : 0≤A := pow_nonneg (mul_nonneg (Nat.cast_nonneg _) (zero_le_one.trans hB)) _
  let F := fun (_t : ℝ) (v : TimedObservation (cs N).config)=>
    min (max (weightedStarIntensity Γ p H w (observedWitness (cs N).config (unitBirthRetention n) v)^m) 0) A
  have hF (t : ℝ) : Measurable (F t) :=
    ((((weightedStarIntensity_measurable Γ p H w).comp
      (observedWitness_measurable (cs N).config (unitBirthRetention n))).pow_const m).max measurable_const).min measurable_const
  have hb (t : ℝ) (v : TimedObservation (cs N).config) : 0≤F t v ∧ F t v≤A :=
    ⟨le_min (le_max_right _ _) hA,min_le_right _ _⟩
  have hfactual (t : ℝ) (ω : BoardClockPath n) :
      F t (scheduledCutObservation cs ε M deadline start hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))=
      weightedStarIntensity Γ p H w (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))^m := by
    have hh := weightedStarIntensity_bounds Γ p H w hw _ B (zero_le_one.trans hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
    have hlo := pow_nonneg hh.1 m
    have hup := pow_le_pow_left₀ hh.1 hh.2 m
    simpa only [F, scheduledCutWitness] using
      (congrArg (fun x=>min x A) (max_eq_left hlo)).trans (min_eq_left hup)
  have he := scheduledCut_future_point_integral_ae cs ε M deadline start hn hB N (J-(N+1)) p F hF A hb
  have hindex : N+1+(J-(N+1))=J := Nat.add_sub_of_le (Nat.succ_le_of_lt hNJ)
  simpa only [hindex,hfactual] using he

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledCutStarPower_terminal_mean_ae
