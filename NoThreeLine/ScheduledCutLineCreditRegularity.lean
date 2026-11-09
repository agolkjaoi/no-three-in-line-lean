import NoThreeLine.ScheduledCutLineCreditPrefix

/-! Joint measurability of actual scheduled cut credits, rates and their
whole-prefix plus current-partial integrals. Negative elapsed arguments are
extended by zero current duration solely to define a measurable total map. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory
open scoped BigOperators

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

def scheduledCutLineCreditValue {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) (x : BoardClockPath n × ℝ) : ℝ :=
  (scheduledCutObservation cs ε M deadline start hn s N x).1.val.1.physical.lineCredits L

theorem scheduledCutLineCreditValue_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) :
    Measurable (scheduledCutLineCreditValue cs ε M deadline start L hn s N) :=
  (measurable_pi_apply L).comp ((ExtendedState.measurable_lineCredits n).comp
    ((AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.comp (scheduledCutObservation_measurable cs ε M deadline start hn s N).fst).fst))

theorem scheduledCutLineCreditRate_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) :
    Measurable (scheduledCutLineCreditRate cs ε M deadline start L hn s N) :=
  (physicalLineCreditRate_measurable (cs N).directions (cs N).mask L).comp
    ((AugmentedState.measurable_physical n).comp
      (measurable_subtype_coe.comp (scheduledCutObservation_measurable cs ε M deadline start hn s N).fst).fst)

theorem scheduledCutLineCreditRate_bounds {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (hB : 0 < B) (s : GoodPhaseObservation n B) (N : ℕ) (x : BoardClockPath n × ℝ) :
    0 ≤ scheduledCutLineCreditRate cs ε M deadline start L hn s N x ∧
      scheduledCutLineCreditRate cs ε M deadline start L hn s N x ≤ (L.val.card : ℝ)*(B/n) :=
  physicalLineCreditRate_bounds (cs N).directions (cs N).mask L _ B hB
    (fun q => ⟨(cs N).mask_nonneg q,(cs N).mask_le_one q⟩)
    (scheduledCutObservation cs ε M deadline start hn s N x).1.property.1.1

theorem scheduledCutLineCreditIntegral_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) (t : ℝ) (ht : 0 ≤ t) :
    Measurable (scheduledCutLineCreditIntegral cs ε M deadline start L hn s N t) :=
  variable_running_integral_measurable (fun _ => t) measurable_const (fun _ => ht)
    (scheduledCutLineCreditRate cs ε M deadline start L hn s N)
    (scheduledCutLineCreditRate_measurable cs ε M deadline start L hn s N)

theorem scheduledCutLineCreditIntegral_joint_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) :
    Measurable (fun x : BoardClockPath n × ℝ =>
      scheduledCutLineCreditIntegral cs ε M deadline start L hn s N (max 0 x.2) x.1) := by
  let f : (BoardClockPath n × ℝ) × ℝ → ℝ :=
    fun x => scheduledCutLineCreditRate cs ε M deadline start L hn s N (x.1.1,x.2)
  have hf : Measurable f := (scheduledCutLineCreditRate_measurable cs ε M deadline start L hn s N).comp
    (measurable_fst.fst.prodMk measurable_snd)
  have hh : Measurable (fun x : BoardClockPath n × ℝ => ∫ u in (0 : ℝ)..max 0 x.2, f (x,u)) :=
    variable_running_integral_measurable (fun x : BoardClockPath n × ℝ => max 0 x.2) (measurable_const.max measurable_snd)
      (fun x => le_max_left _ _) f hf
  exact hh

def scheduledCutLineCreditCumulative {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) (x : BoardClockPath n × ℝ) : ℝ :=
  (∑ j ∈ Finset.range N, scheduledCutLineCreditIntegral cs ε M deadline start L hn s j (cs j).horizon x.1) +
    scheduledCutLineCreditIntegral cs ε M deadline start L hn s N (max 0 x.2) x.1

theorem scheduledCutLineCreditCumulative_measurable {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (s : GoodPhaseObservation n B) (N : ℕ) :
    Measurable (scheduledCutLineCreditCumulative cs ε M deadline start L hn s N) :=
  (Finset.measurable_sum _ (fun j _ =>
    (scheduledCutLineCreditIntegral_measurable cs ε M deadline start L hn s j (cs j).horizon
      (cs j).horizon.coe_nonneg).comp measurable_fst)).add
    (scheduledCutLineCreditIntegral_joint_measurable cs ε M deadline start L hn s N)

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.scheduledCutLineCreditValue_measurable
#print axioms NoThreeLine.BirthWitness.scheduledCutLineCreditRate_bounds
#print axioms NoThreeLine.BirthWitness.scheduledCutLineCreditCumulative_measurable
