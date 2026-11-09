import NoThreeLine.CappedSegment

/-! Physical state and remaining time for chronological recursion within one
fixed mask phase. A zero remaining time or a global stop freezes the entire state. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE

abbrev TimedState {n : ℕ} (cfg : FlowConfig n) :=
  {x : ExtendedState n × ℝ // x.1.Valid cfg.B ∧ 0 ≤ x.2 ∧ x.2 ≤ cfg.horizon}

def timedInput {n : ℕ} (cfg : FlowConfig n) (s : TimedState cfg) : CappedInput cfg :=
  (⟨s.val.1,(coordinateBounds_norm_le cfg.B _ s.property.1.2.1).trans cfg.box_large.le⟩,s.val.2)

theorem timedInput_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (timedInput cfg) := by
  apply Measurable.prodMk
  · exact measurable_subtype_coe.fst.subtype_mk
  · exact measurable_subtype_coe.snd

def timedStepPair {n : ℕ} (cfg : FlowConfig n)
    (x : TimedState cfg × ((ℝ × Grid n) × ℝ)) : ExtendedState n × ℝ :=
  if x.1.val.2 ≤ 0 ∨ x.1.val.1.process.stopped = true then x.1.val
  else (cappedOutcome cfg (timedInput cfg x.1,x.2),
    x.1.val.2 - cappedAdvance cfg (timedInput cfg x.1,x.2.1.1))

theorem timedStepPair_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (timedStepPair cfg) := by
  unfold timedStepPair
  apply Measurable.ite
  · exact (measurableSet_le (measurable_subtype_coe.snd.comp measurable_fst) measurable_const).union
      (measurableSet_eq_fun
        ((ProcessState.measurable_stopped n).comp ((ExtendedState.measurable_process n).comp
          (measurable_subtype_coe.fst.comp measurable_fst))) measurable_const)
  · exact measurable_subtype_coe.comp measurable_fst
  · exact ((cappedOutcome_measurable cfg).comp
      (((timedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd)).prodMk
      ((measurable_subtype_coe.snd.comp measurable_fst).sub
        ((cappedAdvance_measurable cfg).comp
          (((timedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd.fst.fst)))

theorem timedStepPair_valid {n : ℕ} (cfg : FlowConfig n)
    (x : TimedState cfg × ((ℝ × Grid n) × ℝ)) :
    (timedStepPair cfg x).1.Valid cfg.B ∧ 0 ≤ (timedStepPair cfg x).2 ∧
      (timedStepPair cfg x).2 ≤ cfg.horizon := by
  unfold timedStepPair
  split_ifs
  · exact x.1.property
  · have ha := cappedAdvance_mem cfg (timedInput cfg x.1) x.1.property.1 x.2.1.1
    have hb := cappedAdvance_le_remaining cfg (timedInput cfg x.1)
      x.1.property.2.1 x.1.property.1 x.2.1.1
    refine ⟨cappedOutcome_valid cfg _ x.1.property.1 _,sub_nonneg.mpr hb,?_⟩
    exact (sub_le_self _ ha.1).trans x.1.property.2.2

def timedStep {n : ℕ} (cfg : FlowConfig n)
    (x : TimedState cfg × ((ℝ × Grid n) × ℝ)) : TimedState cfg :=
  ⟨timedStepPair cfg x,timedStepPair_valid cfg x⟩

theorem timedStep_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (timedStep cfg) :=
  (timedStepPair_measurable cfg).subtype_mk

theorem timedStep_remaining_le {n : ℕ} (cfg : FlowConfig n)
    (s : TimedState cfg) (x : (ℝ × Grid n) × ℝ) : (timedStep cfg (s,x)).val.2 ≤ s.val.2 := by
  change (timedStepPair cfg (s,x)).2 ≤ _
  unfold timedStepPair
  split_ifs
  · exact le_rfl
  · exact sub_le_self _ (cappedAdvance_mem cfg _ s.property.1 x.1.1).1

theorem timedStep_finished {n : ℕ} (cfg : FlowConfig n)
    (s : TimedState cfg) (hs : s.val.2 = 0) (x : (ℝ × Grid n) × ℝ) :
    timedStep cfg (s,x) = s := by
  apply Subtype.ext
  simp only [timedStep,timedStepPair,hs,le_refl,true_or,if_true]

theorem timedStep_stopped {n : ℕ} (cfg : FlowConfig n)
    (s : TimedState cfg) (hs : s.val.1.process.stopped = true) (x : (ℝ × Grid n) × ℝ) :
    timedStep cfg (s,x) = s := by
  apply Subtype.ext
  simp only [timedStep,timedStepPair,hs,or_true,if_true]

def timedCredit {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : TimedState cfg) : ℝ :=
  (s.val.1.process.accounts p).credit

theorem timedCredit_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (timedCredit cfg p) :=
  CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
    ((ExtendedState.measurable_process n).comp measurable_subtype_coe.fst))

theorem timedCredit_bounds {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : TimedState cfg) :
    0 ≤ timedCredit cfg p s ∧ timedCredit cfg p s ≤ cfg.B :=
  (s.val.1.process.accounts p).credit_bounds cfg.B (s.property.1.2.1.1 p)

def timedClockStep {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (x : TimedState cfg × BoardClockPath n) : TimedState cfg :=
  timedStep cfg (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem timedClockStep_measurable {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n) :
    Measurable (timedClockStep cfg hn) :=
  (timedStep_measurable cfg).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

theorem timedClockStep_credit {n : ℕ} (cfg : FlowConfig n) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : TimedState cfg) (p : Grid n) :
    (∫ ω, timedCredit cfg p (timedClockStep cfg hn (s,ω)) ∂boardClockMeasure n (cfg.B/n)) =
      timedCredit cfg p s := by
  by_cases hs : s.val.2 ≤ 0 ∨ s.val.1.process.stopped = true
  · letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
    simp only [timedClockStep,timedStep,timedStepPair,if_pos hs,timedCredit]
    simp
  · simp only [timedClockStep,timedStep,timedStepPair,if_neg hs,timedCredit]
    exact cappedOutcome_first_credit cfg (timedInput cfg s) hn hB hm s.property.1 p

end NoThreeLine

#print axioms NoThreeLine.timedStep_measurable
#print axioms NoThreeLine.timedStep_finished
#print axioms NoThreeLine.timedStep_stopped
#print axioms NoThreeLine.timedClockStep_credit
