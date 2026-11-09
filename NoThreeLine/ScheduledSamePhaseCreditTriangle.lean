import NoThreeLine.ScheduledSamePhaseCreditMass
import NoThreeLine.CalendarTriangleComparison

/-! The actual same-phase portion of the credit-loss/mass double integral
is dominated by phase duration times the actual diagonal credit-mass path
under the same full terminal point probability. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines CalendarIntegral

def scheduledCreditTrianglePath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∫ v in (0 : ℝ)..(cs N).horizon, observedActiveLineMass (cs N).config L p
      (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) N (ω,v))*
    scheduledCutLineCreditIntegral cs ε M deadline start L hn
      (initialGoodPhaseObservation B hB deadline start) N v ω

theorem scheduled_same_phase_creditTriangle_bound {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (j k : ℕ) (hK : (cs j).config.K < 2)
    (L : LineIndex n) (hL : ¬specified (cs j).directions L) (p : Grid n) (hpL : p ∈ L.val)
    (hε0 : 0 ≤ ε) (hε : ε < 1) :
    (∫ ω, scheduledCreditTrianglePath cs ε M deadline start hn hB L p j ω
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k)) ≤
    (cs j).horizon/(1-ε)*(∫ ω, scheduledCreditMassPath cs ε M deadline start hn hB L p j ω
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k)) := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p (j+1+k)
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p (j+1+k)
  let s := initialGoodPhaseObservation B hB deadline start
  let V := scheduledCutObservation cs ε M deadline start hn s j
  have hV : Measurable V := scheduledCutObservation_measurable cs ε M deadline start hn s j
  let W := scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s j
  have hW : Measurable W := scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn s j
  let w := fun x => observedActiveLineMass (cs j).config L p (V x)
  let r := scheduledCutLineCreditRate cs ε M deadline start L hn s j
  let g := fun x => activeLineCreditMass (cs j).directions (cs j).mask L p (W x)
  have hw : Measurable w := (observedActiveLineMass_measurable (cs j).config L hL p hpL).comp hV
  have hr : Measurable r := scheduledCutLineCreditRate_measurable cs ε M deadline start L hn s j
  have hg : Measurable g := (activeLineCreditMass_measurable (cs j).directions (cs j).mask L p).comp hW
  exact expected_weighted_triangle_le μ (cs j).horizon (1-ε) (cs j).horizon.coe_nonneg (sub_pos.mpr hε)
    w r g hw hr hg (∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B) ((L.val.card : ℝ)*(B/n))
    (((L.val.card : ℝ)*(B/n))*(B*(L.val.card : ℝ))) (by positivity)
    (fun x => observedActiveLineMass_bounds (cs j).config L hL p hpL (V x))
    (scheduledCutLineCreditRate_bounds cs ε M deadline start L hn (zero_lt_one.trans_le hB) s j)
    (fun x => activeLineCreditMass_bounds (cs j).directions (cs j).mask
      (fun q => ⟨(cs j).mask_nonneg q,(cs j).mask_le_one q⟩) L p (W x) B (zero_lt_one.trans_le hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn s j x))
    (scheduled_same_phase_creditMass_le_ae_times cs ε M deadline start hn hB j k hK L hL p hpL hε0 hε)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduled_same_phase_creditTriangle_bound
