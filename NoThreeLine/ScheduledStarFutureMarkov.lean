import NoThreeLine.ScheduledStarFutureMoment
import NoThreeLine.InitialWitnessTail

/-! High-power Markov for the actual short-star intensity on a fixed
full-J point law. The moment and integrability are those of the actual
inherited cut, with the root activity indicator still present. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarPower_future_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1) (m N J : ℕ) (t : ℝ) :
    Integrable (fun ω=>weightedStarIntensity Γ p H w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))^m)
      (phasePointMeasure cs ε M deadline start hn hB p J) := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  exact weightedStarIntensity_pow_integrable Γ p H w hw m B (zero_le_one.trans hB) _ _
    ((scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N).comp
      (measurable_id.prodMk measurable_const))
    (fun ω=>scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N (ω,t))

theorem scheduledStarPower_future_tail_le_moment {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1) (m N J : ℕ) (t r : ℝ) (hr : 0<r) :
    (phasePointMeasure cs ε M deadline start hn hB p J).real
      {ω | r≤weightedStarIntensity Γ p H w
        (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
          (initialGoodPhaseObservation B hB deadline start) N (ω,t))}≤
    (∫ω,weightedStarIntensity Γ p H w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))^m
      ∂phasePointMeasure cs ε M deadline start hn hB p J)/r^m := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  let W := fun ω=>scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
    (initialGoodPhaseObservation B hB deadline start) N (ω,t)
  let X := fun ω=>weightedStarIntensity Γ p H w (W ω)
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  have hi := scheduledStarPower_future_integrable cs ε M deadline start hn hB Γ p H w hw m N J t
  have hx (ω) : 0≤X ω := (weightedStarIntensity_bounds Γ p H w hw _ B (zero_le_one.trans hB)
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N (ω,t))).1
  have hMarkov := mul_meas_ge_le_integral_of_nonneg
    (Filter.Eventually.of_forall (fun ω=>pow_nonneg (hx ω) m)) hi (r^m)
  have hset : {ω | r≤X ω}⊆{ω | r^m≤X ω^m} := fun _ hω=>pow_le_pow_left₀ hr.le hω m
  have hbound := (mul_le_mul_of_nonneg_left (measureReal_mono (μ:=μ) hset)
    (pow_nonneg hr.le m)).trans hMarkov
  apply (le_div_iff₀ (pow_pos hr m)).mpr
  simpa only [mul_comm] using hbound

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarPower_future_integrable
#print axioms NoThreeLine.ShortStars.scheduledStarPower_future_tail_le_moment
