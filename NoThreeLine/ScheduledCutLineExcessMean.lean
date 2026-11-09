import NoThreeLine.SelectedLineExcess
import NoThreeLine.ScheduledCutPointLaw

/-! The cut-law line excess is written on the original board with its
actual current credit density. This proves measurability in elapsed time
without identifying it with a future terminal-density expectation. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def scheduledCutLineExcessWeighted {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  scheduledCutCredit cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) p N x*
    selectedLineExcess mask L p z (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N x)

theorem scheduledCutLineExcessWeighted_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) :
    Measurable (scheduledCutLineExcessWeighted cs ε M deadline start hn hB mask L p z N) :=
  (scheduledCutCredit_measurable cs ε M deadline start hn _ p N).mul
    ((selectedLineExcess_measurable mask L p z).comp
      (scheduledCutWitness_measurable cs ε M deadline start (unitBirthRetention n) hn _ N))

theorem scheduledCutLineExcessWeighted_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (N : ℕ) (x : BoardClockPath n×ℝ) :
    0≤scheduledCutLineExcessWeighted cs ε M deadline start hn hB mask L p z N x ∧
      scheduledCutLineExcessWeighted cs ε M deadline start hn hB mask L p z N x≤B*(B*(L.val.card:ℝ)) := by
  have hc := scheduledCutCredit_bounds cs ε M deadline start hn
    (initialGoodPhaseObservation B hB deadline start) p N x
  have he := selectedLineExcess_bounds mask hm L p z _ B (zero_le_one.trans hB)
    (scheduledCutWitness_valid cs ε M deadline start (unitBirthRetention n) hn
      (initialGoodPhaseObservation B hB deadline start) N x)
  exact ⟨mul_nonneg hc.1 he.1,mul_le_mul hc.2 he.2 he.1 (zero_le_one.trans hB)⟩

def scheduledCutLineExcessMean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) (t : ℝ) : ℝ :=
  ∫ω,scheduledCutLineExcessWeighted cs ε M deadline start hn hB mask L p z N (ω,t)
    ∂boardClockMeasure n (B/n)

theorem scheduledCutLineExcessMean_eq_point {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) (t : ℝ) :
    scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N t=
      ∫ω,selectedLineExcess mask L p z (scheduledCutWitness cs ε M deadline start (unitBirthRetention n) hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t))
        ∂scheduledCutPointMeasure cs ε M deadline start hn hB p N t := by
  unfold scheduledCutPointMeasure
  have hc : Measurable (fun ω : BoardClockPath n=>scheduledCutCredit cs ε M deadline start hn
      (initialGoodPhaseObservation B hB deadline start) p N (ω,t)) :=
    (scheduledCutCredit_measurable cs ε M deadline start hn _ p N).comp (measurable_id.prodMk measurable_const)
  rw [savedCreditMeasure_integral _ _ hc
    (fun ω=>(scheduledCutCredit_bounds cs ε M deadline start hn _ p N (ω,t)).1)]
  rfl

theorem scheduledCutLineExcessMean_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (L : LineIndex n) (p z : Grid n) (N : ℕ) :
    Measurable (scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos (lt_of_lt_of_le zero_lt_one hB) (by exact_mod_cast hn))
  exact ((scheduledCutLineExcessWeighted_measurable cs ε M deadline start hn hB mask L p z N).comp
    measurable_swap).stronglyMeasurable.integral_prod_right'.measurable

theorem scheduledCutLineExcessMean_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B)
    (mask : Grid n→ℝ) (hm : ∀q,0≤mask q ∧ mask q≤1) (L : LineIndex n) (p z : Grid n)
    (N : ℕ) (t : ℝ) :
    0≤scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N t ∧
      scheduledCutLineExcessMean cs ε M deadline start hn hB mask L p z N t≤B*(B*(L.val.card:ℝ)) := by
  let ν := boardClockMeasure n (B/n)
  letI : IsProbabilityMeasure ν := boardClockMeasure_probability n (B/n)
    (div_pos (lt_of_lt_of_le zero_lt_one hB) (by exact_mod_cast hn))
  have hf : Measurable (fun ω=>scheduledCutLineExcessWeighted cs ε M deadline start hn hB mask L p z N (ω,t)) :=
    (scheduledCutLineExcessWeighted_measurable cs ε M deadline start hn hB mask L p z N).comp
      (measurable_id.prodMk measurable_const)
  have hb := fun ω=>scheduledCutLineExcessWeighted_bounds cs ε M deadline start hn hB mask hm L p z N (ω,t)
  have hi := GenericCreditIteration.bounded_nonnegative_integrable ν _ hf (B*(B*(L.val.card:ℝ))) hb
  refine ⟨integral_nonneg (fun ω=>(hb ω).1),?_⟩
  have hh := integral_mono hi (integrable_const (B*(B*(L.val.card:ℝ)))) (fun ω=>(hb ω).2)
  simpa only [integral_const,probReal_univ,one_smul,scheduledCutLineExcessMean,ν] using hh

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLineExcessMean_eq_point
#print axioms NoThreeLine.BirthWitness.scheduledCutLineExcessMean_measurable
