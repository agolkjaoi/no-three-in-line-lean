import NoThreeLine.SegmentProgress

/-! Cap a fixed, measurably selected flow by an arbitrary remaining time.
No new flow is selected from a history-dependent real-valued horizon. -/
set_option autoImplicit false
noncomputable section
open MeasureTheory Set ProbabilityTheory

namespace NoThreeLine
open AuxiliaryODE

abbrev CappedInput {n : ℕ} (cfg : FlowConfig n) := StateBall n cfg.box × ℝ

def cappedGuardTime {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg) : ℝ := segmentTime cfg x

def cappedAdvance {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg × ℝ) : ℝ :=
  max 0 (min (cappedGuardTime cfg x.1) x.2)

def cappedPreState {n : ℕ} (cfg : FlowConfig n)
    (x : CappedInput cfg × ((ℝ × Grid n) × ℝ)) : ExtendedState n :=
  selectedTrajectory cfg (x.1.1,cappedAdvance cfg (x.1,x.2.1.1))

def cappedOutcome {n : ℕ} (cfg : FlowConfig n)
    (x : CappedInput cfg × ((ℝ × Grid n) × ℝ)) : ExtendedState n :=
  if 0 < x.2.1.1 ∧ x.2.1.1 ≤ cappedGuardTime cfg x.1 then
    ((cappedPreState cfg x).candidateUpdate cfg.directions cfg.mask cfg.B x.2.1.2
      (fun _ => false) x.2.2).resolve cfg.directions cfg.B cfg.K cfg.rho
  else (cappedPreState cfg x).resolve cfg.directions cfg.B cfg.K cfg.rho

theorem cappedGuardTime_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (cappedGuardTime cfg) :=
  segmentTime_measurable cfg

theorem cappedAdvance_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (cappedAdvance cfg) :=
  measurable_const.max (((cappedGuardTime_measurable cfg).comp measurable_fst).min measurable_snd)

theorem cappedPreState_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (cappedPreState cfg) :=
  (selectedTrajectory_measurable cfg).comp
    (measurable_fst.fst.prodMk ((cappedAdvance_measurable cfg).comp
      (measurable_fst.prodMk measurable_snd.fst.fst)))

theorem cappedOutcome_measurable {n : ℕ} (cfg : FlowConfig n) : Measurable (cappedOutcome cfg) := by
  unfold cappedOutcome
  apply Measurable.ite
  · exact (measurableSet_lt measurable_const measurable_snd.fst.fst).inter
      (measurableSet_le measurable_snd.fst.fst ((cappedGuardTime_measurable cfg).comp measurable_fst))
  · apply (ExtendedState.measurable_resolve cfg.directions cfg.B cfg.K cfg.rho).comp
    exact (ExtendedState.measurable_candidateUpdate cfg.directions cfg.mask cfg.B).comp
      ((((cappedPreState_measurable cfg).prodMk measurable_const).prodMk measurable_snd.snd).prodMk
        measurable_snd.fst.snd)
  · exact (ExtendedState.measurable_resolve cfg.directions cfg.B cfg.K cfg.rho).comp
      (cappedPreState_measurable cfg)

theorem cappedGuardTime_mem {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (he : x.1.val.Valid cfg.B) : cappedGuardTime cfg x ∈ Icc (0 : ℝ) (selectedGuardTime cfg x.1) :=
  segmentTime_mem cfg x.1 he x.2

theorem cappedAdvance_mem {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (he : x.1.val.Valid cfg.B) (t : ℝ) :
    cappedAdvance cfg (x,t) ∈ Icc (0 : ℝ) (cappedGuardTime cfg x) :=
  ⟨le_max_left _ _,max_le (cappedGuardTime_mem cfg x he).1 (min_le_left _ _)⟩

theorem cappedAdvance_le_remaining {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (hH : 0 ≤ x.2) (he : x.1.val.Valid cfg.B) (t : ℝ) : cappedAdvance cfg (x,t) ≤ x.2 :=
  (cappedAdvance_mem cfg x he t).2.trans (max_le hH (min_le_right _ _))

theorem cappedPreState_valid {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (he : x.1.val.Valid cfg.B) (z : (ℝ × Grid n) × ℝ) : (cappedPreState cfg (x,z)).Valid cfg.B := by
  have ha := cappedAdvance_mem cfg x he z.1.1
  exact selectedTrajectory_valid cfg x.1 he _ ⟨ha.1,ha.2.trans (cappedGuardTime_mem cfg x he).2⟩

theorem cappedOutcome_valid {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (he : x.1.val.Valid cfg.B) (z : (ℝ × Grid n) × ℝ) : (cappedOutcome cfg (x,z)).Valid cfg.B := by
  have hpre := cappedPreState_valid cfg x he z
  unfold cappedOutcome
  split_ifs
  · exact ExtendedState.resolve_valid _ _ _ _ _ (ExtendedState.candidateUpdate_valid _ _ _ _ _ _ _ hpre)
  · exact ExtendedState.resolve_valid _ _ _ _ _ hpre

theorem cappedOutcome_clears_pending {n : ℕ} (cfg : FlowConfig n)
    (x : CappedInput cfg × ((ℝ × Grid n) × ℝ)) :
    ¬pendingBoundary (cappedOutcome cfg x).process cfg.directions cfg.B cfg.K cfg.rho
      (cappedOutcome cfg x).clocks (cappedOutcome cfg x).lineCredits (cappedOutcome cfg x).handled := by
  unfold cappedOutcome
  split_ifs <;> exact ExtendedState.resolve_clears_pending _ _ _ _ _

theorem cappedCurve_first_credit {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (he : x.1.val.Valid cfg.B)
    (p : Grid n) :
    (∫ ω, x.1.val.process.firstCreditObservable cfg.directions cfg.mask cfg.B
      (cappedGuardTime cfg x) (fun t => (selectedCurve cfg (x.1,t)).1) p
        (WinnerMarkLaw.firstMarkedRace hn ω) ∂boardClockMeasure n (cfg.B/n)) =
      (x.1.val.process.accounts p).credit := by
  obtain ⟨hinit,htime,hder,hbefore,hcontact⟩ := selectedCurve_spec cfg x.1 he.2.1
  have hcap := cappedGuardTime_mem cfg x he
  have hc : Continuous (fun t : ℝ => selectedCurve cfg (x.1,t)) := by
    change Continuous (fun t : ℝ => (selectedModeFlow cfg x.1.val.mode).curve (stateInitialBall x.1,t))
    exact (selectedModeFlow cfg x.1.val.mode).continuous_curve.comp (continuous_const.prodMk continuous_id)
  have hd : ∀ t ∈ Ioo (0 : ℝ) (cappedGuardTime cfg x),
      HasDerivAt (fun t => selectedCurve cfg (x.1,t))
        (vectorField x.1.val.process cfg.directions cfg.mask (selectedCurve cfg (x.1,t))) t := by
    intro t ht
    exact (hder t ⟨ht.1.le,ht.2.le.trans hcap.2⟩).2.2.hasDerivAt
      (Icc_mem_nhds ht.1 (ht.2.trans_le hcap.2))
  have hwi : (selectedCurve cfg (x.1,0)).1 = (fun p => (x.1.val.process.accounts p).weight) := by
    rw [hinit]
    rfl
  exact coordinate_flow_first_candidate_credit x.1.val.process cfg.directions cfg.mask cfg.B
    ⟨cappedGuardTime cfg x,hcap.1⟩ hn hB he.1 (fun p => ⟨cfg.mask_nonneg p,hm p⟩)
    (fun t => selectedCurve cfg (x.1,t)) hc.continuousOn
    (fun t ht => (hder t ⟨ht.1,ht.2.trans hcap.2⟩).1) hwi hd p

theorem cappedOutcome_credit_eq {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (he : x.1.val.Valid cfg.B) (z : (ℝ × Grid n) × ℝ) (ht : 0 < z.1.1) (p : Grid n) :
    ((cappedOutcome cfg (x,z)).process.accounts p).credit =
      x.1.val.process.firstCreditObservable cfg.directions cfg.mask cfg.B (cappedGuardTime cfg x)
        (fun t => (selectedCurve cfg (x.1,t)).1) p z := by
  have hτ : 0 ≤ cappedGuardTime cfg x := (cappedGuardTime_mem cfg x he).1
  by_cases h : z.1.1 ≤ cappedGuardTime cfg x
  · simp only [cappedOutcome,if_pos (And.intro ht h),ExtendedState.resolve_credit]
    simp only [cappedPreState,cappedAdvance,min_eq_right h,max_eq_right ht.le,
      selectedTrajectory,ExtendedState.candidateUpdate,ExtendedState.withCoordinates,
      ProcessState.firstCreditObservable,if_pos h]
  · simp only [cappedOutcome,not_and_of_not_right _ h,if_false,ExtendedState.resolve_credit]
    simp only [cappedPreState,cappedAdvance,min_eq_left (le_of_not_ge h),max_eq_right hτ,
      selectedTrajectory,ExtendedState.withCoordinates,ProcessState.firstCreditObservable,if_neg h]

theorem cappedOutcome_first_credit {n : ℕ} (cfg : FlowConfig n) (x : CappedInput cfg)
    (hn : 0 < n) (hB : 0 < cfg.B) (hm : ∀ p, cfg.mask p ≤ 1) (he : x.1.val.Valid cfg.B)
    (p : Grid n) :
    (∫ ω, ((cappedOutcome cfg (x,WinnerMarkLaw.firstMarkedRace hn ω)).process.accounts p).credit
      ∂boardClockMeasure n (cfg.B/n)) = (x.1.val.process.accounts p).credit := by
  rw [← cappedCurve_first_credit cfg x hn hB hm he p]
  apply integral_congr_ae
  filter_upwards [BoardFirstCandidate.firstTime_ae_positive hn (cfg.B/n)
    (div_pos hB (by exact_mod_cast hn))] with ω ht
  exact cappedOutcome_credit_eq cfg x he _ ht p

end NoThreeLine

#print axioms NoThreeLine.cappedOutcome_measurable
#print axioms NoThreeLine.cappedAdvance_le_remaining
#print axioms NoThreeLine.cappedOutcome_first_credit
