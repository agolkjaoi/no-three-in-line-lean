import NoThreeLine.TimedTermination
import Mathlib.Probability.Kernel.Defs

/-! Joint initial-state/noise measurability of the constructed timed
terminal selector, and the actual fixed-phase Markov kernel on valid
extended states. Its credit mean is supplied by proved termination. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem timedNoiseState_joint_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : TimedState cfg × (ℕ → BoardClockPath n) => timedNoiseState cfg hn a.1 k a.2) :=
  (GenericCreditIteration.finiteState_measurable _ (timedClockStep_measurable cfg hn) k).comp
    (measurable_fst.prodMk ((GenericCreditIteration.noisePrefix_measurable k).comp measurable_snd))

theorem timedCompletionPredicate_joint_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : TimedState cfg × (ℕ → BoardClockPath n) =>
      timedCompletionPredicate cfg hn a.1 k a.2) := by
  have hm (j : ℕ) : Measurable (fun a : TimedState cfg × (ℕ → BoardClockPath n) =>
      TimedDone cfg (timedNoiseState cfg hn a.1 j a.2)) :=
    (timedDone_measurable cfg).comp (timedNoiseState_joint_measurable cfg hn j)
  exact (hm k).or (Measurable.exists hm).not

theorem timedCompletionIndex_joint_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) :
    Measurable (fun a : TimedState cfg × (ℕ → BoardClockPath n) =>
      timedCompletionIndex cfg hn a.1 a.2) := by
  classical
  exact measurable_find (fun a : TimedState cfg × (ℕ → BoardClockPath n) =>
    timedCompletionPredicate_exists cfg hn a.1 a.2)
      (fun k => measurableSet_setOf.mpr (timedCompletionPredicate_joint_measurable cfg hn k))

theorem timedTerminal_joint_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) :
    Measurable (fun a : TimedState cfg × (ℕ → BoardClockPath n) => timedTerminal cfg hn a.1 a.2) := by
  classical
  exact Measurable.find (timedNoiseState_joint_measurable cfg hn)
    (fun k => measurableSet_setOf.mpr (timedCompletionPredicate_joint_measurable cfg hn k))
    (fun a : TimedState cfg × (ℕ → BoardClockPath n) => timedCompletionPredicate_exists cfg hn a.1 a.2)

theorem timedTerminal_eq_of_done {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (s : TimedState cfg) (hs : TimedDone cfg s) (ω : ℕ → BoardClockPath n) :
    timedTerminal cfg hn s ω = s := by
  have h := timedNoiseState_absorbing cfg hn s ω 0 (by simpa only [timedNoiseState_zero] using hs)
    (timedCompletionIndex cfg hn s ω) (Nat.zero_le _)
  exact h

abbrev ValidExtendedState (n : ℕ) (B : ℝ) := {e : ExtendedState n // e.Valid B}

def phaseStart {n : ℕ} (cfg : FlowConfig n) (e : ValidExtendedState n cfg.B) : TimedState cfg :=
  ⟨(e.val,cfg.horizon),e.property,cfg.horizon.coe_nonneg,le_rfl⟩

theorem phaseStart_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (phaseStart cfg) :=
  (measurable_subtype_coe.prodMk measurable_const).subtype_mk

def phaseTimedTerminal {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (a : ValidExtendedState n cfg.B × (ℕ → BoardClockPath n)) : TimedState cfg :=
  timedTerminal cfg hn (phaseStart cfg a.1) a.2

theorem phaseTimedTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) :
    Measurable (phaseTimedTerminal cfg hn) :=
  (timedTerminal_joint_measurable cfg hn).comp
    (((phaseStart_measurable cfg).comp measurable_fst).prodMk measurable_snd)

def phaseTerminal {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (a : ValidExtendedState n cfg.B × (ℕ → BoardClockPath n)) : ValidExtendedState n cfg.B :=
  ⟨(phaseTimedTerminal cfg hn a).val.1,(phaseTimedTerminal cfg hn a).property.1⟩

theorem phaseTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) :
    Measurable (phaseTerminal cfg hn) :=
  ((measurable_subtype_coe.comp (phaseTimedTerminal_measurable cfg hn)).fst).subtype_mk

theorem phaseTerminal_valid {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (e : ValidExtendedState n cfg.B) (ω : ℕ → BoardClockPath n) :
    (phaseTerminal cfg hn (e,ω)).val.Valid cfg.B := (phaseTerminal cfg hn (e,ω)).property

def validStateCredit {n : ℕ} (B : ℝ) (p : Grid n) (e : ValidExtendedState n B) : ℝ :=
  (e.val.process.accounts p).credit

theorem validStateCredit_measurable {n : ℕ} (B : ℝ) (p : Grid n) : Measurable (validStateCredit B p) :=
  CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
    ((ExtendedState.measurable_process n).comp measurable_subtype_coe))

theorem validStateCredit_bounds {n : ℕ} (B : ℝ) (p : Grid n) (e : ValidExtendedState n B) :
    0 ≤ validStateCredit B p e ∧ validStateCredit B p e ≤ B :=
  (e.val.process.accounts p).credit_bounds B (e.property.2.1.1 p)

theorem phaseTerminal_expected_credit {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (e : ValidExtendedState n cfg.B) (p : Grid n) :
    (∫ ω, validStateCredit cfg.B p (phaseTerminal cfg hn (e,ω))
      ∂FreshBoardWaits.freshBoardMeasure n (cfg.B/n)) = validStateCredit cfg.B p e :=
  timedTerminal_expected_credit cfg hn hB hm (phaseStart cfg e) p

theorem phaseTimedTerminal_done_ae {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (e : ValidExtendedState n cfg.B) :
    ∀ᵐ ω ∂FreshBoardWaits.freshBoardMeasure n (cfg.B/n), TimedDone cfg (phaseTimedTerminal cfg hn (e,ω)) :=
  timedTerminal_done_ae cfg hn hB (phaseStart cfg e)

theorem phaseTerminal_stopped {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (e : ValidExtendedState n cfg.B) (he : e.val.process.stopped = true) (ω : ℕ → BoardClockPath n) :
    phaseTerminal cfg hn (e,ω) = e := by
  have hs : TimedDone cfg (phaseStart cfg e) := Or.inr he
  have ht := timedTerminal_eq_of_done cfg hn (phaseStart cfg e) hs ω
  apply Subtype.ext
  exact congrArg (fun s : TimedState cfg => s.val.1) ht

theorem phaseTerminal_zero_horizon {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hh : cfg.horizon = 0) (e : ValidExtendedState n cfg.B) (ω : ℕ → BoardClockPath n) :
    phaseTerminal cfg hn (e,ω) = e := by
  have hs : TimedDone cfg (phaseStart cfg e) := Or.inl (by simp [phaseStart,hh])
  have ht := timedTerminal_eq_of_done cfg hn (phaseStart cfg e) hs ω
  apply Subtype.ext
  exact congrArg (fun s : TimedState cfg => s.val.1) ht

theorem phaseNoise_probability {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) (hB : 0 < cfg.B) :
    IsProbabilityMeasure (FreshBoardWaits.freshBoardMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  unfold FreshBoardWaits.freshBoardMeasure
  infer_instance

def phaseKernel {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) (hB : 0 < cfg.B) :
    Kernel (ValidExtendedState n cfg.B) (ValidExtendedState n cfg.B) where
  toFun e := (FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map (fun ω => phaseTerminal cfg hn (e,ω))
  measurable' := by
    letI := phaseNoise_probability cfg hn hB
    apply Measure.measurable_of_measurable_coe
    intro A hA
    have hf (e : ValidExtendedState n cfg.B) : Measurable (fun ω => phaseTerminal cfg hn (e,ω)) :=
      (phaseTerminal_measurable cfg hn).comp (measurable_const.prodMk measurable_id)
    simp_rw [Measure.map_apply (hf _) hA]
    exact measurable_measure_prodMk_left (hA.preimage (phaseTerminal_measurable cfg hn))

theorem phaseKernel_apply {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) (hB : 0 < cfg.B)
    (e : ValidExtendedState n cfg.B) :
    phaseKernel cfg hn hB e = (FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
      (fun ω => phaseTerminal cfg hn (e,ω)) := rfl

instance phaseKernel_markov {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) (hB : 0 < cfg.B) :
    IsMarkovKernel (phaseKernel cfg hn hB) := by
  letI := phaseNoise_probability cfg hn hB
  constructor
  intro e
  change IsProbabilityMeasure ((FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
    (fun ω => phaseTerminal cfg hn (e,ω)))
  exact Measure.isProbabilityMeasure_map
    ((phaseTerminal_measurable cfg hn).comp (measurable_const.prodMk measurable_id)).aemeasurable

theorem phaseKernel_expected_credit {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (e : ValidExtendedState n cfg.B) (p : Grid n) :
    (∫ e', validStateCredit cfg.B p e' ∂phaseKernel cfg hn hB e) = validStateCredit cfg.B p e := by
  have hf : Measurable (fun ω => phaseTerminal cfg hn (e,ω)) :=
    (phaseTerminal_measurable cfg hn).comp (measurable_const.prodMk measurable_id)
  rw [phaseKernel_apply, integral_map_of_stronglyMeasurable hf
    (validStateCredit_measurable cfg.B p).stronglyMeasurable]
  exact phaseTerminal_expected_credit cfg hn hB hm e p

end NoThreeLine

#print axioms NoThreeLine.timedTerminal_joint_measurable
#print axioms NoThreeLine.phaseTerminal_expected_credit
#print axioms NoThreeLine.phaseKernel_expected_credit
