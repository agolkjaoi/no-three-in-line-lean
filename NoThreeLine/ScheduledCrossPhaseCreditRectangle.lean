import NoThreeLine.ScheduledCrossPhaseCreditMass
import NoThreeLine.CalendarComparisonTimeSwap

/-! Integrate the actual old-phase credit decay against the future-phase
active-root line mass. Joint measurability justifies swapping time null sets;
the resulting bound uses the old actual diagonal path and future duration. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines CalendarIntegral

def scheduledCreditRectanglePath {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (j N : ℕ) (ω : BoardClockPath n) : ℝ :=
  ∫ v in (0 : ℝ)..(cs N).horizon, observedActiveLineMass (cs N).config L p
      (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) N (ω,v))*
    scheduledCutLineCreditIntegral cs ε M deadline start L hn
      (initialGoodPhaseObservation B hB deadline start) j (cs j).horizon ω

theorem scheduled_cross_phase_creditRectangle_bound {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (Γ : Finset ZPoint)
    (hΓ : ∀ j, (cs j).directions = Γ) (hK : ∀ j, (cs j).K < 2) (j k r : ℕ)
    (L : LineIndex n) (hL : ¬specified Γ L) (p : Grid n) (hpL : p ∈ L.val)
    (hε0 : 0 ≤ ε) (hε : ε < 1) :
    (∫ ω, scheduledCreditRectanglePath cs ε M deadline start hn hB L p j (j+1+k) ω
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r)) ≤
    (cs (j+1+k)).horizon/(1-ε)*(∫ ω, scheduledCreditMassPath cs ε M deadline start hn hB L p j ω
      ∂phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r)) := by
  let μ := phasePointMeasure cs ε M deadline start hn hB p (j+1+k+1+r)
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p (j+1+k+1+r)
  let s := initialGoodPhaseObservation B hB deadline start
  let V := scheduledCutObservation cs ε M deadline start hn s (j+1+k)
  have hV : Measurable V := scheduledCutObservation_measurable cs ε M deadline start hn s (j+1+k)
  let W := scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn s j
  have hW : Measurable W := scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn s j
  have hLk : ¬specified (cs (j+1+k)).config.directions L := by
    simpa only [SharedPhase.config,hΓ (j+1+k)] using hL
  let w := fun x => observedActiveLineMass (cs (j+1+k)).config L p (V x)
  let rate := scheduledCutLineCreditRate cs ε M deadline start L hn s j
  let g := fun x => activeLineCreditMass (cs j).directions (cs j).mask L p (W x)
  have hw : Measurable w := (observedActiveLineMass_measurable (cs (j+1+k)).config L hLk p hpL).comp hV
  have hr : Measurable rate := scheduledCutLineCreditRate_measurable cs ε M deadline start L hn s j
  have hg : Measurable g := (activeLineCreditMass_measurable (cs j).directions (cs j).mask L p).comp hW
  exact expected_weighted_rectangle_le_old_first μ (cs (j+1+k)).horizon (cs j).horizon (1-ε)
    (cs (j+1+k)).horizon.coe_nonneg (cs j).horizon.coe_nonneg (sub_pos.mpr hε)
    w rate g hw hr hg (∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B) ((L.val.card : ℝ)*(B/n))
    (((L.val.card : ℝ)*(B/n))*(B*(L.val.card : ℝ))) (by positivity)
    (fun x => observedActiveLineMass_bounds (cs (j+1+k)).config L hLk p hpL (V x))
    (scheduledCutLineCreditRate_bounds cs ε M deadline start L hn (zero_lt_one.trans_le hB) s j)
    (fun x => activeLineCreditMass_bounds (cs j).directions (cs j).mask
      (fun q => ⟨(cs j).mask_nonneg q,(cs j).mask_le_one q⟩) L p (W x) B (zero_lt_one.trans_le hB)
      (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn s j x))
    (scheduled_cross_phase_creditMass_le_ae_times cs ε M deadline start hn hB Γ hΓ hK j k r L hL p hpL hε0 hε)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduled_cross_phase_creditRectangle_bound
