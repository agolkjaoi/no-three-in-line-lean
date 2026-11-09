import NoThreeLine.ScheduledCutLineCreditRegularity
import NoThreeLine.PhasePointHistory

/-! The canonical actual process has 1-r equal to all earlier phase
rate integrals plus the current partial integral. The identity is transported
to any full terminal point law, and the time/path null sets are commuted
using joint measurability rather than an all-path or all-time assertion. -/
set_option autoImplicit false
set_option maxHeartbeats 1000000
noncomputable section
open MeasureTheory Set

namespace NoThreeLine.BirthWitness
open AuxiliaryODE

theorem initialGoodPhaseObservation_lineCredits {n : ℕ} (B : ℝ) (hB : 1 ≤ B)
    (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) :
    (initialGoodPhaseObservation B hB deadline start).val.1.val.physical.lineCredits L = 1 := by
  change (augInitialState B hB deadline start).val.physical.lineCredits L = 1
  unfold augInitialState
  rw [augValidDeadlineRetirement_lineCredits]
  rfl

theorem initial_scheduledCutLineCredit_one_sub_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (hB : 1 ≤ B) (N : ℕ) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (cs N).horizon) :
    ∀ᵐ ω ∂boardClockMeasure n (B/n),
      1-scheduledCutLineCreditValue cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t) =
      scheduledCutLineCreditCumulative cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t) := by
  have hh := scheduledCutLineCredit_decrement_integral_ae cs ε M deadline start L hn
    (zero_lt_one.trans_le hB) (initialGoodPhaseObservation B hB deadline start) N t ht
  filter_upwards [hh] with ω hω
  rw [initialGoodPhaseObservation_lineCredits] at hω
  simpa only [scheduledCutLineCreditValue, scheduledCutLineCreditCumulative, max_eq_right ht.1] using hω

theorem phasePoint_scheduledCutLineCredit_one_sub_ae {n : ℕ} {B : ℝ} (cs : ℕ → SharedPhase n B)
    (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ) (L : LineIndex n) (hn : 0 < n)
    (hB : 1 ≤ B) (p : Grid n) (N J : ℕ) (t : ℝ) (ht : t ∈ Icc (0 : ℝ) (cs N).horizon) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB p J,
      1-scheduledCutLineCreditValue cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t) =
      scheduledCutLineCreditCumulative cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t) :=
  (phasePointMeasure_absolutelyContinuous cs ε M deadline start hn hB p J).ae_le
    (initial_scheduledCutLineCredit_one_sub_ae cs ε M deadline start L hn hB N t ht)

theorem phasePoint_scheduledCutLineCredit_one_sub_ae_path_time {n : ℕ} {B : ℝ}
    (cs : ℕ → SharedPhase n B) (ε M : ℝ) (deadline : Grid n → ℝ) (start : ℝ)
    (L : LineIndex n) (hn : 0 < n) (hB : 1 ≤ B) (p : Grid n) (N J : ℕ) :
    ∀ᵐ ω ∂phasePointMeasure cs ε M deadline start hn hB p J, ∀ᵐ t : ℝ ∂volume,
      t ∈ Icc (0 : ℝ) (cs N).horizon →
      1-scheduledCutLineCreditValue cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t) =
      scheduledCutLineCreditCumulative cs ε M deadline start L hn
        (initialGoodPhaseObservation B hB deadline start) N (ω,t) := by
  let s := initialGoodPhaseObservation B hB deadline start
  let μ := phasePointMeasure cs ε M deadline start hn hB p J
  letI : IsProbabilityMeasure μ := phasePointMeasure_probability cs ε M deadline start hn hB p J
  let f := fun x : BoardClockPath n × ℝ => 1-scheduledCutLineCreditValue cs ε M deadline start L hn s N x
  let g := scheduledCutLineCreditCumulative cs ε M deadline start L hn s N
  have hf : Measurable f := measurable_const.sub (scheduledCutLineCreditValue_measurable cs ε M deadline start L hn s N)
  have hg : Measurable g := scheduledCutLineCreditCumulative_measurable cs ε M deadline start L hn s N
  have hP : MeasurableSet {x : BoardClockPath n × ℝ | x.2 ∈ Icc (0 : ℝ) (cs N).horizon → f x=g x} := by
    have hh := ((measurableSet_Icc : MeasurableSet (Icc (0 : ℝ) (cs N).horizon)).preimage
      (measurable_snd : Measurable (Prod.snd : BoardClockPath n × ℝ → ℝ))).compl.union
      (measurableSet_eq_fun hf hg)
    convert hh using 1
    ext x
    simp [imp_iff_not_or]
  change ∀ᵐ ω ∂μ, ∀ᵐ t : ℝ ∂volume, t ∈ Icc (0 : ℝ) (cs N).horizon → f (ω,t)=g (ω,t)
  apply (Measure.ae_ae_comm hP).mpr
  apply Filter.Eventually.of_forall
  intro t
  by_cases ht : t ∈ Icc (0 : ℝ) (cs N).horizon
  · exact (phasePoint_scheduledCutLineCredit_one_sub_ae cs ε M deadline start L hn hB p N J t ht).mono
      (fun ω hω _ => hω)
  · exact Filter.Eventually.of_forall (fun _ hmem => False.elim (ht hmem))

end NoThreeLine.BirthWitness

#print axioms NoThreeLine.BirthWitness.initial_scheduledCutLineCredit_one_sub_ae
#print axioms NoThreeLine.BirthWitness.phasePoint_scheduledCutLineCredit_one_sub_ae
#print axioms NoThreeLine.BirthWitness.phasePoint_scheduledCutLineCredit_one_sub_ae_path_time
