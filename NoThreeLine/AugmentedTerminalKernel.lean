import NoThreeLine.AugmentedInvariants
import Mathlib.Probability.Kernel.Defs

/-! Joint initial-state/noise measurability of the constructed augTimed
terminal selector, and the actual fixed-augPhase Markov kernel on valid
extended states. Its credit mean is supplied by proved termination. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory ProbabilityTheory Set Filter

namespace NoThreeLine

theorem augTimedNoiseState_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : AugTimedState cfg × (ℕ → BoardClockPath n) => augTimedNoiseState cfg ε M hn a.1 k a.2) :=
  (GenericCreditIteration.finiteState_measurable _ (augTimedClockStep_measurable cfg ε M hn) k).comp
    (measurable_fst.prodMk ((GenericCreditIteration.noisePrefix_measurable k).comp measurable_snd))

theorem augTimedCompletionPredicate_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (k : ℕ) :
    Measurable (fun a : AugTimedState cfg × (ℕ → BoardClockPath n) =>
      augTimedCompletionPredicate cfg ε M hn a.1 k a.2) := by
  have hm (j : ℕ) : Measurable (fun a : AugTimedState cfg × (ℕ → BoardClockPath n) =>
      AugTimedDone cfg (augTimedNoiseState cfg ε M hn a.1 j a.2)) :=
    (augTimedDone_measurable cfg).comp (augTimedNoiseState_joint_measurable cfg ε M hn j)
  exact (hm k).or (Measurable.exists hm).not

theorem augTimedCompletionIndex_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (fun a : AugTimedState cfg × (ℕ → BoardClockPath n) =>
      augTimedCompletionIndex cfg ε M hn a.1 a.2) := by
  classical
  exact measurable_find (fun a : AugTimedState cfg × (ℕ → BoardClockPath n) =>
    augTimedCompletionPredicate_exists cfg ε M hn a.1 a.2)
      (fun k => measurableSet_setOf.mpr (augTimedCompletionPredicate_joint_measurable cfg ε M hn k))

theorem augTimedTerminal_joint_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (fun a : AugTimedState cfg × (ℕ → BoardClockPath n) => augTimedTerminal cfg ε M hn a.1 a.2) := by
  classical
  exact Measurable.find (augTimedNoiseState_joint_measurable cfg ε M hn)
    (fun k => measurableSet_setOf.mpr (augTimedCompletionPredicate_joint_measurable cfg ε M hn k))
    (fun a : AugTimedState cfg × (ℕ → BoardClockPath n) => augTimedCompletionPredicate_exists cfg ε M hn a.1 a.2)

theorem augTimedTerminal_eq_of_done {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (s : AugTimedState cfg) (hs : AugTimedDone cfg s) (ω : ℕ → BoardClockPath n) :
    augTimedTerminal cfg ε M hn s ω = s := by
  have h := augTimedNoiseState_absorbing cfg ε M hn s ω 0 (by simpa only [augTimedNoiseState_zero] using hs)
    (augTimedCompletionIndex cfg ε M hn s ω) (Nat.zero_le _)
  exact h

abbrev ValidAugmentedState (n : ℕ) (B : ℝ) := {e : AugmentedState n // e.Valid B}

def augPhaseStart {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (e : ValidAugmentedState n cfg.B) : AugTimedState cfg :=
  ⟨(e.val,cfg.horizon),e.property,cfg.horizon.coe_nonneg,le_rfl⟩

theorem augPhaseStart_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) : Measurable (augPhaseStart cfg ε M) :=
  (measurable_subtype_coe.prodMk measurable_const).subtype_mk

def augPhaseTimedTerminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (a : ValidAugmentedState n cfg.B × (ℕ → BoardClockPath n)) : AugTimedState cfg :=
  augTimedTerminal cfg ε M hn (augPhaseStart cfg ε M a.1) a.2

theorem augPhaseTimedTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (augPhaseTimedTerminal cfg ε M hn) :=
  (augTimedTerminal_joint_measurable cfg ε M hn).comp
    (((augPhaseStart_measurable cfg ε M).comp measurable_fst).prodMk measurable_snd)

def augPhaseTerminal {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (a : ValidAugmentedState n cfg.B × (ℕ → BoardClockPath n)) : ValidAugmentedState n cfg.B :=
  ⟨(augPhaseTimedTerminal cfg ε M hn a).val.1,(augPhaseTimedTerminal cfg ε M hn a).property.1⟩

theorem augPhaseTerminal_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (augPhaseTerminal cfg ε M hn) :=
  ((measurable_subtype_coe.comp (augPhaseTimedTerminal_measurable cfg ε M hn)).fst).subtype_mk

theorem augPhaseTerminal_valid {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n cfg.B) (ω : ℕ → BoardClockPath n) :
    (augPhaseTerminal cfg ε M hn (e,ω)).val.Valid cfg.B := (augPhaseTerminal cfg ε M hn (e,ω)).property

def validAugStateCredit {n : ℕ} (B : ℝ) (p : Grid n) (e : ValidAugmentedState n B) : ℝ :=
  (e.val.physical.process.accounts p).credit

theorem validAugStateCredit_measurable {n : ℕ} (B : ℝ) (p : Grid n) : Measurable (validAugStateCredit B p) :=
  CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
    ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp measurable_subtype_coe)))

theorem validAugStateCredit_bounds {n : ℕ} (B : ℝ) (p : Grid n) (e : ValidAugmentedState n B) :
    0 ≤ validAugStateCredit B p e ∧ validAugStateCredit B p e ≤ B :=
  (e.val.physical.process.accounts p).credit_bounds B (e.property.1.2.1.1 p)

theorem augPhaseTerminal_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (e : ValidAugmentedState n cfg.B) (p : Grid n) :
    (∫ ω, validAugStateCredit cfg.B p (augPhaseTerminal cfg ε M hn (e,ω))
      ∂FreshBoardWaits.freshBoardMeasure n (cfg.B/n)) = validAugStateCredit cfg.B p e :=
  augTimedTerminal_expected_credit cfg ε M hn hB hm (augPhaseStart cfg ε M e) p

theorem augPhaseTimedTerminal_done_ae {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (e : ValidAugmentedState n cfg.B) :
    ∀ᵐ ω ∂FreshBoardWaits.freshBoardMeasure n (cfg.B/n), AugTimedDone cfg (augPhaseTimedTerminal cfg ε M hn (e,ω)) :=
  augTimedTerminal_done_ae cfg ε M hn hB (augPhaseStart cfg ε M e)

theorem augPhaseTerminal_stopped {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (e : ValidAugmentedState n cfg.B) (he : e.val.physical.process.stopped = true) (ω : ℕ → BoardClockPath n) :
    augPhaseTerminal cfg ε M hn (e,ω) = e := by
  have hs : AugTimedDone cfg (augPhaseStart cfg ε M e) := Or.inr he
  have ht := augTimedTerminal_eq_of_done cfg ε M hn (augPhaseStart cfg ε M e) hs ω
  apply Subtype.ext
  exact congrArg (fun s : AugTimedState cfg => s.val.1) ht

theorem augPhaseTerminal_zero_horizon {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hh : cfg.horizon = 0) (e : ValidAugmentedState n cfg.B) (ω : ℕ → BoardClockPath n) :
    augPhaseTerminal cfg ε M hn (e,ω) = e := by
  have hs : AugTimedDone cfg (augPhaseStart cfg ε M e) := Or.inl (by simp [augPhaseStart,hh])
  have ht := augTimedTerminal_eq_of_done cfg ε M hn (augPhaseStart cfg ε M e) hs ω
  apply Subtype.ext
  exact congrArg (fun s : AugTimedState cfg => s.val.1) ht

theorem augPhaseNoise_probability {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (hB : 0 < cfg.B) :
    IsProbabilityMeasure (FreshBoardWaits.freshBoardMeasure n (cfg.B/n)) := by
  letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
  unfold FreshBoardWaits.freshBoardMeasure
  infer_instance

def augPhaseKernel {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (hB : 0 < cfg.B) :
    Kernel (ValidAugmentedState n cfg.B) (ValidAugmentedState n cfg.B) where
  toFun e := (FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map (fun ω => augPhaseTerminal cfg ε M hn (e,ω))
  measurable' := by
    letI := augPhaseNoise_probability cfg ε M hn hB
    apply Measure.measurable_of_measurable_coe
    intro A hA
    have hf (e : ValidAugmentedState n cfg.B) : Measurable (fun ω => augPhaseTerminal cfg ε M hn (e,ω)) :=
      (augPhaseTerminal_measurable cfg ε M hn).comp (measurable_const.prodMk measurable_id)
    simp_rw [Measure.map_apply (hf _) hA]
    exact measurable_measure_prodMk_left (hA.preimage (augPhaseTerminal_measurable cfg ε M hn))

theorem augPhaseKernel_apply {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (hB : 0 < cfg.B)
    (e : ValidAugmentedState n cfg.B) :
    augPhaseKernel cfg ε M hn hB e = (FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
      (fun ω => augPhaseTerminal cfg ε M hn (e,ω)) := rfl

instance augPhaseKernel_markov {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) (hB : 0 < cfg.B) :
    IsMarkovKernel (augPhaseKernel cfg ε M hn hB) := by
  letI := augPhaseNoise_probability cfg ε M hn hB
  constructor
  intro e
  change IsProbabilityMeasure ((FreshBoardWaits.freshBoardMeasure n (cfg.B/n)).map
    (fun ω => augPhaseTerminal cfg ε M hn (e,ω)))
  exact Measure.isProbabilityMeasure_map
    ((augPhaseTerminal_measurable cfg ε M hn).comp (measurable_const.prodMk measurable_id)).aemeasurable

theorem augPhaseKernel_expected_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (e : ValidAugmentedState n cfg.B) (p : Grid n) :
    (∫ e', validAugStateCredit cfg.B p e' ∂augPhaseKernel cfg ε M hn hB e) = validAugStateCredit cfg.B p e := by
  have hf : Measurable (fun ω => augPhaseTerminal cfg ε M hn (e,ω)) :=
    (augPhaseTerminal_measurable cfg ε M hn).comp (measurable_const.prodMk measurable_id)
  rw [augPhaseKernel_apply, integral_map_of_stronglyMeasurable hf
    (validAugStateCredit_measurable cfg.B p).stronglyMeasurable]
  exact augPhaseTerminal_expected_credit cfg ε M hn hB hm e p

end NoThreeLine

#print axioms NoThreeLine.augTimedTerminal_joint_measurable
#print axioms NoThreeLine.augPhaseTerminal_expected_credit
#print axioms NoThreeLine.augPhaseKernel_expected_credit
