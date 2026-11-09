import NoThreeLine.ScheduledStarFutureTower
import NoThreeLine.CalendarIntegralFubini

/-! Joint regularity and Fubini for powers of the actual masked short-star
intensity. The time measure can be any finite measure; the state is always
the actual inherited scheduled cut. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.ShortStars
open PrimitiveLines BirthWitness

attribute [local irreducible] scheduledCutWitness weightedStarIntensity

theorem scheduledStarPower_joint_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1) (m N J : ℕ)
    (ν : Measure ℝ) [IsFiniteMeasure ν] :
    Integrable (fun x : BoardClockPath n×ℝ=>weightedStarIntensity Γ p H w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N x)^m)
      ((phasePointMeasure cs ε M deadline start hn hB p J).prod ν) := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  exact weightedStarIntensity_pow_integrable Γ p H w hw m B (zero_le_one.trans hB) _ _
    (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N)
    (fun x=>scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn _ N x)

theorem scheduledStarPower_integral_swap {n : ℕ} {B : ℝ}
    (cs : ℕ→SharedPhase n B) (ε M : ℝ) (deadline : Grid n→ℝ) (start : ℝ)
    (hn : 0<n) (hB : 1≤B) (Γ : Finset ZPoint) (p : Grid n) (H : ℝ)
    (w : ↥(shortStars Γ p H)→ℝ) (hw : ∀s,0≤w s ∧ w s≤1) (m N J : ℕ)
    (ν : Measure ℝ) [IsFiniteMeasure ν] :
    (∫ω,(∫t,weightedStarIntensity Γ p H w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))^m ∂ν)
      ∂phasePointMeasure cs ε M deadline start hn hB p J)=
    ∫t,(∫ω,weightedStarIntensity Γ p H w
      (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))^m
      ∂phasePointMeasure cs ε M deadline start hn hB p J) ∂ν := by
  letI := phasePointMeasure_probability cs ε M deadline start hn hB p J
  exact integral_integral_swap
    (scheduledStarPower_joint_integrable cs ε M deadline start hn hB Γ p H w hw m N J ν)

end NoThreeLine.ShortStars

#print axioms NoThreeLine.ShortStars.scheduledStarPower_joint_integrable
#print axioms NoThreeLine.ShortStars.scheduledStarPower_integral_swap
