import NoThreeLine.ScheduledSamePhaseCreditTriangle
import NoThreeLine.ScheduledCrossPhaseCreditRectangle
import NoThreeLine.CalendarWeightedPathRegularity

/-! Joint actual line-mass regularity and finite-measure integrability of
the actual phase triangles and rectangles, before taking finite sums. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE PrimitiveLines CalendarIntegral

def scheduledActiveLineMass {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (x : BoardClockPath n × ℝ) : ℝ :=
  observedActiveLineMass (cs N).config L p
    (scheduledCutObservation cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) N x)

theorem scheduledActiveLineMass_measurable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) :
    Measurable (scheduledActiveLineMass cs ε M deadline start hn hB L p N) :=
  (observedActiveLineMass_measurable (cs N).config L hL p hpL).comp
    (scheduledCutObservation_measurable cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) N)

theorem scheduledActiveLineMass_bounds {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val) (x : BoardClockPath n × ℝ) :
    0 ≤ scheduledActiveLineMass cs ε M deadline start hn hB L p N x ∧
      scheduledActiveLineMass cs ε M deadline start hn hB L p N x ≤ ∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B :=
  observedActiveLineMass_bounds (cs N).config L hL p hpL _

theorem scheduledCreditTrianglePath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledCreditTrianglePath cs ε M deadline start hn hB L p N) μ :=
  weightedTrianglePath_integrable μ (cs N).horizon (cs N).horizon.coe_nonneg
    (scheduledActiveLineMass cs ε M deadline start hn hB L p N)
    (scheduledCutLineCreditRate cs ε M deadline start L hn (initialGoodPhaseObservation B hB deadline start) N)
    (scheduledActiveLineMass_measurable cs ε M deadline start hn hB L p N hL hpL)
    (scheduledCutLineCreditRate_measurable cs ε M deadline start L hn _ N)
    (∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B) ((L.val.card : ℝ)*(B/n))
    (scheduledActiveLineMass_bounds cs ε M deadline start hn hB L p N hL hpL)
    (scheduledCutLineCreditRate_bounds cs ε M deadline start L hn (zero_lt_one.trans_le hB) _ N)

theorem scheduledCreditRectanglePath_integrable {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (hn : 0 < n) (hB : 1 ≤ B) (L : LineIndex n) (p : Grid n) (j N : ℕ)
    (hL : ¬specified (cs N).directions L) (hpL : p ∈ L.val)
    (μ : Measure (BoardClockPath n)) [IsFiniteMeasure μ] :
    Integrable (scheduledCreditRectanglePath cs ε M deadline start hn hB L p j N) μ :=
  weightedRectanglePath_integrable μ (cs N).horizon (cs j).horizon
    (cs N).horizon.coe_nonneg (cs j).horizon.coe_nonneg
    (scheduledActiveLineMass cs ε M deadline start hn hB L p N)
    (scheduledCutLineCreditRate cs ε M deadline start L hn (initialGoodPhaseObservation B hB deadline start) j)
    (scheduledActiveLineMass_measurable cs ε M deadline start hn hB L p N hL hpL)
    (scheduledCutLineCreditRate_measurable cs ε M deadline start L hn _ j)
    (∑ q ∈ L.val.erase p, rootLeafCap {p,q} p B) ((L.val.card : ℝ)*(B/n))
    (scheduledActiveLineMass_bounds cs ε M deadline start hn hB L p N hL hpL)
    (scheduledCutLineCreditRate_bounds cs ε M deadline start L hn (zero_lt_one.trans_le hB) _ j)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCreditTrianglePath_integrable
#print axioms NoThreeLine.BirthWitness.scheduledCreditRectanglePath_integrable
