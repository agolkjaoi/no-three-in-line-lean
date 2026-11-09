import NoThreeLine.AugmentedCappedSegment

/-! Chronological state with actual eta retained between segments.
A stop freezes remaining time, so the actual stopping time is retained. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE

abbrev AugTimedState {n : ℕ} (cfg : FlowConfig n) :=
  {x : AugmentedState n × ℝ // x.1.Valid cfg.B ∧ 0 ≤ x.2 ∧ x.2 ≤ cfg.horizon}

def augTimedInput {n : ℕ} (cfg : FlowConfig n) (s : AugTimedState cfg) : AugmentedCappedInput cfg :=
  ((⟨s.val.1.physical,(coordinateBounds_norm_le cfg.B _ s.property.1.1.2.1).trans cfg.box_large.le⟩,
    s.val.1.eta),s.val.2)

theorem augTimedInput_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (augTimedInput cfg) := by
  apply Measurable.prodMk
  · exact (((AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst).subtype_mk).prodMk
      ((AugmentedState.measurable_eta n).comp measurable_subtype_coe.fst)
  · exact measurable_subtype_coe.snd

def augTimedStepPair {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × ((ℝ × Grid n) × ℝ)) : AugmentedState n × ℝ :=
  if x.1.val.2 ≤ 0 ∨ x.1.val.1.physical.process.stopped = true then x.1.val
  else (augOutcome cfg ε M (augTimedInput cfg x.1,x.2),
    x.1.val.2 - augAdvance cfg ε M (augTimedInput cfg x.1,x.2.1.1))

theorem augTimedStepPair_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (augTimedStepPair cfg ε M) := by
  unfold augTimedStepPair
  apply Measurable.ite
  · exact (measurableSet_le (measurable_subtype_coe.snd.comp measurable_fst) measurable_const).union
      (measurableSet_eq_fun ((ProcessState.measurable_stopped n).comp
        ((ExtendedState.measurable_process n).comp ((AugmentedState.measurable_physical n).comp
          (measurable_subtype_coe.fst.comp measurable_fst)))) measurable_const)
  · exact measurable_subtype_coe.comp measurable_fst
  · exact ((augOutcome_measurable cfg ε M).comp
      (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd)).prodMk
      ((measurable_subtype_coe.snd.comp measurable_fst).sub
        ((augAdvance_measurable cfg ε M).comp
          (((augTimedInput_measurable cfg).comp measurable_fst).prodMk measurable_snd.fst.fst)))

theorem augTimedStepPair_valid {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × ((ℝ × Grid n) × ℝ)) :
    (augTimedStepPair cfg ε M x).1.Valid cfg.B ∧ 0 ≤ (augTimedStepPair cfg ε M x).2 ∧
      (augTimedStepPair cfg ε M x).2 ≤ cfg.horizon := by
  unfold augTimedStepPair
  split_ifs
  · exact x.1.property
  · have ha := augAdvance_mem cfg ε M (augTimedInput cfg x.1) x.1.property.1.1 x.2.1.1
    have hb := ha.2.trans (augGuardTime_le_remaining cfg ε M (augTimedInput cfg x.1) x.1.property.2.1)
    refine ⟨augOutcome_valid cfg ε M _ x.1.property.1.1 x.1.property.1.2 _,sub_nonneg.mpr hb,?_⟩
    exact (sub_le_self _ ha.1).trans x.1.property.2.2

def augTimedStep {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (x : AugTimedState cfg × ((ℝ × Grid n) × ℝ)) : AugTimedState cfg :=
  ⟨augTimedStepPair cfg ε M x,augTimedStepPair_valid cfg ε M x⟩

theorem augTimedStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) :
    Measurable (augTimedStep cfg ε M) := (augTimedStepPair_measurable cfg ε M).subtype_mk

theorem augTimedStep_remaining_le {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (x : (ℝ × Grid n) × ℝ) :
    (augTimedStep cfg ε M (s,x)).val.2 ≤ s.val.2 := by
  change (augTimedStepPair cfg ε M (s,x)).2 ≤ _
  unfold augTimedStepPair
  split_ifs
  · exact le_rfl
  · exact sub_le_self _ (augAdvance_mem cfg ε M _ s.property.1.1 x.1.1).1

theorem augTimedStep_finished {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (hs : s.val.2 = 0) (x : (ℝ × Grid n) × ℝ) :
    augTimedStep cfg ε M (s,x) = s := by
  apply Subtype.ext
  simp only [augTimedStep,augTimedStepPair,hs,le_refl,true_or,if_true]

theorem augTimedStep_stopped {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (hs : s.val.1.physical.process.stopped = true) (x : (ℝ × Grid n) × ℝ) :
    augTimedStep cfg ε M (s,x) = s := by
  apply Subtype.ext
  simp only [augTimedStep,augTimedStepPair,hs,or_true,if_true]

def augTimedCredit {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : AugTimedState cfg) : ℝ :=
  (s.val.1.physical.process.accounts p).credit

theorem augTimedCredit_measurable {n : ℕ} (cfg : FlowConfig n) (p : Grid n) :
    Measurable (augTimedCredit cfg p) :=
  CreditAccount.measurable_credit.comp ((ProcessState.measurable_account n p).comp
    ((ExtendedState.measurable_process n).comp
      ((AugmentedState.measurable_physical n).comp measurable_subtype_coe.fst)))

theorem augTimedCredit_bounds {n : ℕ} (cfg : FlowConfig n) (p : Grid n) (s : AugTimedState cfg) :
    0 ≤ augTimedCredit cfg p s ∧ augTimedCredit cfg p s ≤ cfg.B :=
  (s.val.1.physical.process.accounts p).credit_bounds cfg.B (s.property.1.1.2.1.1 p)

def augTimedClockStep {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (x : AugTimedState cfg × BoardClockPath n) : AugTimedState cfg :=
  augTimedStep cfg ε M (x.1,WinnerMarkLaw.firstMarkedRace hn x.2)

theorem augTimedClockStep_measurable {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n) :
    Measurable (augTimedClockStep cfg ε M hn) :=
  (augTimedStep_measurable cfg ε M).comp
    (measurable_fst.prodMk ((WinnerMarkLaw.firstMarkedRace_measurable hn).comp measurable_snd))

theorem augTimedClockStep_credit {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ) (hn : 0 < n)
    (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (s : AugTimedState cfg) (p : Grid n) :
    (∫ ω, augTimedCredit cfg p (augTimedClockStep cfg ε M hn (s,ω)) ∂boardClockMeasure n (cfg.B/n)) =
      augTimedCredit cfg p s := by
  by_cases hs : s.val.2 ≤ 0 ∨ s.val.1.physical.process.stopped = true
  · letI := boardClockMeasure_probability n (cfg.B/n) (div_pos hB (by exact_mod_cast hn))
    simp only [augTimedClockStep,augTimedStep,augTimedStepPair,if_pos hs,augTimedCredit]
    simp
  · simp only [augTimedClockStep,augTimedStep,augTimedStepPair,if_neg hs,augTimedCredit]
    exact augOutcome_first_credit cfg ε M (augTimedInput cfg s) hn hB hm s.property.1.1 p

theorem augTimedStep_eta_lower {n : ℕ} (cfg : FlowConfig n) (ε M : ℝ)
    (s : AugTimedState cfg) (x : (ℝ × Grid n) × ℝ) (a b : Grid n) (hab : a ≠ b)
    (hinit : 1-ε ≤ s.val.1.eta a b) : 1-ε ≤ (augTimedStep cfg ε M (s,x)).val.1.eta a b := by
  change 1-ε ≤ (augTimedStepPair cfg ε M (s,x)).1.eta a b
  unfold augTimedStepPair
  split_ifs
  · exact hinit
  · exact augOutcome_eta_lower cfg ε M _ s.property.1.1 a b hab hinit x

end NoThreeLine

#print axioms NoThreeLine.augTimedStep_measurable
#print axioms NoThreeLine.augTimedStep_stopped
#print axioms NoThreeLine.augTimedClockStep_credit
#print axioms NoThreeLine.augTimedStep_eta_lower
