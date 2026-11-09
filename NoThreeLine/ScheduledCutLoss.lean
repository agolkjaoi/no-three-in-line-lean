import NoThreeLine.ScheduledCutPointLaw
import NoThreeLine.CreditLossRate

/-! Exact unavailable-credit loss at a deterministic cut after an inherited
phase prefix. Mean initial credit is one after averaging the true prefix;
individual inherited states are not assumed to have unit credit. -/
set_option autoImplicit false
set_option maxHeartbeats 800000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness

def scheduledCutProcess {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (k : ℕ) (x : BoardClockPath n×ℝ) : ProcessState n :=
  (scheduledCutObservation cs ε M deadline start hn s k x).1.val.1.physical.process

theorem scheduledCutProcess_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B) (k : ℕ) :
    Measurable (scheduledCutProcess cs ε M deadline start hn s k) :=
  (ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
    (measurable_subtype_coe.comp (scheduledCutObservation_measurable cs ε M deadline start hn s k).fst).fst)

def scheduledCutCreditLoss {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B)
    (p : Grid n) (k : ℕ) (x : BoardClockPath n×ℝ) : ℝ :=
  (scheduledCutProcess cs ε M deadline start hn s k x).birthCreditLoss p

theorem scheduledCutCreditLoss_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B) (p : Grid n) (k : ℕ) :
    Measurable (scheduledCutCreditLoss cs ε M deadline start hn s p k) :=
  (ProcessState.birthCreditLoss_measurable p).comp (scheduledCutProcess_measurable cs ε M deadline start hn s k)

theorem scheduledCutCreditLoss_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (s : GoodPhaseObservation n B) (p : Grid n) (k : ℕ)
    (x : BoardClockPath n×ℝ) :
    0≤scheduledCutCreditLoss cs ε M deadline start hn s p k x ∧
      scheduledCutCreditLoss cs ε M deadline start hn s p k x≤B := by
  have hc := scheduledCutCredit_bounds cs ε M deadline start hn s p k x
  have hl := (scheduledCutProcess cs ε M deadline start hn s k x).birthCreditLoss_bounds p hc.1
  exact ⟨hl.1,hl.2.trans hc.2⟩

theorem scheduledCutCreditLoss_integrable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 0<B) (s : GoodPhaseObservation n B)
    (p : Grid n) (k : ℕ) (t : ℝ) :
    Integrable (fun ω=>scheduledCutCreditLoss cs ε M deadline start hn s p k (ω,t)) (boardClockMeasure n (B/n)) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos hB (by exact_mod_cast hn))
  exact GenericCreditIteration.bounded_nonnegative_integrable _ _
    ((scheduledCutCreditLoss_measurable cs ε M deadline start hn s p k).comp (measurable_id.prodMk measurable_const))
    B (fun ω=>scheduledCutCreditLoss_bounds cs ε M deadline start hn s p k (ω,t))

def scheduledCutUnavailableEvent {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) :
    Set (BoardClockPath n) :=
  {ω | (scheduledCutProcess cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) k (ω,t)).birthUnavailable p}

theorem scheduledCutUnavailableEvent_measurableSet {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) :
    MeasurableSet (scheduledCutUnavailableEvent cs ε M deadline start hn hB p k t) :=
  (ProcessState.birthUnavailable_measurableSet p).preimage
    ((scheduledCutProcess_measurable cs ε M deadline start hn _ k).comp (measurable_id.prodMk measurable_const))

def scheduledCutLossProbability {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) : ℝ :=
  (scheduledCutPointMeasure cs ε M deadline start hn hB p k t).real
    (scheduledCutUnavailableEvent cs ε M deadline start hn hB p k t)

theorem scheduledCutLossProbability_eq_mean {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) :
    scheduledCutLossProbability cs ε M deadline start hn hB p k t=
      ∫ω,scheduledCutCreditLoss cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) p k (ω,t)
        ∂boardClockMeasure n (B/n) := by
  have hi := scheduledCutCredit_integrable cs ε M deadline start hn (lt_of_lt_of_le zero_lt_one hB)
    (initialGoodPhaseObservation B hB deadline start) p k t
  have hE := scheduledCutUnavailableEvent_measurableSet cs ε M deadline start hn hB p k t
  rw [scheduledCutLossProbability,scheduledCutPointMeasure,savedCreditMeasure_real_apply _ _ hi
    (fun ω=>(scheduledCutCredit_bounds cs ε M deadline start hn _ p k (ω,t)).1) _ hE]
  rw [←integral_indicator hE]
  apply integral_congr_ae
  exact Filter.Eventually.of_forall (fun ω=>by
    simp only [scheduledCutCreditLoss,ProcessState.birthCreditLoss,scheduledCutUnavailableEvent,
      Set.indicator,Set.mem_setOf_eq]
    rfl)

theorem scheduledCutLossProbability_measurable {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) :
    Measurable (scheduledCutLossProbability cs ε M deadline start hn hB p k) := by
  letI := boardClockMeasure_probability n (B/n) (div_pos (lt_of_lt_of_le zero_lt_one hB) (by exact_mod_cast hn))
  have he := funext (scheduledCutLossProbability_eq_mean cs ε M deadline start hn hB p k)
  rw [he]
  exact ((scheduledCutCreditLoss_measurable cs ε M deadline start hn _ p k).comp measurable_swap).stronglyMeasurable.integral_prod_right'.measurable

theorem scheduledCutLossProbability_bounds {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) :
    0≤scheduledCutLossProbability cs ε M deadline start hn hB p k t ∧
      scheduledCutLossProbability cs ε M deadline start hn hB p k t≤1 := by
  rw [scheduledCutLossProbability_eq_mean]
  refine ⟨integral_nonneg (fun ω=>(scheduledCutCreditLoss_bounds cs ε M deadline start hn _ p k (ω,t)).1),?_⟩
  have hB0 := lt_of_lt_of_le zero_lt_one hB
  let s := initialGoodPhaseObservation B hB deadline start
  have hh := integral_mono (scheduledCutCreditLoss_integrable cs ε M deadline start hn hB0 s p k t)
    (scheduledCutCredit_integrable cs ε M deadline start hn hB0 s p k t)
    (fun ω=>(scheduledCutProcess cs ε M deadline start hn s k (ω,t)).birthCreditLoss_bounds p
      (scheduledCutCredit_bounds cs ε M deadline start hn s p k (ω,t)).1 |>.2)
  exact hh.trans_eq (initial_scheduledCutCredit_mean cs ε M deadline start hn hB p k t)

theorem scheduledCut_birthRate_mean_loss {n : ℕ} {B : ℝ} (cs : ℕ→SharedPhase n B) (ε M : ℝ)
    (deadline : Grid n→ℝ) (start : ℝ) (hn : 0<n) (hB : 1≤B) (p : Grid n) (k : ℕ) (t : ℝ) :
    (∫ω,(scheduledCutProcess cs ε M deadline start hn (initialGoodPhaseObservation B hB deadline start) k (ω,t)).birthRate (cs k).mask p
      ∂boardClockMeasure n (B/n))=(cs k).mask p/n-((cs k).mask p/n)*scheduledCutLossProbability cs ε M deadline start hn hB p k t := by
  simp_rw [ProcessState.birthRate_credit_loss]
  change (∫ω,((cs k).mask p/n)*(scheduledCutCredit cs ε M deadline start hn _ p k (ω,t)-
    scheduledCutCreditLoss cs ε M deadline start hn _ p k (ω,t)) ∂boardClockMeasure n (B/n))=_
  have hB0 := lt_of_lt_of_le zero_lt_one hB
  rw [integral_const_mul,integral_sub (scheduledCutCredit_integrable cs ε M deadline start hn hB0 _ p k t)
    (scheduledCutCreditLoss_integrable cs ε M deadline start hn hB0 _ p k t),
    initial_scheduledCutCredit_mean,←scheduledCutLossProbability_eq_mean]
  ring

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLossProbability_measurable
#print axioms NoThreeLine.BirthWitness.scheduledCut_birthRate_mean_loss
